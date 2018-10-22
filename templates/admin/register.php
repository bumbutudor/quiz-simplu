<?php
include'header.php';
?>
    <div class="container">

        <p><?php if (isset($errors['registererror']) ) { echo $errors['registererror']; }?></p>
        <div class="row-fluid">
            <div class="col-sm-3">
                <div><a class="btn btn-primary" href="<?php echo $root; ?>/admin/"><span class="glyphicon glyphicon-arrow-left"></span> Înapoi</a></div>
            </div>
            <div class="col-sm-6">
                <div>
                   <img style="margin: 0 auto; " class="img-responsive" width="200" src="<?php echo $root; ?>/images/logodava.svg"/> 
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-sm-6 col-sm-offset-3">
                <form id="register-form" class="form-signin" method="post">
                    <input type="text" name="username" class="form-control" placeholder="Nume de utilizator">
                    <input type="email" name="email" class="form-control" placeholder="Email">
                    <input type="password" name="regpassword" class="form-control" placeholder="Parola">
                    <input type="password" name="regpasswordconf" class="form-control" placeholder="Confirmă Parola">
                    <div class="form-group">
                      <select class="form-control" id="select1" name="moduleid">
                        <option selected="true" disabled="disabled">Selectează Modul</option>
                            <?php foreach ($categories as $cat): ?>
                              <option value="<?php echo $cat->id; ?>"> <?php echo $cat->name; ?></option>
                            <?php endforeach; ?>
                      </select>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Înregistrare Manager</button>

                </form>
            </div>
        </div>
    </div><!--container-->
<?php 
include 'footer.php'; 
?>