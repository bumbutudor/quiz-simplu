<?php 
    include'quiz/header.php'; 
?>
    <div id="container" class="quiz">
        <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="sidebar-nav">
              <h3>Module</h3>
              <div class="list-group"> <!-- Aici intra modulle -->
                        
                    <?php foreach ($categories as $cat): ?>
                       <ul><li><a href="<?php echo $root; ?>/categories/<?php echo $cat->id ;?>"><?php echo $cat->name; ?></a></li></ul>
                       
                    <?php endforeach; ?>
                    <?php foreach ($subcategories as $subcat): ?>
                       <ul><li><a href="<?php echo $root; ?>/categories/<?php echo $cat->id ;?>"><?php echo $subcat->name; ?></a></li></ul>
                       
                    <?php endforeach; ?>
              </div> 
              <h4>Submodule</h4>
              <div class="list-group">
                <?php foreach ($subcategories as $subcat): ?>
                       <ul><li><a href="<?php echo $root; ?>/subcategories/<?php echo $subcat->id ;?>"><?php echo $subcat->name; ?></a></li></ul>
                       
                    <?php endforeach; ?>
              </div>

          </div><!--/.sidebar-nav -->
        </div><!--/span-->
        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Comutare nav</button>
          </p>
          <div class="jumbotron">
            <h1><?php echo $category->name; ?></h1>
            <p><?php echo $category->description; ?>.</p>
          </div>
        </div><!--/span-->

        
      </div><!--/row-->
      <div class="row">
        <div class="col-xs-12 col-sm-6" style="margin-left: 250px;">
            <div>
                <h4><?php echo $category->name; ?></h4>
                <h4><?php echo $category->name; ?></h4>
                <div class="list-group">
                <?php foreach ($quizzes as $quiz) : 
                      echo '<a href="'.$root . '/quiz/' . $quiz->id .'" class="list-group-item">';
                      echo '<h4 class="list-group-item-heading">'. $quiz->name . '</h4>';
                      echo '<p class="list-group-item-text">'. $quiz->description . '</p>';
                      echo '</a>';
                  endforeach;
                  ?>
                </div>
            </div><!--/.sidebar-nav -->
          </div><!--/span-->
          <div class="col-xs-12 col-sm-3">
            <p>
                <button id="addquiz" title="Adauga Un Exercitiu" type="button" class="btn btn-primary pull-right">Creeaza Un Exercitiu <span class="glyphicon glyphicon-plus-sign"></span></button>
            </p>
          </div>
          
        </div>
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
<?php include 'quiz/footer.php';
