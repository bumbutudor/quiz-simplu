<?php 
    include'quiz/header.php'; 
?>
    <div id="container" class="quiz">
        <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="sidebar-nav">
              <h2>GRAMATICĂ ȘI VOCABULAR</h2>

                        
                    <?php foreach ($categories as $cat): ?>
                       <ul><li class="client"><a href="<?php echo $root; ?>/categories/<?php echo $cat->id ;?>"><?php echo $cat->name; ?></a></li></ul>
                    <?php endforeach; ?>
                    <!-- Click sa apara de desupt submodulele -->
                    <hr/>
                  <?php foreach ($subcategories as $subcat): ?>
                       <ul><li class="client"><a href="<?php echo $root; ?>/subcategories/<?php echo $subcat->id ;?>"><?php echo $subcat->name; ?></a></li></ul>
                    <?php endforeach; ?>

          </div><!--/.sidebar-nav -->
        </div><!--/span-->

        <div class="col-sm-8">
          <div class="main-col">
            <div class="wrapper">
              <div class="page-exercise">
                <h1><?php echo $category->description; ?></h1>
              </div>
              <div>
                  <?php foreach ($subcategories as $subcat): ?>
                         <ul><li  class="subnav-onpage"><h2><img height="16" src="<?php echo $root; ?>/images/arrow-accordion.svg"/><a href="<?php echo $root; ?>/subcategories/<?php echo $subcat->id ;?>">&ensp;<?php echo $subcat->name; ?></a></h2></li></ul>
                      <?php endforeach; ?>
              </div>
              
            </div>
          </div>
        </div><!--/span-->

        
      </div><!--/row-->
    </div><!--container-->

<?php include 'quiz/footer.php';
