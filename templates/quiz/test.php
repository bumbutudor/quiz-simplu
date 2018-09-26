<?php include 'header.php'; ?>
<div id="container" class="quiz">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <h4>Cine ia testul: <strong><?php echo $user->getName(); ?></strong></h4>
            <h2><?php echo $quiz->getDescription(); ?></h2>
            <form id="questionBox" method="post" action="<?php echo $root; ?>/quiz/process">
                <?php 
                    foreach ($questions as $question) {
                        $answers = $quiz->getAnswers($question->getId());

                        echo '<div>'.$question->getText().'</div>';
                        echo '<div>'.$answers.'</div>';
                    }
                ?>
                <input type="submit" id="submit" class="btn btn-primary" name="submit" value="Finiseaza" />
        </form>
        </div>
    </div>
</div><!--container-->
<?php include 'footer.php';
