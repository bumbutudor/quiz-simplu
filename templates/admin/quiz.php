<?php
include'header.php';
?>
<div id="container" class="quiz">
      <div class="row">
            <div id="intro" class="col-md-8 col-md-offset-2">
                 <?php if (isset($flash['success'])) { echo '<div id="updater" class="alert alert-success">'.$flash["success"].'</div>'; } ?>
                 <?php if (isset($flash['error'])) { echo '<div id="updater" class="alert alert-danger">'.$flash["error"].'</div>'; } ?>
                <div id="ajaxupdater" class="alert"></div>
                <div><a class="btn btn-primary" href="<?php echo $root; ?>/admin/"><span class="glyphicon glyphicon-arrow-left"></span> Înapoi la toate exercițiile</a></div>
                <br />
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><h3>Detalii exercițiu:</h3></div>
                    <div class="panel-body">
                      <ul style="width:50%;" class="list-group">
                          <li class="list-group-item"><strong>Nume</strong>: <?php echo $quiz->getName(); ?></li>
                          <li class="list-group-item"><strong>Sarcina</strong>: <?php echo $quiz->getDescription(); ?></li>
                          <li class="list-group-item"><strong>Modul</strong>: <?php echo $quiz->getCategory(); ?></li>
                          <li class="list-group-item"><strong>Submodul</strong>: <?php echo $quiz->getSubcategory(); ?></li>
                          <li class="list-group-item"><strong>Tip Exercițiu</strong>: <?php echo $quiz->getQuizType(); ?></li>
                          <li class="list-group-item"><strong>Activ? </strong><?php echo $quiz->isActive() ? '<span class="glyphicon glyphicon-ok">' : '<span class="glyphicon glyphicon-remove-circle">' ?></li>
                          <li class="list-group-item"><strong>Număr de exemple</strong>: <span class="badge"><?php
                                  echo $quiz->countQuestions(); ?></span></li>
                          <li class="list-group-item"><strong>De câte ori a fost rezolvat</strong>: <span class="badge"><?php echo count($quiz->getUsers()); ?></span></li>
                      </ul>
                        <button id="editquiz" title="Modifică Detaliile Exercițiului" type="button" class="btn btn-primary">Editează Detalii Exercițiu <span class="glyphicon glyphicon-pencil"></span></button>
                    </div>
                  <div class="panel-heading"><h3>Exemple:</h3></div>
                    <!-- Table -->
                    <table id="questions" class="table table-striped table-responsive">
                          <thead>
                              <tr>
                                  <th>Exemple</th><th>Acțiuni</th>
                              </tr>
                          </thead>
                          <tbody>
                              <?php
                              foreach ($quiz->getQuestions() as $question) :?>
                              <tr class="question">
                                  <td class="question"><?php echo $question->getNum(); ?></td>
                                  <td style="text-align:center;">
                                      <!-- <button data-question-id="<?php echo $question->getNum(); ?>" title="Editează Întrebarea" class="edit btn btn-default btn-primary" type="button"><span class="glyphicon glyphicon-pencil"></span></button> -->
                                      <a href="<?php echo $root; ?>/admin/quiz/<?php echo $quiz->getId();
                                      ?>/question/<?php echo $question->getNum(); ?>/edit/" title="Editează Răspunsuri"
                                         class="answerlink btn btn-default btn-primary"><span class="glyphicon glyphicon-pencil"></span></a>
                                      <button data-question-id="<?php echo $question->getNum(); ?>" data-quiz-id="<?php
                                      echo $quiz->getId(); ?>" title="Șterge Exemplu" class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                  </td>
                              </tr>
                              <?php endforeach; ?>  
                          </tbody>
                      </table>
                      <div class="panel-body">
                          <button id="addquestion" title="Adaugă o întrebare nouă" type="button" class="btn btn-primary pull-right">Adaugă un exemplu <span class="glyphicon glyphicon-plus-sign"></span></button>
                      </div>
                </div>
            </div>
            </div><!-- /.row -->
        
</div><!--container-->
<!-- Modals -->
<!-- Edit Question Modal -->
    <div class="modal fade" id="qmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Editează Întrebare:</h4>
          </div>
            <form id="questionedit" method="post" action="">
            <div class="modal-body">
                <p>
                   <input name="questiontext" id="questioninput" type="text" class="form-control" />
                   <input name="questionid" id="questionid" type="hidden" />
                   <input type="hidden" name="_METHOD" value="PUT" />
                   <span class="helper help-block">Nu este întrebare!</span>
                </p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Anulează</button>
              <button id="savetext" type="submit" class="btn btn-primary">Salvează Schimbările</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
<!-- Add Question Modal -->
    <div class="modal fade" id="q-add-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Adaugă un exemplu nou:</h4>
          </div>
            <form id="questionadd" method="post" action="">
            <div class="modal-body">
                <!-- <p><label for="newquestioninput">Întrebare:</label>
                   <input name="questiontext" id="newquestioninput" type="text" placeholder="Întrebarea aici" class="form-control" />
                   <span class="helper help-block">Nu este întrebare!</span>
                </p> -->
                <h5><strong>Răspunsuri:</strong></h5>
                <table id="newanswers" class="table table-responsive table-hover table-bordered">
                    <thead>
                        <tr><th style="text-align: center;">Răspuns corect?</th><th>Raspuns</th></tr>
                    </thead>
                    <tbody>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="0" type="radio" /> 
                            </td>
                            <td>
                                <div class="input-group">
                                    <input type="text" name="answer[]" placeholder="Răspuns" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="1" type="radio" /> 
                            </td>
                            <td>
                                <div class="input-group">
                                    <input type="text" name="answer[]" placeholder="Răspuns" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr class="template answer-row" style="display:none;">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" type="radio" /> 
                            </td>
                            <td>
                                <div class="input-group">
                                <input type="text" placeholder="Răspuns" name="" value="" class="form-control answerinput">
                                <span class="input-group-btn">
                                    <button class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                </span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p><button id="addanswer" type="button" class="btn btn-primary pull-right">Adaugă încă un răspuns <span class="glyphicon glyphicon-plus-sign"></span></button></p>
                <p style="margin-top: 50px"><label for="">Comentariu: <sup>*</sup></label>
                   <input name="explanation" id="explanation" type="text" placeholder="Comentează aici" class="form-control" />
                </p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Anulează</button>
              <button type="submit" class="btn btn-success">Salvează Exemplu</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

  <!-- START TEST QUIZ -->
    <div class="modal fade" id="1q-add-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Adaugă un nou exemplu:</h4>
          </div>
            <form id="questionTypeInput" method="post" action="">
            <div class="modal-body">
                <p><label for="newquestiontypeinput">Exemplu:</label>
                   <input name="questiontext" id="newquestiontypeinput" type="text" placeholder="Întrebarea aici" class="form-control" />
                   <span class="helper help-block">Nu este exemlu!</span>
                </p>
                <a href="#" id="createInput">Creează input</a>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Anulează</button>
              <button type="submit" class="btn btn-success">Salvează Exemplu</button>
            </div>
            </form>
            <button id="transpormText">Buton</button>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
  <!-- END TEST QUIZ -->


  <!-- Quiz de tip TEXT> da eroare la adaugare inca un raspuns -->
    <div class="modal fade" id="3q-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Adaugă un exemplu nou:</h4>
          </div>
            <form id="questionadd" method="post" action="">
            <div class="modal-body">
                <table id="newanswers" class="table table-responsive table-hover table-bordered">
                    <thead>
                        <tr><th style="text-align: center;">Text corect?</th><th>Text</th></tr>
                    </thead>
                    <!-- Aici este o problema -->
                    <!-- <tbody>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="0" type="checkbox" /> 
                            </td>
                            <td>
                                <div class="input-group">
                                    <textarea name="answer[]" placeholder="Scrie textul aici..." class="form-control" rows="7" cols="70"></textarea>
                                </div>
                            </td>
                        </tr>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="1" type="checkbox" /> 
                            </td>
                            <td>
                                <div class="input-group">
                                     <textarea name="answer[]" placeholder="Copie textul aici..." class="form-control" rows="7" cols="70"></textarea>
                                </div>
                            </td>
                        </tr>
                    </tbody> -->
                </table>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Anulează</button>
              <button type="submit" class="btn btn-success">Salvează Exemplu</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
  <!-- Quiz de tip TEXT -->
    
    <!-- Update Quiz Modal -->
    <div class="modal fade" id="quiz-edit-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Editează Exercițiul:</h4>
          </div>
            <form id="quizedit" method="post" action="<?php echo $root . '/admin/quiz/'; ?>">
            <div class="modal-body">
                <p><label for="quizname">Nume Exercițiu:</label>
                   <input name="quizname" id="quizname" type="text" placeholder="Denumire Exercițiu" class="form-control" value="<?php echo $quiz->getName(); ?>" />
                   <span class="helper help-block">Vă rugăm să dați un nume exercițiului!</span>
                </p>
                <p><label for="description">Sarcina:</label>
                   <input name="description" id="description" type="text" placeholder="Sarcina" value="<?php echo $quiz->getDescription(); ?>" class="form-control" />
                </p>

                <p><label for="category">Modul Exercițiu:</label>
                   <select name="category" id="category" class="form-control" />
                     <?php foreach ($categories as $category) : ?>
                           <?php $selected = ($category->name == $quiz->getCategory()) ? 'selected' : ''; ?>
                           <option value="<?php echo $category->id; ?>" <?php echo $selected; ?>><?php echo $category->name; ?></option>
                       <?php endforeach; ?>
                   </select>
                </p>

                <!-- 19/09/2018 vizualizare submodul exercitiu-->
                <p><label for="id_subcategory">Submodul Exercițiu:</label>
                   <select name="id_subcategory" id="id_subcategory" class="form-control" />
                    <?php foreach ($subcategories as $subcategory) : ?>
                             <?php $selected = ($subcategory->name == $quiz->getSubcategory()) ? 'selected' : ''; ?>
                            <option value="<?php echo $subcategory->id; ?>" <?php echo $selected; ?>><?php echo $subcategory->name; ?></option>
                       <?php endforeach; ?>
                     
                   </select>
                </p>

                <!-- 24/09/2018 vizualizare tip exercitiu-->
                <p><label for="quiz_type">Tip Exercițiu:</label>
                   <select name="quiz_type" id="quiz_type" class="form-control" />
                     <?php foreach ($quiz_types as $quiz_type) : ?>
                             <?php $selected = ($quiz_type->name == $quiz->getQuizType()) ? 'selected' : ''; ?>
                            <option value="<?php echo $quiz_type->id; ?>" <?php echo $selected; ?>><?php echo $quiz_type->name; ?></option>
                       <?php endforeach; ?>
                   </select>
                </p>
               
                
                <h4>Active?</h4>
                <p><label for="quizactiveyes" class="inline"> Da: </label>
                   <input name="active" id="quizactiveyes" value="1" <?php if ($quiz->isActive()) { echo 'checked';} ?> type="radio" class="" /><br />
                   <label for="quizactiveno"> Nu: </label>
                   <input name="active" id="quizactiveno" value="0" <?php if (! $quiz->isActive()) { echo 'checked';} ?> type="radio" class="radio-inline" />
                   <input type="hidden" name="_METHOD" value="PUT" />
                   <input type="hidden" name="quizid" value="<?php echo $quiz->getId(); ?>" />
                </p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Anulează</button>
              <button type="submit" class="btn btn-success">Salvează schimbările</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
<?php include 'footer.php'; ?>
