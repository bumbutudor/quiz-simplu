<?php
namespace SimpleQuiz\Utils;

use SimpleQuiz\Utils\Base\User;
use SimpleQuiz\Utils\Exceptions\RegisterException;
use Slim\Slim;

class Simple implements Base\ISimple {
    
    public function addQuiz(Array $quizmeta)
    {
        $quiz = \ORM::for_table('quizzes')->create();
        $quiz->name = $quizmeta['name'];
        $quiz->description = $quizmeta['description'];
        $quiz->category = $quizmeta['category'];
        $quiz->id_subcategory = $quizmeta['id_subcategory'];
        $quiz->quiz_type = $quizmeta['quiz_type'];
        $quiz->active = $quizmeta['active']; 
        $quiz->set_expr('created', 'NOW()');
        $quiz->set_expr('updated', 'NOW()');
        $quiz->save();
        return true;
    }
    
    public function updateQuiz(Array $quizmeta)
    {
        $quiz = \ORM::for_table('quizzes')->find_one($quizmeta['id']);
        
        $quiz->set(array(
            'name' => $quizmeta['name'],
            'description' => $quizmeta['description'],
            'category' => $quizmeta['category'],
            'id_subcategory' => $quizmeta['id_subcategory'],
            'quiz_type' => $quizmeta['quiz_type'],
            'active' => $quizmeta['active']
        ));
        $quiz->set_expr('updated', 'NOW()');
        $quiz->save();
   
        return true;
    }
    
     public function deleteQuiz($quizid)
    {
        $quiz = \ORM::for_table('quizzes')->find_one($quizid);
        $quiz->delete();
        return true;
    }



    //19/9/2018 Adaugare submodul
     public function addSubcat(Array $subcatmeta)
    {
        $subcat = \ORM::for_table('subcategories')->create();
        $subcat->name = $subcatmeta['name'];
        $subcat->description = $subcatmeta['description'];
        $subcat->id_category = $subcatmeta['id_category'];
        $subcat->save();
        return true;
    }
    
    //19/9/2018 Modificare submodul
    public function updateSubcat(Array $subcatmeta)
    {
        $subcat = \ORM::for_table('subcategories')->find_one($subcatmeta['id']);
        
        $subcat->set(array(
            'name' => $subcatmeta['name'],
            'description' => $subcatmeta['description'],
            'id_category' => $subcatmeta['id_category'],

        ));
   
        return true;
    }
    
    //19/9/2018 Stergere submodul
     public function deleteSubcat($subcatid)
    {
        $subcat = \ORM::for_table('subcategories')->find_one($subcatid);
        $subcat->delete();
        return true;
    }
    

    
    public function getQuizzes($active = true) {
        
        if ($active) {
            $quizzes = \ORM::for_table('quizzes')->join('subcategories', array('quizzes.id_subcategory', '=', 'subcategories.id'))->select_many('quizzes.id', 'quizzes.name', 'quizzes.description', array('id_subcategory' => 'subcategories.name'), 'quizzes.active')->where('active',1)->find_many();
        } else {
            $quizzes = \ORM::for_table('quizzes')->join('categories', array('quizzes.category', '=', 'categories.id'))->join('subcategories', array('quizzes.id_subcategory', '=', 'subcategories.id'))->join('quiz_types', array('quizzes.quiz_type', '=', 'quiz_types.id'))->select_many('quizzes.id', 'quizzes.name', 'quizzes.description', array('category' => 'categories.name'), array('id_subcategory' => 'subcategories.name'), array('quiz_type' => 'quiz_types.name'), 'quizzes.active')->find_many();
        }
        return $quizzes;
    }

    public function getQuiz($id) {
        $quiz = \ORM::for_table('quizzes')->select_many('name', 'description')->find_one($id);

        return $quiz;
    }
    
    public function getCategories($active = false) {
        if ($active) {
            $categories = \ORM::for_table('categories')->join('quizzes', array('quizzes.category', '=',
                'categories.id'))->select_many('categories.id','categories.name','categories.description',
                'quizzes.category','quizzes.active')->where('quizzes.active', 1)->find_many();
        }
        else {
            $categories = \ORM::for_table('categories')->find_many();
        }
        return $categories;
    }

    public function getSubcategories($active = false) {
        if ($active) {
            $subcategories = \ORM::for_table('subcategories')->join('quizzes', array('quizzes.id_subcategory', '=',
                'subcategories.id'))->select_many('subcategories.id','subcategories.name','subcategories.description',
                'quizzes.id_subcategory','quizzes.active')->where('quizzes.active', 1)->find_many();
        }
        else {
            $subcategories = \ORM::for_table('subcategories')->find_many();
        }
        return $subcategories;
    }


    public function getCategorySubcategories($id) {
            $subcategories = \ORM::for_table('subcategories')->join('categories', array('categories.id', '=', 'subcategories.id_category'))->select_many('subcategories.id','subcategories.name','subcategories.description')->where('categories.id', $id)->find_many();


        return $subcategories;
    }
    
    public function getCategory($id) {
        
        $category = \ORM::for_table('categories')->select_many('name','description', 'module_group')->find_one($id);
        
        return $category;
    }

    public function getSubcategory($id) {
        
        $id_subcategory = \ORM::for_table('subcategories')->select_many('name','description', 'id_category')->find_one($id);
        
        return $id_subcategory;
    }

    public function getQuizType($id) {
        
        $quiz_type = \ORM::for_table('quiz_types')->select_many('name','description')->find_one($id);
        
        return $quiz_type;
    }

    public function getQuizTypes($active = true) {
        
        $quiz_types = \ORM::for_table('quiz_types')->where('is_visible', 1)->find_many();
        
        return $quiz_types;
    }
    
    public function getCategoryQuizzes($id) {
            $quizzes = \ORM::for_table('quizzes')->join('categories', array('quizzes.category', '=', 'categories.id'))->select_many('quizzes.id', 'quizzes.name', 'quizzes.description', array('category' => 'categories.name'), 'quizzes.active')->where('quizzes.category', $id)->find_many();
        
        return $quizzes;
    }

//creata pe 28/09 pentru a lua subcategory
    public function getSubcategoryQuizzes($id) {
        
        $quizzes = \ORM::for_table('quizzes')->join('subcategories', array('quizzes.id_subcategory', '=', 'subcategories.id'))->select_many('quizzes.id', 'quizzes.name', 'quizzes.description', array('id_subcategory' => 'subcategories.name'), 'quizzes.active')->where('quizzes.id_subcategory', $id)->find_many();
        
        return $quizzes;
    }
    
    public function getUsers($quizid = true)
    {
        if($quizid)
        {
            $users = \ORM::for_table('quiz_users')->join('quizzes', array('quiz_users.quiz_id', '=',
                'quizzes.id'))->join('users', array('quiz_users.user_id', '=', 'users.id'))->select_many('users.name')
            ;

            return $users;
        }
    }

    public function quizUserExists($quizid, $userid){

        return \ORM::for_table('quiz_users')->where( array('quiz_id' => $quizid, 'user_id' => $userid) )->find_one();
    }

    /**
     * @param User $user
     * @return User $user
     * @throws RegisterException
     */
    public function registerUser(User $user)
    {
        $name = $user->getName();
        $email = $user->getEmail();
        $password = $user->getPassword();
        $module = $user->getModuleaccess();
        $role = $user->getRole();

        $userexists =  \ORM::for_table('users')->where_any_is(
                array(
                    array('name' => $name),
                    array('email' => $email)
                )
            )->find_one();

        if ($userexists)
        {
            throw new RegisterException;
        }
        else
        {
            //register a new user
            $newuser = \ORM::for_table('users')->create();
            $newuser->set('name', $name);
            $newuser->set('email', $email);
            $newuser->set('pass', $password);
            $newuser->set('id_moduls', $module);
            $newuser->set('role', $role);
            $newuser->save();
            $user->setId($newuser->id());

            return $user;
        }
    }

    public static function redirect(Slim $app, Session $session, $forward = false){

        // redirect them to intended url if required
        if ($forward)
        {
            if ($session->get('urlRedirect'))
            {
                $tmp = $session->get('urlRedirect');
                $session->remove('urlRedirect');
                $app->redirect($app->request->getRootUri() . $tmp);
            }
        }
        else
        {
            //log them in and send to home page
            $app->redirect($app->request->getRootUri() . '/');
        }
    }
}
