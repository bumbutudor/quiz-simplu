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

                      <div class="panel-group" id="accordion3" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne3">
                                <p class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseOne3" aria-expanded="true" aria-controls="collapseOne3">
                                        Ghid de elaborare a unui exemplu de tip <strong><em>„din căsuță”</em></strong>
                                    </a>
                                </p>
                            </div>
                            <div id="collapseOne3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne3">
                                <div class="panel-body">
                                    <p> <strong> Pasul 1. </strong> <em> Scrierea propoziției. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/1.png"/>
                                    <p> <strong> Pasul 2. </strong> <em> Acceptă propoziția. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/2.png"/>
                                    <p> <strong> Pasul 3. </strong> <em> Editarea propoziției introduse. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/2_1.png"/>
                                    <p> <strong> Pasul 4. </strong> <em> Scrierea răspunsurilor și bifarea răspunsului corect. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/2_2.png"/>
                                    <p> <strong> Pasul 5. </strong> <em> Înserarea cuvântului(expresiei) și crearea căsuței. <span style="color: red"> Atenție! După ce ați înserat cuvântul, dați instantaneu click pe butonul „Creează căsuță”, nu apăsați pe nimic altceva după ce ați înserat. </span></em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/3.png"/>
                                    <p> <strong> Pasul 6. </strong> <em> Verificăm dacă a fost creată căsuța. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/4.png"/>
                                    <p> <strong> Pasul 6 (opțional). </strong> <em> Adăugare comentariu. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/5.png"/>
                                    <p> <strong> Pasul 7. </strong> <em> Salvarea exemplului. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/6.png"/>
                                    <p> <strong> Pasul 8. </strong> <em> Verificăm dacă exercițiului a fost adăugat. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/7.png"/>
                                    <p> <strong> Pasul 9. </strong> <em> Verificarea datelor exemplului. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul1/8.png"/>
                                    <p> <strong> Final. </strong> <em> În caz că ați parcurs corect acești pași și ați primit o eroare, vă rog să contactați <strong>Administratorul. </strong> </em> </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo3">
                                <p class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseTwo3" aria-expanded="false" aria-controls="collapseTwo3">
                                        Ghid de elaborare a unui exemplu de tip <strong><em>„în căsuță”</em></strong>
                                    </a>
                                </p>
                            </div>
                            <div id="collapseTwo3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo3">
                                <div class="panel-body">
                                    <p> <strong> Pasul 1. </strong> <em> Scrierea textului (propoziție, expresie). </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul2/1.png"/>
                                    <p> <strong> Pasul 2. </strong> <em> Acceptarea propoziției introduse. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul2/1_1.png"/>
                                    <p> <strong> Pasul 3. </strong> <em> Editarea propoziției introduse, dacă este nevoie. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul2/1_2.png"/>
                                    <p> <strong> Pasul 4. </strong> <em> Înserarea cuvântului(expresiei) și crearea căsuței. <span style="color: red"> Atenție! După ce ați înserat cuvântul, dați instantaneu click pe butonul „Creează căsuță”, nu apăsați pe nimic altceva după ce ați înserat. </span></em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul2/2.png"/>
                                    <p> <strong> Pasul 5. </strong> <em> Salvarea exemplului. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul2/3.png"/>
                                    <p> <strong> Pasul 6. </strong> <em> Verificarăm dacă exemplul a fost adăugat. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul2/4.png"/>
                                    <p> <strong> Pasul 7. </strong> <em> Verificarea datelor exemplului. </em> </p>
                                    <img height="auto" width="90%" src="<?php echo $root; ?>/images/exemplul2/5.png"/>
                                    <p> <strong> Final. </strong> <em> În caz că ați parcurs corect acești pași și ați primit o eroare, vă rog să contactați <strong>Administratorul. </strong> </em> </p>

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree3">
                                <p class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3">
                                        Ghid de elaborare a unui exemplu de tip <strong><em>„text”</em></strong>
                                    </a>
                                </p>
                            </div>
                            <div id="collapseThree3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree3">
                                <div class="panel-body">
                                    <p>În contrucție. Vă rog să reveniți mai târziu</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFour3">
                                <p class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseFour3" aria-expanded="false" aria-controls="collapseThree3">
                                        Ghid de elaborare a unui exemplu de tip <strong><em>„imagine”</em></strong>
                                    </a>
                                </p>
                            </div>
                            <div id="collapseFour3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree3">
                                <div class="panel-body">
                                    <p>În contrucție. Vă rog să reveniți mai târziu</p>
                                </div>
                            </div>
                        </div>
                    </div>
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
