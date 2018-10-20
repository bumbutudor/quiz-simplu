<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="<?php echo $root; ?>/favicon.ico">
    <link rel="stylesheet" href="<?php echo $root; ?>/res/bootstrap/dist/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<?php echo $root; ?>/res/css/quiz.css" />
     <link rel="stylesheet" type="text/css" href="<?php echo $root; ?>/res/css/fonts.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo $root; ?>/res/css/tooltip-classic.css" />
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <title>Logodava :: Admin</title>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/html5shiv.js"></script>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/respond.min.js"></script>
    <![endif]-->
    
</head>
<body>
 <!-- Navigation Bar Static navbar -->
  <div class="navClass">
    <nav class="navbar navbar-inverse navbar-static-top color">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="<?php echo $root; ?>/" class="navbar-brand"><img height="50" src="<?php echo $root; ?>/images/logodava-white.svg"/>&ensp;Logodava Quiz</a>
        </div>
        <!-- Collection of nav links, forms, and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right navClass">
                <li>
                  <a href="#" class="signed pull-right "><span class="glyphicon glyphicon-user"></span> Logat ca
                <em><?php echo $user->getName(); ?></em></a>
                </li>
                <?php if (isset($admin)) {?>
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">Administrare <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="<?php echo $root; ?>/admin/">Toate exercițiile</a></li>
                        <li><a href="<?php echo $root; ?>/admin/config/">Setări</a></li>
                        <li><a href="<?php echo $root; ?>/admin/edit/">Schimbă Parola</a></li>
                        <li class="divider"></li>
                        <li><a href="<?php echo $root; ?>/logout/">Ieșire</a></li>
                    </ul>
                </li>
                <?php } else { ?>
                <li><a href="<?php echo $root; ?>/logout/">Ieșire</a></li>
                <?php } ?>            
            </ul>
        </div>
    </nav>
  </div>
