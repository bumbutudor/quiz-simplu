<?php
include'header.php';
?>

<div id="container" class="quiz">
      
      <div class="row" >
         <div class="col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="sidebar-nav">
           
<!--            <div class="row">
              <div class="col-sm-12">
                <ul>
                  <li class="dropdown active">
                    <a href="<?php echo $root; ?>/admin/" class="dropdown-toggle" data-toggle="dropdown">Module <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <?php foreach ($categories as $cat): ?>
                           <li><a href="<?php echo $root; ?>/admin/<?php echo $cat->id ;?>"><?php echo $cat->name; ?></a></li>
                        <?php endforeach; ?>
                    </ul>
                </li>
              </ul>
             </div>
           </div> -->
             <div class="row">

               <div class="col-sm-6">
                 <h4>Submodule</h4>                       
               </div>
               <div class="col-sm-4">
                 <p>
                  <button id="addsubcategory" title="Adauga Un Submodul" type="button" class="btn btn-primary">Adauga  <span class="glyphicon glyphicon-plus-sign"></span></button>
                 </p>
               </div>
            </div>
             <div class="row">
               <div class="col-sm-12">
                 <div class="list-group">
                <?php foreach ($subcategories as $subcat): ?>
                       <ul><li><a href="<?php echo $root; ?>/admin/subcat/<?php echo $subcat->id ;?>"><?php echo $subcat->name; ?></a></li></ul>
                <?php endforeach; ?>
              </div>
               </div>
             </div>
          
          </div><!--/.sidebar-nav -->
        </div><!--/span-->

          <div class="col-sm-9" id="intro">
          <!--  <h2>Bine ați venit, domnule <span><?php echo $user->getName(); ?></span> </h2> -->
           <h2>Vă aflați în modulul <strong><?php echo $category->name; ?></strong></h2>
            <!-- <p>Ai grijă, avînd putere mare trebuie responsabilități mari.</p><br> -->     
          </div>
 
          <div id="intro" class="col-md-9" style="padding-top: 10px">
              <?php if (isset($flash['success'])) { echo '<div id="updater" class="alert alert-success">'.$flash["success"].'</div>'; } ?>
              <?php if (isset($flash['error'])) { echo '<div id="updater" class="alert alert-danger">'.$flash["error"].'</div>'; } ?>
              <div id="ajaxupdater" class="alert"></div>
          
          
          <h4>Exerciții</h4>
          <?php if (count($quizzes) > 0): ?>
            <table id="quizzes" class="table table-striped">
                <thead>

                   <tr><th>Nume</th><th>Sarcina</th><th>Modul</th><th>Submodul</th><th>Tip</th><th>Activ</th><th>Acțiuni</th></tr>
                </thead>
                <tbody>
                    <?php
                        foreach ($quizzes as $quiz) :
                            $activeSpan = $quiz->active == 1 ? 'glyphicon-ok-circle' : 'glyphicon-remove-circle';
                            echo '<tr class="quiz"><td><strong><a href="'. $root .'/admin/quiz/'. $quiz->id .'">' . $quiz->name. '</a></strong></td><td>'.$quiz->description.'</td><td>'.$quiz->category.'</td><td>'.$quiz->id_subcategory.'</td><td>'.$quiz->quiz_type.'</td><td><span class="glyphicon '.$activeSpan.'"></span></td><td><a href="'. $root .'/admin/quiz/'. $quiz->id .'" data-quiz-id="'.$quiz->id.'" title="Modifica Exercitiu" class="edit btn btn-default btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> <button data-quiz-id="'.$quiz->id.'" title="Sterge Exercitiu" class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button></td></tr>';
                        endforeach;
                    ?>
                </tbody>
            </table>
          <?php else: ?>
          <p>Nu este nici un exercițiu la moment. Poate adaugați unul?</p>
          <p>Doar dati click pe butonul 'Creează Un Exercițiu'</p>
          <?php endif; ?>
            
            <p>
                <button id="addquiz" title="Adauga Un Exercitiu" type="button" class="btn btn-primary pull-right">Creează Un Exercițiu <span class="glyphicon glyphicon-plus-sign"></span></button>
            </p>

        </div>

      </div>


        
    </div><!--container-->



  <!-- Add Sucategory Modal -->
    <div class="modal fade" id="subcategory-add-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            
            <h4 class="modal-title">Adaugă Un Submodul:</h4>
          </div>
            <form id="subcatadd" method="post" action="<?php echo $root . '/admin/subcat/'; ?>">
            <div class="modal-body">
                <p><label for="subcatname">Nume Submodul</label>
                   <input name="subcatname" id="subcatname" type="text" placeholder="Nume Submodul" class="form-control" />
                   <span class="helper help-block">Va rugăm să dați o denumire submodulului</span>
                </p>
                <p><label for="subcatdescription">Descriere Submodul:</label>
                   <input name="subcatdescription" id="subcatdescription" type="text" placeholder="Descriere Submodul" class="form-control" />
                </p>
                <p><label for="id_category">Modul</label>
                   <select name="id_category" id="id_category" class="form-control">
                       <?php foreach ($categories as $category) : ?>
                            <option value="<?php echo $category->id; ?>"><?php echo $category->name; ?></option>
                       <?php endforeach; ?>
                   </select>
                </p>

                
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Anulare</button>
              <button type="submit" class="btn btn-success">Creeaza Submodul</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    
    <!-- Add Quiz Modal -->
    <div class="modal fade" id="quiz-add-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Adaugă Un Exercițiu:</h4>
          </div>
            <form id="quizadd" method="post" action="<?php echo $root . '/admin/quiz/'; ?>">
            <div class="modal-body">
                <p><label for="quizname">Nume Exercițiu:</label>
                   <input name="quizname" id="quizname" type="text" placeholder="Nume Exercitiu" class="form-control" />
                   <span class="helper help-block">Va rog să dați o denumire exercițiului</span>
                </p>
                <p><label for="description">Sarcina:</label>
                   <input name="description" id="description" type="text" placeholder="Sarcina" class="form-control" />
                </p>
                <p><label for="category">Modul Exercițiu:</label>
                   <select name="category" id="category" class="form-control">
                       <?php foreach ($categories as $category) : ?>
                            <option value="<?php echo $category->id; ?>"> <?php echo $category->name; ?></option>
                       <?php endforeach; ?>
                   </select>
                </p>


               <p><label for="id_subcategory">Submodul Exercițiu:</label>
                   <select name="id_subcategory" id="id_subcategory" class="form-control">
                       <?php foreach ($subcategories as $subcategory) : ?>
                            <option value="<?php echo $subcategory->id; ?>"><?php echo $subcategory->name; ?></option>
                       <?php endforeach; ?>
                   </select>
                </p>

                <p><label for="quiz_type">Tip Exercițiu:</label>

                  <select name="quiz_type" id="quiz_type" class="form-control">
                       <?php foreach ($quiz_types as $quiz_type) : ?>
                            <option value="<?php echo $quiz_type->id; ?>"><?php echo $quiz_type->name; ?></option>
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
              <button type="submit" class="btn btn-success">Creează Exercițiu</button>
            </div>
          </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
<?php 
include 'footer.php'; 
?>