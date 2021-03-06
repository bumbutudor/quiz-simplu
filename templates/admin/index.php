<?php
include'header.php';
?>

<div id="container" class="quiz">
           
      <div class="row" id="intro2">
          <?php if (isset($admin)) {?> 
            <div class="col-sm-10 col-sm-offset-2"  >
              <form id="modulese" method="post" action="<?php echo $root . '/admin'; ?>" data-step="1" data-intro="Dumneavoastră aveți rolul de Supervizor, ceea ce înseamnă că puteți accesa instantaneu orice modul cu un singur click. Dacă vă aflați, de exemplu, în modulul „Ortografie”, puteți să vizualizați și să administrați submodulele, exercițiile și exemplele din acest modul." data-position='bottom'>
                <input type="hidden" name="_METHOD" value="POST"/>
                  <?php foreach ($categories as $categorie) : ?>
                         <input name="userModule" type="submit" value="<?php echo $categorie->id.". ".$categorie->name?>" class="btn btn-color btn-lg"
                         style="<?php if($_SESSION["userModule"] == $categorie->id){ echo "background-color:#002b7f !important; color: white !important;"; }?>"/>
                    <?php endforeach; ?>
              </form>
            </div>
          <?php } else {?>
               <div class="col-sm-4 col-sm-offset-4" data-step="1" data-intro="Dumneavoastră aveți rolul de Manager, ceea ce înseamnă că puteți administra submodulele, exercițiile și exemplele doar din modulul la care aveți acces." data-position='right'><h3><strong><?php echo $category->name; ?></strong> </h3></div>
             <?php }?>
             
      </div>
      
      <div class="row" >
        <div class="col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div style="padding-left: 15px !important;" class="sidebar-nav">
            <div class="row">
             <div class="col-sm-12" style="padding-top: 10px">
               <h4><strong>Submodule</strong></h4>                   
             </div>              
            </div>
            <div class="row" >
              <div class="col-sm-12" >
                <div class="list-group">
                  <?php foreach ($subcategories as $subcat): ?>
                    <ul><li data-step="6" data-intro="Când veți da click pe denumirea unui submodul veți merge la pagina de editare a submodulului. În această pagină puteți modifica denumirea și descrierea submodulului, în caz că este nevoie" class="admin"><a href="<?php echo $root; ?>/admin/subcat/<?php echo $subcat->id ;?>"><?php echo $subcat->name; ?></a></li></ul>
                  <?php endforeach; ?>
                </div>
              </div>
            </div>
            <div class="row" >
              <div class="col-sm-12">
                 <p>
                  <button id="addsubcategory" title="Adaugă un submodul nou" type="button" class="btn btn-primary" data-step="2" data-intro="Când veți da click pe acest buton se va deschide o fereastră unde veți introduce denumirea submodulului și descrierea (care este opțională). De asemenea, este o căsuță de selectare a modulului care poate fi sărită  cu vederea, pentru că modulul va fi același mereu." data-position='right'>Adaugă Un Submodul  <span class="glyphicon glyphicon-plus-sign"></span></button>
                 </p>
               </div>
            </div>
          </div><!--/.sidebar-nav -->
        </div><!--/span-->
        <div id="intro" class="col-md-9" style="padding-top: 10px" >
              <?php if (isset($flash['success'])) { echo '<div id="updater" class="alert alert-success">'.$flash["success"].'</div>'; } ?>
              <?php if (isset($flash['error'])) { echo '<div id="updater" class="alert alert-danger">'.$flash["error"].'</div>'; } ?>
              <div id="ajaxupdater" class="alert"></div>
          
          
          <h4><strong>Exerciții</strong></h4>
          <?php if (count($quizzes) > 0): ?>
            <table id="quizzes" class="table table-striped" data-step="3" data-intro="În acest tabel vor fi afișate toate exercițiile și atributele lor. Putem observa că în atributul „acțiuni” se află două butoane, unul este pentru editarea exercițiului, iar celălalt pentru ștergerea acestuia.">
                <thead>

                   <tr><th>Denumire</th><th>Sarcină</th><th>Modul</th><th>Submodul</th><th>Tip</th><th>Activ</th><th>Acțiuni</th></tr>
                </thead>
                <tbody>
                    <?php
                        foreach ($quizzes as $quiz) :
                            $activeSpan = $quiz->active == 1 ? 'glyphicon-ok-circle' : 'glyphicon-remove-circle';
                            echo '<tr class="quiz"><td><strong><a data-step="5" data-intro="Când veți da click pe denumirea exercițiului, veți merge la pagina de editare a exercițiului. Mai jos, tot în această pagină, veți putea adăugă exemple pentru acest exercițiu! În dependență de tipul exercițiului, structura exemplelor va fi diferită." href="'. $root .'/admin/quiz/'. $quiz->id .'">' . $quiz->name. '</a></strong></td><td>'.$quiz->description.'</td><td>'.$quiz->category.'</td><td>'.$quiz->id_subcategory.'</td><td>'.$quiz->quiz_type.'</td><td><span class="glyphicon '.$activeSpan.'"></span></td><td><a href="'. $root .'/admin/quiz/'. $quiz->id .'" data-quiz-id="'.$quiz->id.'" title="Modifică exercițiu" class="edit btn btn-default btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> <button data-quiz-id="'.$quiz->id.'" title="Șterge Exercițiu" class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button></td></tr>';
                        endforeach;
                    ?>
                </tbody>
            </table>
          <?php else: ?>
          <span>
          <p>Nu este nici un <strong>exercițiu</strong> la moment. Doriți să adăugați unul?</p>
          <p>Dați click pe butonul <em>"Adaugă Un Exercițiu"</em>, dar nu uitați că în primul rând trebuie să fie creat cel puțin un <strong>submodul.</strong> </p>
          <p>Pentru a adăuga un submodul click pe butonul <em>"Adaugă Un Submodul"</em>. </p></span>
          <?php endif; ?>
            
            <p>
                <button id="addquiz" title="Adaugă un exercițiu nou" type="button" class="btn btn-primary pull-right" data-step="4" data-intro="Când veți da click pe acest buton, se va deschide o fereastră unde veți introduce denumirea exercițiului, denumirea sarcinii pentru acest exercițiu, modulul și submodulul în care se află (modulul va fi întotdeauna același, poate fi sărit), tipul exercițiului și dacă acesta este activ sau nu (dacă nu este activ, utilizatorul nu îl vede).           ATENȚIE! Nu puteți adăuga un exercițiu, dacă nu este cel puțin un submodul!">Adaugă Un Exercițiu <span class="glyphicon glyphicon-plus-sign"></span></button>
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
            <h4 class="modal-title">Adaugă Un Exercițiu:</h4>
          </div>
            <form id="quizadd" method="post" action="<?php echo $root . '/admin/quiz/'; ?>">
            <div class="modal-body">
                <p><label for="quizname">Nume Exercițiu:</label>
                   <input name="quizname" id="quizname" type="text" placeholder="Nume Exercitiu" class="form-control" />
                   <span class="helper help-block">Va rog să dați o denumire exercițiului</span>
                </p>
                <p><label for="description">Sarcină:</label>
                   <input name="description" id="description" type="text" placeholder="Sarcina" class="form-control" />
                </p>
                <p><label for="category">Modul Exercițiu:</label>
                   <select name="category" id="category" class="form-control">
                      <!--08/10/20 Iau numai categoria care trebuie BEDONE-->
                       <?php if (isset($admin)) { ?>
                       <?php foreach ($categories as $category) : 
                            if( isset($_SESSION["userModule"]) && $_SESSION["userModule"] == $category->id) {?>
                              <option value="<?php echo $category->id; ?>"><?php echo $category->name; ?></option>
                            <?php } ?>
                       <?php endforeach; ?>
                       <?php } else { ?>
                       <option value="<?php echo $category->id; ?>"><?php echo $category->name; ?></option>
                       <?php } ?>
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
              <button type="submit" class="btn btn-success">Creați Exercițiu</button>
            </div>
          </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->



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
                   <input name="subcatname" id="subcatname" type="text" placeholder="Denumire Submodul" class="form-control" />
                   <span class="helper help-block">Va rugăm să dați o denumire submodulului</span>
                </p>
                <p><label for="subcatdescription">Descriere Submodul:<sup>*</sup></label>
                   <input name="subcatdescription" id="subcatdescription" type="text" placeholder="Descriere Submodul (opțional)" class="form-control" />
                </p>
                <!--08/10/20 Iau numai categoria care trebuie BEDONE-->
                <p><label for="id_category">Modul</label>
                   <select name="id_category" id="id_category" class="form-control">
                       <?php if (isset($admin)) { ?>
                       <?php foreach ($categories as $category) : 
                            if( isset($_SESSION["userModule"]) && $_SESSION["userModule"] == $category->id) {?>
                              <option value="<?php echo $category->id; ?>"><?php echo $category->name; ?></option>
                            <?php } ?>
                       <?php endforeach; ?>
                       <?php } else { ?>
                       <option value="<?php echo $category->id; ?>"><?php echo $category->name; ?></option>
                       <?php } ?>
                   </select>
                </p>

                
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Anulare</button>
              <button type="submit" class="btn btn-success">Creați Submodul</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
<?php 
include 'footer.php'; 
?>