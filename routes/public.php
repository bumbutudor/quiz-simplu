<?php
$app->get('/', function () use ($app) {
    $simple = $app->simple;
    $quizzes = $simple->getQuizzes();
    $categories = $simple->getCategories();
    // $subcategories = $simple->getSubCategories();
    $session = $app->session;

    $app->render('index.php', array('quizzes' => $quizzes, 'categories' => $categories, 'session' => $session));
});

$app->get('/requirements/', function () use ($app) {

    $installer = $app->installer;
    $requirements = $installer->getRequirements();
    $simple = $app->simple;
    $categories = $simple->getCategories();
    // $subcategories = $simple->getSubCategories();

    $app->render('requirements.php', array( 'categories' => $categories, 'requirements' => $requirements));

});

//route for 'get' on login or register
$app->get('/:route/', function () use ($app) {

    $flash = $app->view()->getData('flash');
    $errors = isset($flash['errors']) ? $flash['errors'] : false;

    $simple = $app->simple;
    $quizzes = $simple->getQuizzes();
    $categories = $simple->getCategories();
    // $subcategories = $simple->getSubcategories();

    $session = $app->session;
    if ($session->get('user'))
    {
        $app->redirect($app->request->getRootUri() . '/');
    }

    $app->render('login.php', array('quizzes' => $quizzes, 'categories' => $categories, 'session' => $session,
                                    'errors' => $errors));
})->conditions(array("route" => "(login|register)"));

$app->post('/login/', function () use ($app) {

    $simple = $app->simple;
    $session = $app->session;
    $errors = array();

    $email = trim($app->request()->post('email'));
    $password = trim($app->request()->post('password'));

    //need to check for 'emptiness' of inputs and display message instead of querying db
    if ((! empty($email)) && (! empty($password) ) )
    {
        if (! filter_var($email, FILTER_VALIDATE_EMAIL))
        {
            $errors['loginerror'] = "Adresa de email nu este validă. Vă rugăm să mai încercați.";
        }
        else
        {
            //pull details for this registered email
            if ($authsql = \ORM::for_table('users')->select_many('id','pass','name','level','role', 'id_moduls')->where('email',
                $email)->find_one())
            {
                //verify the password against hash
                if (! password_verify($password, $authsql->pass))
                {
                    $errors['loginerror'] = "Email-ul sau parola au fost introduse greșit. Vă rugăm să mai încercați.";
                }
                else
                {
                    if ($authsql->level == 1)
                    {
                        //we have an admin user
                        $user = new \SimpleQuiz\Utils\User\AdminUser($email, $authsql->name);
                    }
                    else
                    {
                        //registered user
                        $user = new \SimpleQuiz\Utils\User\EndUser($email, $authsql->name);
                    }

                    $user->setId($authsql->id);
                    $user->setRole($authsql->role);
                    //HDCODE
                    $user->setLevel($authsql->level);
                    $user->setModuleaccess($authsql->id_moduls);

                    $session->set('user', $user);
                    $session->regenerate();

                    $_SESSION["userModule"] = SimpleQuiz\Utils\Base\Utils::binaryCalculation($authsql->id_moduls);
                }
            }
            else
            {
                $errors['loginerror'] = "Email-ul sau parola au fost introduse greșit. Vă rugăm să mai încercați.";
            }
        }
    }
    else
    {
        $errors['loginerror'] = "Verificați dacă email-ul sau parola au fost introduse corect și încercați din nou.";
    }

    if (count($errors) > 0)
    {
        $app->flash('errors', $errors);
        $session->remove('user');
        $app->redirect($app->request->getRootUri() . '/login/');
    }

    $simple::redirect($app, $session);
});

$app->post('/register/', function () use ($app) {

    $simple = $app->simple;
    $quizzes = $simple->getQuizzes(true);
    $categories = $simple->getCategories();
    // $subcategories = $simple->getSubcategories();
    $session = $app->session;
    $errors = array();

    $username = trim($app->request()->post('username'));
    $email = trim($app->request()->post('email'));
    $password = trim($app->request()->post('regpassword'));
    $confpassword = trim($app->request()->post('regpasswordconf'));
    $moduleId = trim($app->request()->post('moduleid'));
    $category = $simple->getCategory($moduleId);

    if ((! empty($email)) && (! empty($password) ) && ($password == $confpassword) )
    {
        if (! filter_var($email, FILTER_VALIDATE_EMAIL))
        {
            $errors['registererror'] = "Adresa de email nu este validă. Vă rugăm să mai încercați.";
        }
        else
        {
            $user = new \SimpleQuiz\Utils\User\EndUser($email, $username);
            $user->setPassword(password_hash($password,1));
            $user->setModuleaccess($category['module_group']);
            //TODO change hardcoded role id
            $user->setRole(3);
            //TODO change hardcoded level id
            $user->setLevel(1);

            try
            {
                $user = $simple->registerUser($user);

                $mailer = new \SimpleQuiz\Utils\Base\Mailer();
                $mailer->sendConfirmationEmail($user);
            }
            catch (\Swift_TransportException $e)
            {
                $errors['registererror'] = 'A apărut o eroare la trimiterea confirmării pe email. Vă rugăm să contactați Administratorul';
            }
            catch (\SimpleQuiz\Utils\Exceptions\RegisterException $e)
            {
                $errors['registererror'] = $e->getMessage();
            }
        }
    }
    else
    {
        $errors['registererror'] = "A apărut o eroare în legătură cu numele de cont și/sau parola. Vă rugăm să mai încercați.";
    }

    if (count($errors) > 0)
    {
        $app->flash('errors', $errors);
        $session->remove('user');
        $app->redirect($app->request->getRootUri() . '/login/');
    }

    $app->render('emailsent.php', array('quizzes' => $quizzes, 'categories' => $categories, 
                                             'session' => $session));
});

$app->get('/confirm-registration/:hash', function($hash) use ($app) {

    $simple = $app->simple;
    $quizzes = $simple->getQuizzes(true);
    $categories = $simple->getCategories();
    // $subcategories = $simple->getSubcategories();
    $session = $app->session;

    $user = \ORM::for_table('users')->select_many('id', 'hashstamp')->where('confirmhash', $hash)->where_raw('TIMESTAMPDIFF(HOUR, hashstamp, NOW()) < 24')->find_one();
    if ($user) {

        $user->set('hashstamp'); //null
        $user->set('confirmhash'); //null
        $user->set('confirmed', 1);
        $user->save();

        $app->render('emailconfirmed.php', array(
            'quizzes'    => $quizzes,
            'categories' => $categories,
            'session'    => $session
        ));
    } else {
        //no user with that hash or timestamp expired. Redirect to home page
        $app->redirect($app->request->getRootUri().'/');
    }
})->conditions(array("hash" => "[0-9a-f]{40}"));

$app->get('/categories/', function () use ($app) {
    $simple = $app->simple;
    $quizzes = $simple->getQuizzes(true);
    $categories = $simple->getCategories();

    $session = $app->session;

    $app->render('index.php', array('quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));
});

$app->get('/categories/:id', function ($id) use ($app) {
    $simple = $app->simple;

    //Sidebar menu
    $categories = $simple->getCategories();

    $subcategories = $simple->getCategorySubcategories($id);
    
    //Jombotrone
    $category = $simple->getCategory($id);
    
    //Content
    $quizzes = $simple->getCategoryQuizzes($id);

    $session = $app->session;
    if( $category )
    {
        $app->render('category.php', array('category' => $category, 'quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));
    }
    else
    {
        $quizzes = $simple->getQuizzes(true);
        $app->render('index.php', array('quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));
    }
})->conditions(array('id' => '\d+'));

//28/09 pagina de subcategorii
$app->get('/subcategories/', function () use ($app) {
    $simple = $app->simple;
    $quizzes = $simple->getQuizzes(true);
    $categories = $simple->getCategories();
    $subcategories = $simple->getCategorySubcategories($id);
    $session = $app->session;

    $app->render('index.php', array('quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));
});

$app->get('/subcategories/:id', function ($id) use ($app) {
    $simple = $app->simple;
    $subcategory = $simple->getSubcategory($id);
    $quizzes = $simple->getSubcategoryQuizzes($id);
    $categories = $simple->getCategories();
    $subcategories = $simple->getCategorySubcategories($subcategory->id_category);
    $category = $simple->getCategory($subcategory->id_category);
    $session = $app->session;
    if( $subcategory )
    {
        $app->render('subcategory.php', array('category' => $category, 'subcategory' => $subcategory, 'quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));
    }
    else
    {
        $quizzes = $simple->getQuizzes(true);
        $app->render('index.php', array('quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));
    }
})->conditions(array('id' => '\d+'));


$app->get('/quiz/:id/', function ($id) use ($app) {

    $flash = $app->view()->getData('flash');
    $error = null;

    if (isset($flash['usererror'])) {
        $error = $flash['usererror'];
    }
    if (isset($flash['quizerror'])) {
        $error = $flash['quizerror'];
    }

    $quiz = $app->quiz;

    $session = $app->session;

    $simple = $app->simple;
    $categories = $simple->getCategories();

    if ($quiz->setId($id)) {
        /**
         * @todo remove all session shite below and store in db
         */
        $quiz->populateQuestions();
        $quiz->populateUsers();
        $session->set('quizid', $id);
        $session->set('score', 0);
        $session->set('correct', array());
        $session->set('wrong', array());
        $session->set('finished', 'no');
        $session->set('num', 0);
        $session->set('last', null);
        $session->set('timetaken', null);
        $session->set('starttime', null);

        $app->render('quiz/quiz.php', array('quiz' => $quiz, 'categories' => $categories, 'session' => $session, 'error' => $error));
    } else {
        $app->flashnow('quizerror','A apărut o eroare. Vă rugăm să vă întoarceți la exercițiu și să mai încercați');
        $app->render('quiz/error.php', array( 'categories' => $categories,'session' => $session));
    }
})->conditions(array('id' => '\d+'));

$app->post('/quiz/process/', $authenticate($app), function () use ($app) {

    $simple = $app->simple;
    $id = $app->request()->post('quizid');
    $starter = $app->request()->post('starter');

    if (! ctype_digit($id)) {
        $app->redirect($app->request->getRootUri().'/');
    }

    $session = $app->session;

    if (isset($starter)) //inceputul testului
    {
        // if ($simple->quizUserExists($id, $session->get('user')->getId()))
        // {
        //     $app->flash('quizerror', "Deja ați rezolvat acest exercițiu");
        //     $app->redirect($app->request->getRootUri() . '/quiz/' . $id);
        // }
        $session->set('score', 0);
        $session->set('correct', array());
        $session->set('wrong', array());
        $session->set('finished', 'no');
        $session->set('num', 0);
        $session->set('starttime', date('Y-m-d H:i:s'));

        $app->redirect($app->request->getRootUri() . '/quiz/' . $id . '/test');
        // $app->render('quiz/test.php', array('quiz' => $quiz, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));

    }
    else
    { //quiz logic

        /**
         * @todo check if serialised quiz exists in session before instantiating new
         */
        $quiz = $app->quiz;

        $simple = $app->simple;
        $categories = $simple->getCategories();

        if ($quiz->setId($id))
        {

            $quiz->populateUsers();

            $num = $app->request()->post('num');
            $answers = $app->request()->post('answers');

            $nonce = $app->request()->post('nonce');

            //check for a valid nonce to prevent cached submissions e.g (back button)
            if ($session->get('nonce') != $nonce)
            {
                $app->redirect($app->request->getRootUri() . '/quiz/' . $id . '/test');
            }

            $quiz->populateQuestions();
            $quiz->populateUsers();
            $session->set('num', (int) $num);

            $numquestions = $quiz->countQuestions();
            $quizanswers = $quiz->getAnswers($num);

            if ($answers == $quizanswers[0])
            { //first answer in array is correct one
                $score = $session->get('score');
                $score++;
                $session->set('score', $score);
                $_SESSION['correct'][ $num ] = array($answers);
            } else
            {
                $_SESSION['wrong'][ $num ] = array($answers);
            }
            if ($_SESSION['num'] < $numquestions)
            {
                $_SESSION['num']++;
            } else
            {
                $_SESSION['last'] = true;
                $_SESSION['finished'] = 'yes';
            }
            $app->redirect($app->request->getRootUri() . '/quiz/' . $id . '/test');
        } else
        {
            $app->flashnow('quizerror', 'A apărut o eroare. Vă rugăm să vă întoarceți la exercițiu și să mai încercați.');
            $app->render('quiz/error.php', array('categories' => $categories, 'session' => $session));
        }
    }
});

$app->get('/quiz/:id/test/', $authenticate($app), function ($id) use ($app) {

    $session = $app->session;

    $simple = $app->simple;
    $categories = $simple->getCategories();
    $subcategories = $simple->getSubcategories();
    
    $quiz = $app->quiz;
    $questions = $quiz->getQuestions();

    // if ( $session->get('quizid') !== $id) {
    //     $app->flashnow('quizerror','A apărut o eroare. Vă rugăm să vă întoarceți la exercițiu și să mai încercați.');
    //     $app->render('quiz/error.php', array( 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session, 'questions' => $questions));
    //     $app->stop();
    // }
    /**
     * @todo implement serialize() on quiz object and store in session
     */
    if ($quiz->setId($id)) {
        $quiz->populateQuestions()->populateUsers();

        $timetaken = '';

        $nonce = md5(uniqid());
        $session->set('nonce', $nonce);

        $num = $session->get('num') ? $session->get('num') : 1;

        if (isset($_SESSION['last']) && $_SESSION['last'] === true) {

            $session->set('nonce', null);

            //first two vars formatted for insertion into database as datetime fields
            $starttime = $session->get('starttime');
            $endtime = date('Y-m-d H:i:s');

            //store $timetaken in session
            if (!isset($_SESSION['timetaken'])) {

                $end = time();
                $start = strtotime($starttime);
                $time = $end - $start;

                $timetaken = SimpleQuiz\Utils\Base\Utils::calculateTimeTaken($time);

                $_SESSION['timetaken'] = $timetaken;
                $quiz->addQuizTaker($session->get('user'), $session->get('score'), $starttime, $endtime, $time);

            } else {
                $timetaken = $_SESSION['timetaken'];
            }
        }

        $app->render('quiz/test.php', array('quiz' => $quiz, 'num' => $num, 'nonce' => $nonce,
                                            'timetaken' => $timetaken, 'categories' =>
        $categories, 'subcategories' => $subcategories, 'questions' => $questions, 'session' => $session));
    } else {
        $app->flashnow('quizerror','Exercițiul pe care l-ați selectat nu există. Vă rugăm să vă întoarceți la meniul principal și să încercați din nou.');
        $app->render('quiz/error.php', array( 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session, 'questions' => $questions));
        $app->stop();
    }
})->conditions(array('id' => '\d+'));

$app->get('/quiz/:id/results/', function ($id) use ($app) {

    $quiz = $app->quiz;

    $session = $app->session;

    $simple = $app->simple;
    $categories = $simple->getCategories();
    $subcategories = $simple->getSubcategories();

    if ($session->get('finished') != 'yes') {
        $app->redirect($app->request->getRootUri().'/');
    }

    if ($session->get('quizid') !== $id) {
        $app->flashnow('quizerror','A apărut o eroare. Vă rugăm să vă întoarceți la meniul principal și să încercați din nou.');
        $app->render('quiz/error.php', array('quiz' => $quiz, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));
        $app->stop();
    }

    if ($quiz->setId($id)) {
        $quiz->populateQuestions();
        $quiz->populateUsers();
        $session->set('last', null);

        $app->render('quiz/results.php', array('quiz' => $quiz, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));
    } else {
        $app->flashnow('quizerror','Exercițiul pe care l-ați selectat nu există. Mergeți în meniul principal pentru a încerca din nou.');
        $app->render('quiz/error.php', array('quiz' => $quiz, 'categories' => $categories, 'subcategories' => $subcategories, 'session' => $session));
        $app->stop();
    }
})->conditions(array('id' => '\d+'));
