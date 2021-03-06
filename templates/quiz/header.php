<?php
$title = isset($quiz) ? 'Logodava Quiz :: ' . $quiz->getName() : 'Logodava Quiz';
header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    

    <!-- bootstrap 4 adaugat 1/10/2018 -->

    <link rel="shortcut icon" href="<?php echo $root; ?>/favicon.ico">
    <link rel="stylesheet" href="<?php echo $root; ?>/res/bootstrap/dist/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<?php echo $root; ?>/res/css/fonts.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo $root; ?>/res/css/quiz.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo $root; ?>/res/css/tooltip-classic.css" />
    <title><?php echo $title; ?></title>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/html5shiv.js"></script>
      <script src="<?php echo $root; ?>/res/bootstrap/dist/assets/js/respond.min.js"></script>
    <![endif]--> 

</head>
<body class="client-quiz">

    <!-- Static navbar 16/10/2018 -->
   <div class="navClass">
    <nav class="navbar navbar-inverse navbar-static-top color image">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <button type="button" class="pull-left btn btn-default visible-xs" data-toggle="offcanvas" aria-expanded="false" aria-controls="navbar">
            <i class="fa fa-navicon"></i>
          </button>
            <a href="<?php echo $root; ?>/" class="navbar-brand"><img height="50" src="<?php echo $root; ?>/images/logodava-white.svg"/>&ensp;Logodava Quiz</a>
        </div>
        <!-- Collection of nav links, forms, and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right navClass">
                <?php if ($user): ?>
                  <li><a href="<?php echo $root; ?>/logout/">Ieșire</a></li>
                  <?php if($user->isAdmin()) :?>
                      <li><a href="<?php echo $root; ?>/admin/" title="Pagina de adăugare și editare a exercițiilor">Administrare Exerciții</a></li>
                  <?php endif; ?>
                <?php else : ?>
                    <li><a href="<?php echo $root; ?>/login/">Autentificare</a></li>
                <?php endif; ?>
            </ul>
            <ul class="nav navbar-nav navbar-right navClass">
                <?php if ($user) : ?>
                <li class="active"><a href="#" data-toggle="tooltip" title="Bine ați venit, <?php if($user->getName()=='Supervizor') {echo 'doamnă Supervizor';} else {echo $user->getName();} ?>" data-placement="bottom" class="signed pull-right"><span class="glyphicon glyphicon-user"></span> Logat ca
                <em><?php echo $user->getName(); ?></em></a></li>
            <?php endif; ?>               
            </ul>
        </div>
    </nav>
  </div>
