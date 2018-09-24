<?php
namespace SimpleQuiz\Utils\Base;

interface ISubcat {
    
    public function setIdSubcat($id);
    
    public function getIdSubcat();
    
    public function getNameSubcat();
    
    public function getDescriptionSubcat();
       
    public function getCategorySubcat();

    public function getQuizNum();
}
