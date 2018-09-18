<?php


namespace SimpleQuiz\Utils\Exceptions;


class RegisterException extends \Exception {

    public function __construct()
    {
        parent::__construct("Deja există un asemenea cont. Vă rugăm să mai încercați.");
    }
}
