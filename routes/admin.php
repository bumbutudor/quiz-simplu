<?php

$authenticate = function ($app, $admin = false) {

    return function () use ($app, $admin) {
        $errors = array();
        if ($admin)
        {
            if (! $app->session->get('user') instanceof \SimpleQuiz\Utils\User\AdminUser)
            {
                $errors['loginerror'] = 'Nu aveți acces drepturi de Administrator.';
                $app->session->set('urlRedirect', $app->request()->getPathInfo());
                $app->flash('errors', $errors);
                $app->redirect($app->request->getRootUri() . '/login/');
            }
        }
        else
        {
            //doar administratorul poate sa inceapa testul
            if (! $app->session->get('user') instanceof \SimpleQuiz\Utils\User\AdminUser)
            {
                $errors['loginerror'] = 'Trebuie să vă logați pentru a începe testul!';
                $app->session->set('urlRedirect', $app->request()->getPathInfo());
                $app->flash('errors', $errors);
                $app->redirect($app->request->getRootUri() . '/login/');
            }
        }
    };
};

$app->get("/logout/", function () use ($app) {
    $session = $app->session;
    $session->end();
    $app->redirect($app->request->getRootUri().'/');
});

$app->get('/admin/', $authenticate($app, true), function () use ($app) {
    
    $simple = $app->simple;

    $user = $app->session->get('user');

    $categories = $simple->getCategories(false);
    $binaryModuleId = $user->getModuleaccess();
    $moduleId = SimpleQuiz\Utils\Base\Utils::binaryCalculation($binaryModuleId);
    $subcategories = $simple->getCategorySubcategories($moduleId);
    $quiz_types = $simple->getQuizTypes(true);
    $category = $simple->getCategory($moduleId);//pentru a scoate categoria in dependenta de user

    // BEDONE Sa primesc numai exercitiile de la categoria data    

    if($user->getRole() == 1){
        // if(isset($_GLOBALS["selectedModule"])){
        //     $quizzes = $simple->getCategoryQuizzes($_GLOBALS["selectedModule"]);
        //     //adaugat 11/10/2018 10:40
        //     $subcategories = $simple->getCategorySubcategories(1); 
        // } else{
        //     
        // }
            $quizzes = $simple->getQuizzes(false);

        $app->render('admin/index.php', array('quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'quiz_types' => $quiz_types, 'category' => $category, 'admin' => true));
    }
    else {
        $quizzes = $simple->getCategoryQuizzes($moduleId);

        $app->render('admin/index.php', array('quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'quiz_types' => $quiz_types, 'category' => $category));
    }
});

$app->post('/admin/', $authenticate($app, true), function () use ($app) {
     
    $simple = $app->simple;

    $user = $app->session->get('user');

    $categories = $simple->getCategories(false);
    $binaryModuleId = $user->getModuleaccess();
    $moduleId = SimpleQuiz\Utils\Base\Utils::binaryCalculation($binaryModuleId);
    $subcategories = $simple->getCategorySubcategories($moduleId);
    $quiz_types = $simple->getQuizTypes(true);
    $category = $simple->getCategory($moduleId);//pentru a scoate categoria in dependenta de user

    if(trim($app->request->post('selectedModule'))) {
        $_GLOBALS["selectedModule"] = trim($app->request->post('selectedModule'));
    }

    // BEDONE Sa primesc numai exercitiile de la categoria data
    // $quizzes = $simple->getCategoryQuizzes($moduleId); 

    if($user->getRole() == 1){
        if(isset($_GLOBALS["selectedModule"])){
            $quizzes = $simple->getCategoryQuizzes($app->request->post('selectedModule'));
            //adaugat 11/10/2018 10:40
            $subcategories = $simple->getCategorySubcategories($app->request->post('selectedModule')); 
        } else{
            $quizzes = $simple->getQuizzes(false);
        }

        $app->render('admin/index.php', array('quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'quiz_types' => $quiz_types, 'category' => $category, 'admin' => true));
    }
    else {
        $quizzes = $simple->getQuizzes(false);

        $app->render('admin/index.php', array('quizzes' => $quizzes, 'categories' => $categories, 'subcategories' => $subcategories, 'quiz_types' => $quiz_types, 'category' => $category));
    }
});


$app->post("/admin/quiz/", $authenticate($app, true), function() use ($app) {
    
    $quizmeta = array();
    
    $quizname = trim($app->request->post('quizname'));
    $quizdescription = trim($app->request->post('description'));
    $quizcategory = trim($app->request->post('category'));
    $quizsubcategory = trim($app->request->post('id_subcategory'));
    $quiz_type = trim($app->request->post('quiz_type'));
    $active = (int) trim($app->request()->post('active'));
    
    if ( ($quizname !== '') && ($quizdescription !== '') ) {
        $quizmeta['name'] = $quizname;
        $quizmeta['description'] = $quizdescription;
        $quizmeta['category'] = $quizcategory;
        $quizmeta['id_subcategory'] = $quizsubcategory;
        $quizmeta['quiz_type'] = $quiz_type;
        $quizmeta['active'] = $active;
        
        $simple = $app->simple;
    
        if ($simple->addQuiz($quizmeta)) {
            $app->flash('success', 'Exercițiul a fost creat cu succes!');

            $app->redirect($app->request->getRootUri().'/admin/');
        } else {
            //problem adding quiz
            $app->flash('error', 'Problemă la adăugarea exercițiului');
            $app->redirect($app->request->getRootUri().'/admin/');
        }
    } else {
        //problem with post inputs
        $app->flash('error', 'Problemă la adaugarea exercițiului. Ceva nu e în regulă cu ce ați introdus');
        $app->redirect($app->request->getRootUri().'/admin/');
    }
        
});

$app->put("/admin/quiz/", $authenticate($app, true), function() use ($app) {
    
    $quizmeta = array();
    
    $quizid = trim($app->request->put('quizid'));
    $quizname = trim($app->request->put('quizname'));
    $quizdescription = trim($app->request->put('description'));
    $quizcategory = trim($app->request->put('category')); //10/08/2018 din post in put
    $quizsubcategory = trim($app->request->put('id_subcategory')); //10/08/2018 din post in put
    $quiz_type = trim($app->request->put('quiz_type')); //10/08/2018 din post in put
    $active = (int) trim($app->request()->put('active'));
    
    if ( ($quizname !== '') && ($quizdescription !== '') && (ctype_digit($quizid)) ) {
        
        $quizmeta['id'] = $quizid;
        $quizmeta['name'] = $quizname;
        $quizmeta['description'] = $quizdescription;
        $quizmeta['category'] = $quizcategory;
        $quizmeta['id_subcategory'] = $quizsubcategory;
        $quizmeta['quiz_type'] = $quiz_type;
        $quizmeta['active'] = $active;
        
        $simple = $app->simple;
    
        if ($simple->updateQuiz($quizmeta)) {
            $app->flash('success', 'Exercițiul a fost modificat!');

            $app->redirect($app->request->getRootUri().'/admin/');
        } else {
            //problem adding quiz
            $app->flash('error', 'Problemă la modificarea exercițiului!');
            $app->redirect($app->request->getRootUri().'/admin/');
        }
    } else {
        //problem with post inputs
        $app->flash('error', 'Problemă la modificarea exercițiului. Ceva nu e în regulă cu ce ați introdus!');
        $app->redirect($app->request->getRootUri().'/admin/');
    }
        
});

$app->delete("/admin/quiz/", $authenticate($app, true), function() use ($app) {
    
    $quizid = trim($app->request->post('quizid'));
    
    if (ctype_digit($quizid) ) {
        
        $simple = $app->simple;
        try {
            $simple->deleteQuiz($quizid);
        } catch (Exception $e ) {
            echo json_encode(array('error' => $e->getMessage()));
        }
        echo json_encode(array('success' => 'Exercițiul a fost șters cu succes!'));
        $app->stop();
        
    } else {
        echo json_encode(array('error' => 'non-int quiz'));
    }
        
});




//19.09.2018 adaugare submodul
$app->post("/admin/subcat/", $authenticate($app, true), function() use ($app) {
    
    $subcatmeta = array();
    
    $subcatname = trim($app->request->post('subcatname'));
    $subcatdescription = trim($app->request->post('subcatdescription'));
    $subcatcategory = trim($app->request->post('id_category'));
    
    if ( ($subcatname !== '') && ($subcatdescription !== '') ) {
        $subcatmeta['name'] = $subcatname;
        $subcatmeta['description'] = $subcatdescription;
        $subcatmeta['id_category'] = $subcatcategory;
     
        
        $simple = $app->simple;
    
        if ($simple->addSubcat($subcatmeta)) {
            $app->flash('success', 'Submodulul a fost creat cu succes!');

            $app->redirect($app->request->getRootUri().'/admin/');
        } else {
            //problem adding quiz
            $app->flash('error', 'Problemă la adăugarea submodulului');
            $app->redirect($app->request->getRootUri().'/admin/');
        }
    } else {
        //problem with post inputs
        $app->flash('error', 'Problemă la adaugarea submodulului. Ceva nu e în regulă cu ce ați introdus');
        $app->redirect($app->request->getRootUri().'/admin/');
    }
        
});
//19.09.2018 modificare submodul
$app->put("/admin/subcat/", $authenticate($app, true), function() use ($app) {
    
    $subcatmeta = array();
    
    $subcatid = trim($app->request->put('subcatid'));
    $subcatname = trim($app->request->put('subcatname'));
    $subcatdescription = trim($app->request->put('subcatdescription'));
    $subcatcategory = trim($app->request->post('id_category'));
  
    
    if ( ($subcatname !== '') && ($subcatdescription !== '') && (ctype_digit($subcatid)) ) {
        
        $subcatmeta['id'] = $subcatid;
        $subcatmeta['name'] = $subcatname;
        $subcatmeta['description'] = $subcatdescription;
        $subcatmeta['id_category'] = $subcatcategory;
        
        $simple = $app->simple;
    
        if ($simple->updateSubcat($subcatmeta)) {
            $app->flash('success', 'Submodulul a fost modificat!');

            $app->redirect($app->request->getRootUri().'/admin/');
        } else {
            //problem adding submouul
            $app->flash('error', 'Problemă la modificarea submodulului!');
            $app->redirect($app->request->getRootUri().'/admin/');
        }
    } else {
        //problem with post inputs
        $app->flash('error', 'Problemă la modificarea submodulului. Ceva nu e în regulă cu ce ați introdus!');
        $app->redirect($app->request->getRootUri().'/admin/');
    }
        
});

//19.09.2018 sterge submodul
$app->delete("/admin/subcat/", $authenticate($app, true), function() use ($app) {
    
    $subcatid = trim($app->request->post('subcatid'));
    
    if (ctype_digit($subcatid) ) {
        
        $simple = $app->simple;
        try {
            $simple->deleteSubcat($subcatid);
        } catch (Exception $e ) {
            echo json_encode(array('error' => $e->getMessage()));
        }
        echo json_encode(array('success' => 'Submodulul a fost șters cu succes!'));
        $app->stop();
        
    } else {
        echo json_encode(array('error' => 'non-int submodul'));
    }
        
});

 //24/09/2018 Pagina adugata pentru subcategorie
$app->get("/admin/subcat/:id/", $authenticate($app, true), function($id) use ($app) {

    $subcat = $app->subcat;
    
    if ($subcat->setIdSubcat($id)) {
        $categories = $app->simple->getCategories(false);
        $binaryModuleId = $app->session->get('user')->getModuleaccess();
        $moduleId = SimpleQuiz\Utils\Base\Utils::binaryCalculation($binaryModuleId);
        $app->render('admin/subcat.php', array('subcat' => $subcat, 'categories' => $categories));
    }
        
})->conditions(array('id' => '\d+'));


//27/09/2018 Pagina adugata pentru subcategorie
$app->put("/admin/subcat/:id/", $authenticate($app, true), function($id) use ($app) {
    
    
    if (! ctype_digit($id)) {
        $app->redirect($app->request->getRootUri().'/admin/');
    }
    
    $subcat = $app->subcat;
    
    if ($subcat->setIdSubcat($id)) {
        $categories = $app->simple->getCategories(false);
        $binaryModuleId = $app->session->get('user')->getModuleaccess();
        $moduleId = SimpleQuiz\Utils\Base\Utils::binaryCalculation($binaryModuleId);
        
        
        $app->render('admin/subcat.php', array('subcat' => $subcat, 'categories' => $categories));
        
    }
        
});

//27/09/2018 Pagina adugata pentru subcategorie
$app->post("/admin/subcat/:id/", $authenticate($app, true), function($id) use ($app) {
    
    if  (! ctype_digit($id)) {
        $app->redirect($app->request->getRootUri().'/admin/');
    }
    
    $subcat = $app->subcat;
    
    
    if ($subcat->setIdSubcat($id)) {
        $categories = $app->simple->getCategories(false);
        $binaryModuleId = $app->session->get('user')->getModuleaccess();
        $moduleId = SimpleQuiz\Utils\Base\Utils::binaryCalculation($binaryModuleId);
        

   
        $app->render('admin/subcat.php', array('subcat' => $subcat, 'categories' => $categories));
    } else {
        echo 'oops';
    }
        
});


//29/09/2018 Schimbat cu locul
$app->get("/admin/quiz/:id/", $authenticate($app, true), function($id) use ($app) {

    $quiz = $app->quiz;
    
    if ($quiz->setId($id)) {
        $quiz->populateQuestions();
        $quiz->populateUsers();
        $categories = $app->simple->getCategories(false);
        $binaryModuleId = $app->session->get('user')->getModuleaccess();
        $moduleId = SimpleQuiz\Utils\Base\Utils::binaryCalculation($binaryModuleId);
        $subcategories = $app->simple->getCategorySubcategories($moduleId);
        $quiz_types = $app->simple->getQuizTypes(true);
        
        $app->render('admin/quiz.php', array('quiz' => $quiz, 'categories' => $categories, 'subcategories' => $subcategories, 'quiz_types' => $quiz_types));
    }
        
})->conditions(array('id' => '\d+'));

$app->put("/admin/quiz/:id/", $authenticate($app, true), function($id) use ($app) {
    
    $questionid = $app->request->put('questionid');
    $text = $app->request->put('questiontext');
    
    if (! ctype_digit($id)) {
        $app->redirect($app->request->getRootUri().'/admin/');
    }
    
    $quiz = $app->quiz;
    
    if ($quiz->setId($id)) {

        $quiz->populateQuestions();

        $categories = $app->simple->getCategories(false);
        $binaryModuleId = $app->session->get('user')->getModuleaccess();
        $moduleId = SimpleQuiz\Utils\Base\Utils::binaryCalculation($binaryModuleId);
        $subcategories = $app->simple->getCategorySubcategories($moduleId);
        $quiz_types = $app->simple->getQuizTypes(true);
        
        if ( (! ctype_digit($questionid)) || (trim($text) == '') ) {
            $app->redirect($app->request->getRootUri().'/admin/');
        }

        try {
            $quiz->updateQuestion($questionid, $text);
            $app->flashnow('success', 'Intrebarea a fost salvata cu succes!');
        } catch (Exception $e ) {
            $app->flashnow('error', $e->getMessage());
        }
        $quiz->populateUsers();
        $app->render('admin/quiz.php', array('quiz' => $quiz, 'categories' => $categories, 'quiz_types' => $quiz_types, 'subcategories' => $subcategories));
        
    }
        
});

$app->post("/admin/quiz/:id/", $authenticate($app, true), function($id) use ($app) {
    
    if  (! ctype_digit($id)) {
        $app->redirect($app->request->getRootUri().'/admin/');
    }
    
    $quiz = $app->quiz;
    
    $question = trim($app->request->post('questiontext'));
    $correct = (int) trim($app->request()->post('correct'));
    $explanation = trim($app->request->post('explanation'));
    $answerarray = $app->request()->post('answer');
    
    if ($quiz->setId($id)) {
        $quiz->populateQuestions();
        $categories = $app->simple->getCategories(false);
        $binaryModuleId = $app->session->get('user')->getModuleaccess();
        $moduleId = SimpleQuiz\Utils\Base\Utils::binaryCalculation($binaryModuleId);
        $subcategories = $app->simple->getCategorySubcategories($moduleId);
        $quiz_types = $app->simple->getQuizTypes(true);
        $i = 0;
        foreach ($answerarray as $answer) {
            if (trim($answer) == '') {
                $app->flashnow('error', "Trebuie să fie cel puțin un răspuns!");
                $app->render('admin/quiz.php', array('quiz' => $quiz, 'categories' => $categories, 'quiz_types' => $quiz_types, 'subcategories' => $subcategories));
                $app->stop();
            }
            if ($i == $correct) {
                $correctAnswer = 1;
            } else {
               $correctAnswer = 0;
            }
            $answers[] = array($answer, $correctAnswer);

            $i++;
        }
        try {
            $quiz->addQuestion($question, 'radio', $answers, $explanation);
            $app->flashnow('success', 'Exemplul nou a fost adăugată cu succes!');
        } catch (Exception $e ) {
            $app->flashnow('error', 'A aparut o eroare la adaugarea exemplului!');
            $app->flashnow('error', $e->getMessage());
        }
        $quiz->populateUsers();
   
        $app->render('admin/quiz.php', array('quiz' => $quiz, 'categories' => $categories, 'quiz_types' => $quiz_types, 'subcategories' => $subcategories));
    } else {
        echo 'oops';
    }
        
});

$app->delete("/admin/quiz/:id/", $authenticate($app, true), function($id) use ($app) {
    
    $questionid = $app->request->post('questionid');
            
    if (! ctype_digit($id)) {
        $app->redirect($app->request->getRootUri().'/admin/');
    }
    
    $quiz = $app->quiz;
    
    if ($quiz->setId($id)) {
        
        try {
            $quiz->deleteQuestion($questionid);
        } catch (Exception $e ) {
            echo json_encode(array('error' => $e->getMessage()));
        }
        echo json_encode(array('success' => 'Intrebarea a fost ștearsă cu succes!'));
        $app->stop();
    }
        
});

$app->get("/admin/quiz/:quizid/question/:questionid/edit/", $authenticate($app, true), function($quizid,
                                                                                           $questionid) use ($app) {
   
    $quiz = $app->quiz;
    
    if ($quiz->setId($quizid)) {
        $quiz->populateQuestions();
        $question = $quiz->getQuestion($questionid);
        $answers = $quiz->getAnswers($questionid);
        $app->render('admin/editanswers.php', array('quizid' => $quizid,'questionid' => $questionid, 'question' => $question, 'answers' => $answers));
    } else {
        echo 'oops';
    }
        
})->conditions(array('quizid' => '\d+', 'questionid' => '\d+'));

$app->put("/admin/quiz/:quizid/question/:questionid/edit/", $authenticate($app, true), function($quizid,
                                                                                           $questionid) use ($app) {
   
    if ( (! ctype_digit($quizid)) || (! ctype_digit($questionid))) {
        $app->redirect($app->request->getRootUri().'/admin/');
    }
    
    $quiz = $app->quiz;
    
    $correct = (int) trim($app->request()->put('correct'));
    $answerarray = $app->request()->put('answer');
    
    if ($quiz->setId($quizid)) {
        $quiz->populateQuestions();
        $question = $quiz->getQuestion($questionid);
        $i = 0;
        foreach ($answerarray as $answer) {
            if (trim($answer) == '') {
                $app->flashnow('error', 'Nu sunt răspusnuri adăugate!');
                $answers = $quiz->getAnswers($questionid);
                $app->render('admin/editanswers.php', array('quizid' => $quizid,'questionid' => $questionid, 'question' => $question, 'answers' => $answers));
                $app->stop();
            }
            if ($i == $correct) {
                $correctAnswer = 1;
            } else {
               $correctAnswer = 0;
            }
            $answers[] = array($answer, $correctAnswer);

            $i++;
        }
        try {
            $quiz->updateAnswers($answers, $questionid);
            $app->flashnow('success', 'Raspunsurile au fost modificate cu succes');
        } catch (Exception $e ) {
            $app->flashnow('error', 'A aparut o eroare la modificarea răspunsului!');
        }
        $answers = $quiz->getAnswers($questionid);
        $app->render('admin/editanswers.php', array('quizid' => $quizid,'questionid' => $questionid, 'question' => $question, 'answers' => $answers));
    } else {
        echo 'Ups';
    }
});

//TODO copie de rezerva
//TODO schimbare a parolei
$app->get("/admin/config/", $authenticate($app, true), function() use ($app) { 
    
    $app->render('/admin/config.php');
        
});

$app->get("/admin/backup/", $authenticate($app, true), function() use ($app) { 
    
    $app->render('/admin/backup.php');
        
});
