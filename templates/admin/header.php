<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="shortcut icon" href="<?php echo $root; ?>/favicon.ico">
    <link rel="stylesheet" href="<?php echo $root; ?>/res/bootstrap/dist/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<?php echo $root; ?>/res/css/quiz.css" />
    <title>Logodava :: Admin</title>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/html5shiv.js"></script>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/respond.min.js"></script>
    <![endif]-->
    
</head>
<body>
    <!-- Static navbar -->
    <div  style="background-color: #002b7f;" class="navbar navbar-default navbar-static-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a style="color: #C8C8C8; font-size: 24px;" class="navbar-brand" href="<?php echo $root; ?>/"><img width="50" src="<?php echo $root; ?>/images/logodava-white.svg"/> Logodava Quiz</a>
        </div>
        <div class="navbar-collapse collapse">
      
         
          <ul class="nav navbar-nav navbar-right">
            <li style="padding-top: 15px;" class="dropdown active">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administrare <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="<?php echo $root; ?>/admin/">Toate exercițiile</a></li>
                    <li><a href="<?php echo $root; ?>/admin/config/">Setări</a></li>
                    <!-- TODO pentru schimbarea parolelor -->
                    <li><a href="<?php echo $root; ?>/admin/edit/">Schimbă Parola</a></li>
                    <li><a href="<?php echo $root; ?>/logout/">Ieșire</a></li>
                    <!-- <li><a href="<?php echo $root; ?>/admin/backup">Copie de rezervă a bazei de date</a></li> -->
                </ul>
            </li>
          </ul>
            <p style="color: #C8C8C8; padding-top: 15px;" class="signed navbar-text pull-right "><span class="glyphicon glyphicon-user"></span> Logat ca
                <strong><?php echo $user->getName(); ?></strong></p>
        </div><!--/.nav-collapse -->
      </div>
    </div>
