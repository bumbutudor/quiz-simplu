<?php include 'header.php'; ?>
<div id="container" class="quiz">
  <div class="row row-offcanvas row-offcanvas-right">
    <div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="sidebar-nav">
              <h2>GRAMATICĂ ȘI VOCABULAR</h2>

                        
                    <?php foreach ($categories as $cat): ?>
                       <ul><li class="client"><a href="<?php echo $root; ?>/categories/<?php echo $cat->id ;?>"><?php echo $cat->name; ?></a></li></ul>
                    <?php endforeach; ?>
                    <!-- Click sa apara de desupt submodulele -->
                    <hr/>
                  <?php foreach ($subcategories as $subcat): ?>
                       <ul><li class="client"><a href="<?php echo $root; ?>/subcategories/<?php echo $subcat->id ;?>"><?php echo $subcat->name; ?></a></li></ul>
                    <?php endforeach; ?>

          </div><!--/.sidebar-nav -->
        </div><!--/span-->
        <div class="col-xs-12 col-sm-8">

        <div class="main-col">
            <div class="wrapper">
              <div class="page-exercise">
                <h1><?php echo $quiz->getName(); ?></h1>
              </div>
              <div class="exercise__desc">
                
                <h3>Sarcina nr:</h3>
                <p><?php echo $quiz->getDescription(); ?></p> 
                <a href="#">Exemplu</a>
              </div>
                <?php
                    if (! $session->get('last') ) :
                    $question = $quiz->getQuestion($num);
                    $answers = $quiz->getAnswers($num);
                ?>
                  <p><?php echo $question->getText(); ?></p>
                   
                    <form id="questionBox" method="post" action="<?php echo $root; ?>/quiz/process">
                        <ul>
                        <?php 
                        $shuffledAnswers = SimpleQuiz\Utils\Base\Utils::shuffleAssoc($answers);

                        $acount = 0;
                        foreach ($shuffledAnswers as $answer) 
                        {
                            echo '<li><input type="radio" id="answer' . $acount . '" value="' . $answer . '" name="answers" />' .PHP_EOL;
                            echo '<label for="answer' . $acount . '">' . $answer . '</label></li>' . PHP_EOL;
                            $acount++;
                        }
                        ?>
                        </ul>
                    <div class="col-sm-6">
                    <p>
                        <input type="hidden" name="nonce" value="<?php echo $nonce; ?>" />
                        <input type="hidden" name="num" value="<?php echo $num; ?>" />
                        <input type="hidden" name="quizid" value="<?php echo $quiz->getId(); ?>" />
                        <input type="submit" id="submit" class="btn btn--primary btn--full" name="submit" value="Verifică" />
                    </p>
                    </div>
                </form>
                <?php else:
                    $percentage = round(((int) $session->get('score') / (int) $quiz->countQuestions()) * 100);
                    ?>

                    <?php
                    $x = 1;
                    $numquestions = $quiz->countQuestions();
                    echo '<ol class="tasks">';
                    echo "<li>";
                    foreach ($quiz->getAllAnswersGroupedByQuestion() as $answergroup) :
                        if ($x % 2 !== 0) { echo '<div style="clear:both"></div>';}
                        echo '<ul>' . PHP_EOL;
                        echo '</br>';
                            $y = 0;
                            foreach( $answergroup as $answer) :
                                if (isset($_SESSION['correct'][$x])):
                                    //first in array(correct by default) AND chosen by user
                                    if ( ($y === 0) && ( in_array( $answer, $_SESSION['correct'][$x]) ) ) :
                                        echo '<li class="correctuser">'. $answer. ' (Corect!)</li>' . PHP_EOL;
                                    //correct but not chosen by user
                                    elseif ($y === 0) :
                                        echo '<li class="correct">' . $answer . '</li>'  . PHP_EOL;
                                    //wrong, not chosen by user
                                    else :
                                        echo "<li>$answer</li>\n";
                                    endif;
                                   
                                    //wrong AND chosen by user
                                else :
                                    if ( in_array( $answer, $_SESSION['wrong'][$x])) :
                                        if (strlen($quiz->getQuestion($x)->getExplanation()) !== 0) :
                                            echo '<li class="wrong">' . $answer . ' (Gresit!) <span class="tooltip-quiz tooltip-effect-1"><span class="tooltip-item-quiz">Comentariu</span><span class="tooltip-content-quiz"><span class="tooltip-text-quiz">'.$quiz->getQuestion($x)->getExplanation().'</span></span></span>' . PHP_EOL;
                                        else : 
                                            echo '<li class="wrong">' . $answer . ' (Gresit!) ';
                                        endif;
                                    //correct but not chosen by user
                                    elseif ($y === 0) :
                                        echo '<li class="correct">' . $answer . '</li>'  . PHP_EOL;
                                    //wrong, not chosen by user
                                    else :
                                        echo "<li>$answer</li>\n";
                                    endif;
                                endif;
                                
                                 $y++;
                            endforeach;
                        echo '</ol>';
                     
                        //move on to next set of answers
                        $x++;
                    endforeach; ?>
                   </li>
                   </ul>
                    <p id="score"> Ați răspuns corect la <?php echo $session->get('score'); ?> din <?php echo $quiz->countQuestions(); ?></p>
                    <p class="userscore"><?php echo $percentage; ?>%</p>
                    <p id="time">Timp de: <?php echo $timetaken['mins'] . $timetaken['secs']; ?></p>
                    <?php $_SESSION['last'] = false; $_SESSION['finished'] = 'no';?>
                    <div class="col-sm-6">
                        <a class="btn btn--primary btn--full" href="<?php echo $root; ?>/quiz/<?php echo $quiz->getId(); ?>/test">La începutul exercițiului</a>
                    </div>
                    <div class="col-sm-6">
                        <a class="btn btn--primary btn--full" href="<?php echo $root; ?>">La pagina pricipală</a>
                    </div>    
                    <?php endif; ?>
        
                    </div>
        
                 </div>

                </div>
            </div><!--container-->

<?php include 'footer.php';
