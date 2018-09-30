<?php
include'header.php';
?>
<div id="container" class="">
      <div class="row">
            <div id="intro" class="col-md-8 col-md-offset-2">
                 <?php if (isset($flash['success'])) { echo '<div id="updater" class="alert alert-success">'.$flash["success"].'</div>'; } ?>
                 <?php if (isset($flash['error'])) { echo '<div id="updater" class="alert alert-danger">'.$flash["error"].'</div>'; } ?>
                <div id="ajaxupdater" class="alert"></div>
                <div><a class="btn btn-primary" href="<?php echo $root; ?>/admin/"><span class="glyphicon glyphicon-arrow-left"></span> Înapoi la pagina principală de administrare</a></div>
                <br />
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><h3>Detalii Submodul:</h3></div>
                    <div class="panel-body">
                      <ul style="width:50%;" class="list-group">
                          <li class="list-group-item"><strong>Nume</strong>: <?php echo $subcat->getNameSubcat(); ?></li>
                          <li class="list-group-item"><strong>Descriere</strong>: <?php echo $subcat->getDescriptionSubcat(); ?></li>
                          <li class="list-group-item"><strong>Categorie</strong>: <?php echo $subcat->getCategorySubcat(); ?></li>
                          
                      </ul>
                        <button id="editsubcat" title="Edit Quiz Details" type="button" class="btn btn-primary">Editează Detalii Submodul <span class="glyphicon glyphicon-pencil"></span></button>
                        
                    </div>
                  
                   
                </div>
            </div>
            </div><!-- /.row -->
        
</div><!--container-->
<!-- Modals -->

    <!-- Update Quiz Modal -->
    <div class="modal fade" id="subcat-edit-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Editează Submodul:</h4>
          </div>
            <form id="subcatedit" method="post" action="<?php echo $root . '/admin/subcat/'; ?>">
            <div class="modal-body">
                <p><label for="subcatname">Nume Submodul:</label>
                   <input name="subcatname" id="subcatname" type="text" placeholder="Nume Submodul" class="form-control" value="<?php echo $subcat->getName(); ?>" />
                   <span class="helper help-block">Vă rugăm să dați un nume submodulului!</span>
                </p>
                <p><label for="subcatdescription">Descriere Submodul:</label>
                   <input name="subcatdescription" id="subcatdescription" type="text" placeholder="Descriere Submodul" value="<?php echo $subcat->getDescription(); ?>" class="form-control" />
                </p>

                <p><label for="id_category">Categorie Submodul:</label>
                   <select name="id_category" id="id_category" class="form-control" />
                     <?php foreach ($categories as $category) : ?>
                           <?php $selected = ($category->name == $subcat->getCategory()) ? 'selected' : ''; ?>
                           <option value="<?php echo $category->id; ?>" <?php echo $selected; ?>><?php echo $category->name; ?></option>
                       <?php endforeach; ?>
                   </select>
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
