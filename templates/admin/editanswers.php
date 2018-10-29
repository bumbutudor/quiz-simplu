<?php
include'header.php';

use \SimpleQuiz\Utils\Base\EnumTypeQuestions;
?>
<div id="container" class="quiz">
        <div class="row">
          <div id="intro" class="col-md-8 col-md-offset-2">
              
              <div><a class="btn btn-primary" href="<?php echo $root; ?>/admin/quiz/<?php echo $quiz->getId(); ?>/"><span class="glyphicon glyphicon-arrow-left"></span> Înapoi la detaliile exercițiului</a></div>
                <?php if (isset($flash['success'])) { echo '<div id="updater" class="alert alert-success">'.$flash["success"].'</div>'; } ?>
                <?php if (isset($flash['error'])) { echo '<div id="updater" class="alert alert-danger">'.$flash["error"].'</div>'; } ?>
                <h3>Editează Răspunsuri: </h3>
                <div class="row">
                    <div class="col-md-7">
                        <?php if (!empty($question->getText()))  { ?>
                        <p style="padding-bottom: 30px;" class="formControlul"><?php echo $question->getText(); ?></p>
                        <?php } ?>
                        <?php if (!empty($question->getImage()))  { ?>
                        <img style="max-width: 60%; height: auto; display: block; margin-left: auto; margin-right: auto; padding-bottom: 15px;" src="<?php echo $question->getImage();?>" class="img-rounded">
                        <p></p>
                         <?php } ?>
                            <form id="answeredit" action="" method="post">
                            <table id="answers" class="table table-responsive table-hover table-bordered">
                                <thead>
                                    <tr><th style="text-align: center;">Răspuns Corect</th><th>Text</th></tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    foreach ($answers as $answer) : ?>
                                    <tr class="answer-row">
                                        <?php if($quiz->getQuizType()->id != EnumTypeQuestions::ImageQuestion) {?>
                                        <td style="text-align: center;">
                                           <input class="correct" name="correct" value="<?php echo $i - 1; ?>" type="radio" <?php echo $i == 1 ? 'checked' : ''; ?>> 
                                        </td>
                                        <?php } else { ?>
                                        <td style="text-align: center;">
                                           <input class="correct" name="correct" type="checkbox" value="1" checked/> 
                                        </td>
                                        <?php }?>
                                        <td>
                                            <div class="input-group">
                                            <?php if($quiz->getQuizType()->id != EnumTypeQuestions::TextQuestion) {?>
                                                <input type="text" name="answer[]" value="<?php echo $answer; ?>" class="form-control">
                                                <span class="input-group-btn">
                                                    <button class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                                </span>
                                            <?php } else { ?>
                                                <textarea name="answer[]" class="form-control" rows="7" cols="70"><?php echo $answer; ?></textarea>
                                            <?php }?>
                                                
                                            </div>
                                        </td>
                                    </tr>
                                    <?php $i++;
                                    endforeach;
                                    ?>
                                    <tr class="template answer-row" style="display:none;">
                                        <td style="text-align: center;">
                                           <input class="correct" name="correct" type="radio" /> 
                                        </td>
                                        <td>
                                            <div class="input-group">
                                            <input type="text" name="" value="" class="form-control answerinput">
                                            <span class="input-group-btn">
                                                <button class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                            </span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                                <?php if($quiz->getQuizType()->id == EnumTypeQuestions::SelectQuestion || $quiz->getQuizType()->id == EnumTypeQuestions::RadioQuestion ) {?>
                                <button id="addanswer" type="button" class="btn btn-primary pull-right">Adaugă Răspuns <span class="glyphicon glyphicon-plus-sign"></span></button>
                                <?php } else { ?>
                                               <p></p>
                                <?php }?>

                                <?php if (!empty($question->getExplanation()))  { ?>
                                <p style="padding-top: 30px;"> Comentariu: </p>
                                <div style="padding-bottom: 20px; margin-top: -10px;"><?php echo $question->getExplanation(); ?></div>
                                <?php } ?>
        
                            
                                <button type="submit" class="btn btn-success">Salvează <span class="glyphicon glyphicon-ok"></span></button>
                                
                            </p>
                            <input type="hidden" name="_METHOD" value="PUT" />
                        </form> 
                    </div>
                    <div class="col-md-3">
                        <div id="contextual"></div>
                        <div id="contextual2"></div>
                    </div>
                </div>
            </div>
      </div><!-- /.row -->
        
    </div><!--container-->
    <?php include 'footer.php'; ?>
