<?php
namespace SimpleQuiz\Utils\Base;


use SimpleQuiz\Utils\User\AdminUser;

class User {

    private $name;
    private $email;
    private $quizzes;
    private $password;
    private $id;
    private $level;
    private $role;
    private $moduleaccess;

    function __construct($email, $name)
    {
        $this->email = $email;
        $this->name = $name;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getId()
    {
        return $this->id;
    }

    public function isAdmin()
    {
        return $this instanceof AdminUser;
    }

    public function getQuizzes()
    {
        return $this->quizzes;
    }

    public function getScore($quizid)
    {

    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email)
    {
        $this->email = $email;
    }

    public function getPassword()
    {
        return $this->password;
    }

    public function setPassword($password)
    {
        $this->password = $password;
    }

    public function getHash()
    {
        return $this->hash;
    }

     public function setLevel($level)
    {
        $this->level = $level;
    }
    
    public function getLevel()
    {
        return $this->level;
    }

    public function setRole($role)
    {
        $this->role = $role;
    }
    
    public function getRole()
    {
        return $this->role;
    }

    public function setModuleaccess($moduleaccess)
    {
        $this->moduleaccess = $moduleaccess;
    }

    public function getModuleaccess()
    {
        return $this->moduleaccess;
    }
}
