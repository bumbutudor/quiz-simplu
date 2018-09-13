<?php
namespace SimpleQuiz\Utils\Base;

interface ISimple {
    
    public function addQuiz(Array $quizmeta);
    
    public function updateQuiz(Array $quizmeta);
    
    public function deleteQuiz($quizid);

    public function getQuizzes($active = true);
    
    public function getCategories($active = false);

    public function getSubcategories($id);
<<<<<<< HEAD
    
    public function getSubcategories($active = true);
=======
>>>>>>> ea896a4766ca7144b0d83bdf1ba8748dd3dd4230
    
    public function getCategory($id);
    
    public function getCategoryQuizzes($id);
    
    public function getUsers($quizid = false);
    
}
?>
