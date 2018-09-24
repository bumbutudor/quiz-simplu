<?php
    include'header.php';
    $numquestions = $quiz->countQuestions();
    // $leadersToShow = 10;
?>
    <div id="container" class="quiz">
      <div class="row">
          <div id="intro" class="col-md-6 col-md-offset-3">
              <?php if (isset($error)) { echo '<div id="updater" class="alert alert-danger">'.$error
                  .'</div>'; } ?>
          <h2><?php echo $quiz->getName(); ?></h2>
          <h4><?php echo $quiz->getDescription(); ?></h4>
          <p>După ce ați început testul, încercați să răspundeți la toate întrebările.</p>
          <!-- <p>Pentru fiecare întrebare  dati click pe <strong>'Trimite Raspuns'</strong>. Vei primi o intrebare noua.</p> -->
          <p>Acest test are <strong><?php echo $numquestions; ?></strong> întrebări.</p>
          <p>Rezultatul îl vei vedea la sfîrșitul testului.</p>
         <!-- leaders-score start-->

         <!-- leaders-score-->
              <div>
                  <form id="questionBox" method="post" action="<?php echo $root; ?>/quiz/process">
                      <p>
                          <input type="hidden" name="quizid" value="<?php echo $quiz->getId(); ?>" />
                          <input type="submit" id="submitstart" name="starter" class="btn btn-lg btn-success"
                          value="Începe Exercițiul" />
                      </p>
                  </form>
              </div>
          </div>
        
      </div><!-- /.row -->
        
    </div><!--container-->
<?php include 'footer.php';

/* <div id="leaders-score">
                <h4>Scoruri de Top <?php echo $leadersToShow; ?></h4>
                <div class="row">
                    <ul class="leaders col-md-6">
                        <?php
                        $leaders = $quiz->getLeaders($leadersToShow);
                        $counter = 1;
                        foreach ($leaders as $leader) :

                            echo '<li><strong>' . $leader["name"] . '</strong>: ' .  $leader["score"] . '/' . $numquestions . '</li>';

                            //Use modulus to create new sub-list if required.
                            if ($counter % (round($leadersToShow/2)) == 0) :  
                                echo '</ul>' . PHP_EOL . '<ul class="leaders col-md-6">' . PHP_EOL;
                            endif;

                            $counter++;

                        endforeach;
                        ?>
                    </ul>
                </div>
            </div>
*/