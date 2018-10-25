<?php
namespace SimpleQuiz\Utils\Base;

class Config
{

    //used when sending emails to users
    //static $appname = 'Logodava Quiz';
    //static $siteurl = 'http://logodava.org/'; // e.g https://simplequiz.co.uk/
    //static $appEmail = 'admin@logodava.org';// email address used in the 'From' header sent in all emails e.g admin@yoursite.com

    //static $emailTemplateDir = '/templates/email/'; // not currently used

    //database credentials . Change as required
    static $dbhost = 'localhost';
    static $dbname = 'cntmd_logodava';
    static $dbuser = 'cntmd_logodava';
    static $dbpassword = 'LogoDavA2018';

    //mailer config. Change as required.
    /*
    //gmail example
    //static $mailHost = 'smtp.gmail.com';
    //static $mailUser = 'example@gmail.com';
    //static $mailPass = '1234';
    //static $mailPort = '587';
    */
    //TODO Trimitere confirmare
    //static $mailHost = 'smtp.gmail.com';
    //static $mailUser = 'bumbutudor10@gmail.com';
    //static $mailPass = 'garfield1993';
    //static $mailPort = '587';
}
