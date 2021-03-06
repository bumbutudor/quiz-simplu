<?php
namespace SimpleQuiz\Utils;

use SimpleQuiz\Utils\Base\User;
use Slim\Helper\Set;

class Quiz implements Base\IQuiz {

    protected $_id;
    protected $_name;
    protected $_description;
    protected $_category;
    protected $_id_subcategory;
    protected $_quiz_type;
    protected $_quiz_type_class;
    protected $_active;
    protected $_answers = array();
    protected $_questions;
    protected $_question;
    protected $_users;
    protected $_leaderboard;

    /**
     * @param Set $container
     */
    public function __construct(Set $container)
    {
        $this->_leaderboard = $container->leaderboard;
        $this->_questions = new QuestionStorage();
    }

    /**
     * @param $id
     * @return bool
     */
    public function setId($id)
    {
        $quizobj = \ORM::for_table('quizzes')->join('categories', array('quizzes.category', '=', 'categories.id'))->join('subcategories', array('quizzes.id_subcategory', '=', 'subcategories.id'))->join('quiz_types', array('quizzes.quiz_type', '=', 'quiz_types.id'))->select_many('quizzes.name', 'quizzes.description', array('category' => 'categories.name'), array('id_subcategory' => 'subcategories.name'), array('quiz_type' => 'quiz_types.name'), array('quiz_type_class' => 'quiz_types.class'), array('quiz_type_id' => 'quiz_types.id'), 'quizzes.active')->find_one($id);
       
        if ($quizobj) {
            $this->_id = $id;
            $this->_name = $quizobj->name;
            $this->_description = $quizobj->description;
            $this->_category = $quizobj->category;
            $this->_id_subcategory = $quizobj->id_subcategory;
            $this->_quiz_type = $obj = (object) array('name'=> $quizobj->quiz_type, 'id' => $quizobj->quiz_type_id);
            $this->_active = $quizobj->active;
            $this->_quiz_type_class = $quizobj->quiz_type_class;
            
            return true;
        }
       
        return false;
    }

    /**
     * @return int
     */
    public function getId()
    {
        return (int) $this->_id;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->_name;
    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->_description;
    }

    /**
     * @return bool
     */
    public function isActive()
    {
        return $this->_active == 1 ? true : false;
    }


    /**
     * @param $questionid
     * @return bool
     */

    // a fost adaugat questionnum in loc de $questionid
    public function getAnswers($questionid)
    {
        if ($questionid)
        {
            return $this->getQuestion($questionid)->getAnswers();
        }
        else {
            throw new \InvalidArgumentException("Trebuie să furnizați un ID pentru întrebare.");
        }
        
        return false;
    }

    /**
     * @return array
     */
    public function getAllAnswersGroupedByQuestion()
    {
        //pull all answers from db grouped by question
        $obj = \ORM::for_table('answers')->raw_query("SELECT group_concat( a.text ORDER BY a.correct DESC SEPARATOR '~' ) as grouped FROM answers a where a.quiz_id = :quizid GROUP BY a.question_num", array('quizid' => $this->_id) )->find_array();
        foreach ($obj as $answers)
        {
            $answerarray = explode('~', $answers['grouped']);
            array_push($this->_answers,$answerarray);
        }

        return $this->_answers;
    }

    /**
     * @param array $answers
     * @param $questionid
     * @return bool
     */
    public function updateAnswers(Array $answers, $questionid)
    {
        $this->getQuestion($questionid)->updateAnswers($answers);

        return true;
    }

    /**
     * @param $questionid
     * @return bool
     */
    public function deleteAnswers($questionid)
    {
        $this->getQuestion($questionid)->deleteAnswers();
        return true;
    }

    /**
     * @param $questionid
     * @param array $answers
     * @return bool
     */
    public function addAnswers($questionid, Array $answers)
    {
        $this->getQuestion($questionid)->addAnswers($answers);
    }

    /**
     * @param $text
     * @param $type
     * @param array $answers
     * @return bool
     * @return explanation
     */
    public function addQuestion($text, $type, Array $answers, $explanation, $image)
    {
        $max = \ORM::for_table('questions')->where('quiz_id', $this->_id)->max('num');
        $num = $max + 1;

        $newquestion = \ORM::for_table('questions')->create(
            array(
                'num' => $num,
                'quiz_id' => $this->_id,
                'text' => $text,
                'explanation' => $explanation,
                'image'=> $image
            )
        );

        //save the new question in db then add to the question storage
        if ($newquestion->save())
        {
            //create a question of desired type
            $questionType = __NAMESPACE__  . '\\' . ucfirst($type) . 'Question';
            //create a new Question instance
            $this->_question = new $questionType($newquestion->id(),$num, $this->_id, $text, $explanation, $image);
            $this->_question->addAnswers($answers);
            $this->_questions->attach($this->_question);

            return true;
        }
        
        return false;
    }

    /**
     * @param $questionid
     * @param $text
     * @return bool
     */
    public function updateQuestion($questionid, $text, $image)
    {
        $this->getQuestion($questionid)->update($text, $image);

        return true;
    }

    /**
     * @param $questionid
     * @return bool
     */
    public function deleteQuestion($questionnum, $questionid)
    {
        //foreign_key constraints take care of deleting related answers
        $q = \ORM::for_table('questions')->where('quiz_id', $this->_id)->where('id', $questionid)->find_one();
        $q->delete();
        
        //reorder the num column in questions table
        //foreign_key constraints take care of updating related answers
        $toupdate = \ORM::for_table('questions')->where('quiz_id', $this->_id)->where_gt('num', $questionnum)->find_many();
        foreach ($toupdate as $question) {
            $question->num = $question->num - 1;
        }

        return $toupdate->save();
    }

    /**
     * @param $questionid
     * @return bool|mixed|object
     */
    public function getQuestion($questionid)
    {
        return $this->_questions->getById($questionid);
    }

    public function getQuestions()
    {
        return $this->_questions;
    }

    /**
     * @return int
     */
    public function countQuestions()
    {
        return count($this->_questions);
    }

    /**
     * @return mixed
     */
    public function getCategory()
    {
        return $this->_category;
    }

    public function getSubcategory()
    {
        return $this->_id_subcategory;
    }

    public function getQuizType()
    {
        return $this->_quiz_type;
    }


    /**
     * @return $this
     */
    public function populateQuestions()
    {
        $quizquestions = \ORM::for_table('questions')->where('quiz_id', $this->_id)->order_by_asc('num')->find_array();

        foreach ($quizquestions as $question)
        {
            $clazz = new \ReflectionClass('SimpleQuiz\Utils\\'.$this->_quiz_type_class);
            $instance = $clazz->newInstanceArgs( array($question['id'], $question['num'], $this->_id, $question['text'], $question['image'], $question['explanation']));

            $questionObject = $instance;        //new RadioQuestion($question['id'], $question['num'], $this->_id, $question['text'], $question['explanation']);
            $this->_questions->attach($questionObject);
        }

        return $this;
    }

    //following 2 methods to be combined
    /**
     *
     */
    public function populateUsers()
    {
        $this->_users = $this->_leaderboard->getMembers($this->_id);
    }

    /**
     * @return mixed
     */
    public function getUsers()
    {
        return $this->_users;
    }

    /**
     * @param $num
     * @return mixed
     */
    public function getLeaders($num)
    {
        return $this->_leaderboard->getMembers($this->_id, $num);
    }

    /**
     * @param User $user
     * @param $score
     * @param $start
     * @param $end
     * @param $timetaken
     * @return bool
     */
    public function addQuizTaker(User $user,$score,$start,$end,$timetaken)
    {
        return $this->_leaderboard->addMember($this->_id, $user,$score,$start,$end,$timetaken);
    }
}
