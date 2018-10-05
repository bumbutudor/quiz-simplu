<?php
namespace SimpleQuiz\Utils\Base;

abstract class EnumCategories {
	const Ortografie 	 = 1;
	const Ortoepie   	 = 2;
	const Morfologie 	 = 4;
	const Sintaxa  	 	 = 8;
	const LexicSemantica = 16;
	const Stilistica	 = 32;
}