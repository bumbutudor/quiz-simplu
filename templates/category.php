<?php 
    include'quiz/header.php'; 
?>
    <div id="container" class="quiz">
        <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="sidebar-nav">
              <h3>Module</h3>
              <div class="list-group">
                        
                    <?php foreach ($categories as $cat): ?>
                       <ul><li><a href="<?php echo $root; ?>/categories/<?php echo $cat->id ;?>"><?php echo $cat->name; ?></a></li></ul>
                    <?php endforeach; ?>
              </div> 
              <h4>Submodule</h4>
              <div class="list-group">
                <?php foreach ($subcategories as $subcat): ?>
                       <ul><li><a href="<?php echo $root; ?>/subcategories/<?php echo $subcat->id ;?>"><?php echo $subcat->name; ?></a></li></ul>
                    <?php endforeach; ?>
              </div>

          </div><!--/.sidebar-nav -->
        </div><!--/span-->
        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Comutare nav</button>
          </p>
          <div class="jumbotron">
            <h1><?php echo $category->name; ?></h1>
            <p><?php echo $category->description; ?>.</p>
          </div>
        </div><!--/span-->
        <div class="col-xs-12 col-sm-6">
            <div>
                <h4><?php echo $category->name; ?></h4>
                <div class="list-group">
                <?php foreach ($quizzes as $quiz) : 
                      echo '<a href="'.$root . '/quiz/' . $quiz->id .'" class="list-group-item">';
                      echo '<h4 class="list-group-item-heading">'. $quiz->name . '</h4>';
                      echo '<p class="list-group-item-text">'. $quiz->description . '</p>';
                      echo '</a>';
                  endforeach;
                  ?>
                </div>
            </div><!--/.sidebar-nav -->
          </div><!--/span-->

        
      </div><!--/row-->
    </div><!--container-->

<?php include 'quiz/footer.php';
