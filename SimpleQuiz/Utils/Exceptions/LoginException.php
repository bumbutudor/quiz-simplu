<?php


namespace SimpleQuiz\Utils\Exceptions;


class LoginException extends \Exception {

        public function __construct()
        {
            parent::__construct("A apărut o eroare în legătură cu încercarea dvoastră de a intra în aplicație. Dacă problema mai apare, vă rugăm să contactați Administratorul.");
        }
}
