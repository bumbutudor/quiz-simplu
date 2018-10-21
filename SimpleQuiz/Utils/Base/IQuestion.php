<?php


namespace SimpleQuiz\Utils\Base;


interface IQuestion {

    public function getId();

    public function getNum();

    public function getText();

    public function getImage();

    public function update($text, $image);

    public function getAnswers();

    public function addAnswers( Array $answers);

    public function updateAnswers(Array $answers);

    public function deleteAnswers();
}
