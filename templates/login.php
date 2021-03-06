<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<?php echo $root; ?>/res/bootstrap/dist/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<?php echo $root; ?>/res/css/quiz.css" />
    <title>Logodava Quiz :: Logare</title>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/html5shiv.js"></script>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/respond.min.js"></script>
    <![endif]-->
    
</head>
<body>

    <div class="container">

        <p><?php if (isset($errors['loginerror']) ) { echo $errors['loginerror']; }?></p>
        <p><?php if (isset($errors['registererror']) ) { echo $errors['registererror']; }?></p>
        <div class="row-fluid">
            <div style="margin-top: 50px;" class="col-sm-6 col-sm-offset-3">
                <div>
                   <img style="margin: 0 auto; " class="img-responsive" width="200" src="<?php echo $root; ?>/images/logodava.svg"/> 
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-sm-6 col-sm-offset-3">
                <form id="login-form" class="form-signin" method="post" action="<?php echo $root; ?>/login">
                    <input type="email" name="email" class="form-control" placeholder="Email" autofocus>
                    <input type="password" name="password" class="form-control" placeholder="Parola">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Autentificare</button>
                </form>
            </div>
        </div>
    </div><!--container-->
    <script src="<?php echo $root; ?>/res/bootstrap/assets/js/jquery.js"></script>
    <script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });
    </script>
    <script src="<?php echo $root; ?>/res/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<?php echo $root; ?>/res/js/login.js"></script>
</body>
</html>
