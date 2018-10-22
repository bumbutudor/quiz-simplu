<?php
    include'quiz/header.php'; 
?>
    <div id="container" class="quiz">
        <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="sidebar-nav">
              <h2>GRAMATICĂ ȘI VOCABULAR</h2>

                        
                    <?php foreach ($categories as $cat): ?>
                       <ul><li class="client"><a href="<?php echo $root; ?>/categories/<?php echo $cat->id ;?>"><?php echo $cat->name; ?></a></li></ul>
                    <?php endforeach; ?>

          </div><!--/.sidebar-nav -->
        </div><!--/span-->

        <div class="col-xs-12 col-sm-8">
          <div class="main-col">
            <div class="wrapper">
              <h1 style="color: #72A0C1;">Logodava Quiz Admin</h1>
              <p>Sistem de administrare a testelor privind utilizarea corectă a limbii române.</p>
            </div>
          </div>
        </div><!--/span-->

        <?php /*<div class="col-xs-4 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="sidebar-nav">
              <h4>Teste Recente</h4>
              <div class="list-group">
              <?php foreach ($quizzes as $quiz) : 
                    echo '<a href="'.$root . '/quiz/' . $quiz->id .'/test" class="list-group-item">';
                    echo '<h4 class="list-group-item-heading">'. $quiz->name . '</h4>';

                    echo '</a>';
                endforeach;
                ?>
              </div>
          </div>
        </div> */?> 
      </div><!--/row-->
        
    </div><!--container-->
<?php include 'quiz/footer.php';
