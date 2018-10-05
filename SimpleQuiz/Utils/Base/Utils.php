<?php
namespace SimpleQuiz\Utils\Base;

use \SimpleQuiz\Utils\Base\EnumCategories;

class Utils {

    public static function shuffleAssoc($array)
    {
        $keys = array_keys($array);
        shuffle($keys);
        $shuffled = array();
        foreach ($keys as $key) {
            $shuffled[$key] = $array[$key];
        }
        return $shuffled;
    }

    public static function memberSort($a, $b)
    {
        return $b['score'] - $a['score'];
    }


    /**
     * @param $time
     * @return array
     */
    public static function calculateTimeTaken($time)
    {
        $ret = array();
        $formattedTime = date("i:s", $time); //formatted as minutes:seconds
        $timeportions = explode(':', $formattedTime);

        $ret['mins'] = $timeportions[0] == '00' ? '' : ltrim($timeportions[0], '0') . ' min ';
        $ret['secs'] = $timeportions[1] . ' sec';

        return $ret;
    }

    public static function getCategoriesNumber() 
    {
        $refl = new \ReflectionClass('SimpleQuiz\Utils\Base\EnumCategories');
        return count($refl->getConstants());
    }

    public static function binaryCalculation($binaryModuleId) {
        $result = 0;

        for($i = 0; $i < Utils::getCategoriesNumber(); $i++)
        {
            if ($binaryModuleId & EnumCategories::Ortografie) {
                $result = 1; 
            } 
            if ($binaryModuleId & EnumCategories::Ortoepie) {
                $result = 2; 
            }
            if ($binaryModuleId & EnumCategories::Morfologie) {
                $result = 3; 
            } 
            if ($binaryModuleId & EnumCategories::Sintaxa) {
                $result = 4; 
            }   
            if ($binaryModuleId & EnumCategories::LexicSemantica) {
                $result = 5; 
            }   
            if ($binaryModuleId & EnumCategories::Stilistica) {
                $result = 6; 
            }  
        }

        return $result;
    }
}
