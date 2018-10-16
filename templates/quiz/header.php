<?php
$title = isset($quiz) ? 'Logodava Quiz :: ' . $quiz->getName() : 'Logodava Quiz';
header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    

    <!-- bootstrap 4 adaugat 1/10/2018 -->

    <link rel="shortcut icon" href="<?php echo $root; ?>/favicon.ico">
    <link rel="stylesheet" href="<?php echo $root; ?>/res/bootstrap/dist/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<?php echo $root; ?>/res/css/quiz.css" />
    <title><?php echo $title; ?></title>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/html5shiv.js"></script>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/respond.min.js"></script>
    <![endif]-->    
</head>
<body>

    <!-- Static navbar 16/10/2018 -->
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
            <a href="<?php echo $root; ?>/" class="navbar-brand"><img height="50" src="<?php echo $root; ?>/images/logodava-white.svg"/> Logodava Quiz</a>
        </div>
        <!-- Collection of nav links, forms, and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right navClass">
                <?php if ($user): ?>
                  <li><a href="<?php echo $root; ?>/logout/">Ieșire</a></li>
                  <?php if($user->isAdmin()) :?>
                      <li><a href="<?php echo $root; ?>/admin/">Administrare</a></li>
                  <?php endif; ?>
                <?php else : ?>
                    <!-- <li><a href="<?php echo $root; ?>/login/">Logare</a></li> -->
                <?php endif; ?>
            </ul>
            <ul class="nav navbar-nav navbar-right navClass">
                <?php if ($user) : ?>
                <li class="active"><a href="#" class="signed pull-right"><span class="glyphicon glyphicon-user"></span> Logat ca
                <em><?php echo $user->getName(); ?></em></a></li>
            <?php endif; ?>               
            </ul>
        </div>
    </nav>
  </div>
