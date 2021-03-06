<?php
namespace SimpleQuiz\Utils\Base;

interface ISimple {
    
    public function addQuiz(Array $quizmeta);
    
    public function updateQuiz(Array $quizmeta);
    
    public function deleteQuiz($quizid);

    public function addSubcat(Array $subcatmeta);
    
    public function updateSubcat(Array $subcatmeta);
    
    public function deleteSubcat($subcatid);

    public function getQuizzes($active = true);
    
    public function getCategories($active = false);

    public function getSubcategories($active = false);

    public function getCategorySubcategories($id);

    public function getCategory($id);

    public function getSubcategory($id);

    public function getQuiz($id);

    public function getQuizType($id);

    public function getQuizTypes($active = true);
    
    public function getCategoryQuizzes($id);

    public function getSubcategoryQuizzes($id);
    
    public function getUsers($quizid = false);

}
?>
