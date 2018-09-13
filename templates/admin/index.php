<?php
include'header.php';
?>

<div id="container" class="quiz">
      <div class="row">
        <div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="sidebar-nav">
              <h4>Submodule</h4>
              <div class="list-group">
                <?php foreach ($subcategories as $subcat): ?>
                       <ul><li><a href="<?php echo $root; ?>/subcategories/<?php echo $subcat->id ;?>"><?php echo $subcat->name; ?></a></li></ul>
                       
                    <?php endforeach; ?>
              </div>

          </div><!--/.sidebar-nav -->
        </div><!--/span-->
          <div id="intro" class="col-md-8">
              <?php if (isset($flash['success'])) { echo '<div id="updater" class="alert alert-success">'.$flash["success"].'</div>'; } ?>
              <?php if (isset($flash['error'])) { echo '<div id="updater" class="alert alert-danger">'.$flash["error"].'</div>'; } ?>
              <div id="ajaxupdater" class="alert"></div>
          <h4>Bine ati venit, domnule Admin!</h4>
          <p>Ai grija, avand putere mare trebuie responsabilitati mari.</p>
          <h4>Exercitii</h4>
          <?php if (count($quizzes) > 0): ?>
            <table id="quizzes" class="table table-striped">
                <thead>
                    <tr><th>Nume</th><th>Descriere</th><th>Modul</th><th>Submodul</th><th>Tip</th><th>Activ</th><th>Actiuni</th></tr>
                </thead>
                <tbody>
                    <?php
                        foreach ($quizzes as $quiz) :
                            $activeSpan = $quiz->active == 1 ? 'glyphicon-ok-circle' : 'glyphicon-remove-circle';
                            echo '<tr class="quiz"><td><strong><a href="'. $root .'/admin/quiz/'. $quiz->id .'">' . $quiz->name. '</a></strong></td><td>'.$quiz->description.'</td><td>'.$quiz->category.'</td><td>'.$quiz->subcategory.'</td><td>'.$quiz->tip_quiz.'</td><td><span class="glyphicon '.$activeSpan.'"></span></td><td><a href="'. $root .'/admin/quiz/'. $quiz->id .'" data-quiz-id="'.$quiz->id.'" title="Modifica Exercitiu" class="edit btn btn-default btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> <button data-quiz-id="'.$quiz->id.'" title="Sterge Exercitiu" class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button></td></tr>';
                        endforeach;
                    ?>
                </tbody>
            </table>
          <?php else: ?>
          <p>Nu este nici un exercitiu la moment. Poate adaugati unul?</p>
          <p>Doar dati click pe butonul 'Creati Un Exercitiu'</p>
          <?php endif; ?>
            <p>
                <button id="addquiz" title="Adauga Un Exercitiu" type="button" class="btn btn-primary pull-right">Creeaza Un Exercitiu <span class="glyphicon glyphicon-plus-sign"></span></button>
            </p>
        </div>
      </div><!-- /.row -->
        
    </div><!--container-->
    
    <!-- Add Quiz Modal -->
    <div class="modal fade" id="quiz-add-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Adauga Un Exercitiu:</h4>
          </div>
            <form id="quizadd" method="post" action="<?php echo $root . '/admin/quiz/'; ?>">
            <div class="modal-body">
                <p><label for="quizname">Nume Exercitiu:</label>
                   <input name="quizname" id="quizname" type="text" placeholder="Nume Exercitiu" class="form-control" />
                   <span class="helper help-block">Va rog sa dati o denumire exercitiului</span>
                </p>
                <p><label for="description">Descriere Exercitiu:</label>
                   <input name="description" id="description" type="text" placeholder="Descriere Exercitiu" class="form-control" />
                </p>
                <p><label for="category">Modul Exercitiu:</label>
                   <select name="category" id="category" class="form-control">
                       <?php foreach ($categories as $category) : ?>
                            <option value="<?php echo $category->id; ?>"><?php echo $category->name; ?></option>
                       <?php endforeach; ?>
                   </select>
                </p>
				<p><label for="subcategory">Submodul Exercitiu:</label>
                   <input name="subcategory" id="subcategory" type="text" placeholder="Submodul Exercitiu" class="form-control" />
                </p>
				<p><label for="category">Tip Exercitiu:</label>
                   <select name="category" id="category" class="form-control">
                       <?php foreach ($categories as $category) : ?>
                            <option value="<?php echo $category->id; ?>"><?php echo $category->name; ?></option>
                       <?php endforeach; ?>
                   </select>
                </p>
				
                <h4>Activ?</h4>
                <p><label for="quizactiveyes"> Da: </label>
                   <input name="active" id="quizactiveyes" value="1" type="radio" class="radio-inline" />
                   <label for="quizactiveno"> Nu: </label>
                   <input name="active" id="quizactiveno" value="0" type="radio" class="radio-inline" />
                </p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Anulare</button>
              <button type="submit" class="btn btn-success">Creaza Exercitiu</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <?php include 'footer.php'; ?>
