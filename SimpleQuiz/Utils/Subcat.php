<?php
namespace SimpleQuiz\Utils;

use SimpleQuiz\Utils\Base\User;
use Slim\Helper\Set;

class Subcat implements Base\ISubcat {

    protected $_id;
    protected $_name;
    protected $_description;
    protected $_category;
    protected $_quiz_num;




    /**
     * @param $id
     * @return bool
     */
    public function setIdSubcat($id)
    {
        $subcatobj = \ORM::for_table('subcategories')->join('categories', array('subcategories.id_category', '=', 'categories.id'))->select_many('subcategories.name', 'subcategories.description', array('id_category' => 'categories.name'))->find_one($id);
       
        if ($subcatobj) {
            $this->_id = $id;
            $this->_name = $subcatobj->name;
            $this->_description = $subcatobj->description;
            $this->_category = $subcatobj->id_category;
            
            return true;
        }
       
        return false;
    }

    /**
     * @return int
     */
    public function getIdSubcat()
    {
        return (int) $this->_id;
    }

    /**
     * @return string
     */
    public function getNameSubcat()
    {
        return $this->_name;
    }

    /**
     * @return mixed
     */
    public function getDescriptionSubcat()
    {
        return $this->_description;
    }

    
    public function getCategorySubcat()
    {
        return $this->_category;
    }

    
}
