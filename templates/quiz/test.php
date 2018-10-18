<?php include 'header.php'; ?>
<div id="container" class="quiz">
    <div class="row">
        <div class="col-md-6 col-md-offset-2">
            <?php
        if (! $session->get('last') ) :
                $question = $quiz->getQuestion($num);
                $answers = $quiz->getAnswers($num);
            ?>
            <h2><?php echo $quiz->getDescription(); ?></h2>
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
            <p>
                <input type="hidden" name="nonce" value="<?php echo $nonce; ?>" />
                <input type="hidden" name="num" value="<?php echo $num; ?>" />
                <input type="hidden" name="quizid" value="<?php echo $quiz->getId(); ?>" />
                <input type="submit" id="submit" class="btn btn-primary" name="submit" value="Răspuns" />
            </p>
        </form>
        <?php else:
            $percentage = round(((int) $session->get('score') / (int) $quiz->countQuestions()) * 100);
            ?>

            <div class="row">
            <div class="col-md-10 col-md-offset-2">
            <h2>Rezultate</span></h2>
            <?php
            $x = 1;
            $numquestions = $quiz->countQuestions();
            echo "<ul>";
            echo "<li>";
            foreach ($quiz->getAllAnswersGroupedByQuestion() as $answergroup) :
                if ($x % 2 !== 0) { echo '<div style="clear:both"></div>';}
                echo '<div class="row clearfix">';
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
                echo '</ul>';
                echo '</div>';
             
                //move on to next set of answers
                $x++;
            endforeach; ?>
           </li>
           </ul>
            </div>
        </div>

            <div id="finalscore">
            <h2 id="score"> Ați răspuns corect la <?php echo $session->get('score'); ?> din <?php echo $quiz->countQuestions(); ?></h2>
            <h2 class="userscore"><?php echo $percentage; ?>%</h2>
            <h3 id="time">Timp de: <?php echo $timetaken['mins'] . $timetaken['secs']; ?></h3>

            <p><a href="<?php echo $root; ?>/quiz/<?php echo $quiz->getId(); ?>">Înapoi la începutul exercițiului</a></p>
            <p><a href="<?php echo $root; ?>">Înapoi la pagina pricipală</a></p>
            </div>


        <?php endif; ?>
        </div>

    </div>
</div><!--container-->

<?php include 'footer.php';
