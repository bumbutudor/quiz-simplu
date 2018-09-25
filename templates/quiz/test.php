<?php include 'header.php'; ?>
<div id="container" class="quiz">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
        <?php
        if (! $session->get('last') ) :
                $question = $quiz->getQuestion($num);
                $answers = $quiz->getAnswers($num);
            ?>
            <h4>Cine ia testul: <strong><?php echo $user->getName(); ?></strong></h4>
            <h2><?php echo $quiz->getName(); ?></h2>
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
            <div id="finalscore">
            <h2 id="score"><?php echo $user->getName(); ?> a răspuns corect la <?php echo $session->get('score'); ?> din <?php echo $quiz->countQuestions(); ?></h2>
            <h2 class="userscore"><?php echo $percentage; ?>%</h2>
            <h3 id="time">Timp de: <?php echo $timetaken['mins'] . $timetaken['secs']; ?></h3>

            <p id="compare"><a href="<?php echo $root; ?>/quiz/<?php echo $quiz->getId(); ?>/results"></a></p>
            </div>
        <?php endif; ?>
        </div>
    </div>
</div><!--container-->
<?php include 'footer.php';
