<!-- Adaugat la 11/10/2018 10:40 -->
<?php
include'header.php';
?>

<div class="container">
	<div class="row">
		<div class="col-sm-6">
			<h4>Date de acces:</h4>
			        <div class="panel-group" id="accordion3" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne3">
                                <p class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseOne3" aria-expanded="true" aria-controls="collapseOne3">
                                        Supervizor
                                    </a>
                                </p>
                            </div>
                            <div id="collapseOne3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne3">
                                <div class="panel-body">
                                    <p><strong>Email:</strong><span style="color: red;"> date confidențiale!</span></p>
                                    <p><strong>Parola:</strong><span style="color: red;"> date confidențiale!</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo3">
                                <p class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseTwo3" aria-expanded="false" aria-controls="collapseTwo3">
                                        Manager Ortografie
                                    </a>
                                </p>
                            </div>
                            <div id="collapseTwo3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo3">
                                <div class="panel-body">
                                    <p><strong>Email:</strong> ortografie@logodava.org</p>
                                    <p><strong>Parola:</strong> ortografie</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree3">
                                <p class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3">
                                        Manager Ortoepie
                                    </a>
                                </p>
                            </div>
                            <div id="collapseThree3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree3">
                                <div class="panel-body">
                                    <p><strong>Email:</strong> ortoepie@logodava.org</p>
                                    <p><strong>Parola:</strong> ortoepie</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFour3">
                                <p class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseFour3" aria-expanded="false" aria-controls="collapseThree3">
                                        Manager Morfologie
                                    </a>
                                </p>
                            </div>
                            <div id="collapseFour3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree3">
                                <div class="panel-body">
                                    <p><strong>Email:</strong> morfologie@logodava.org</p>
                                    <p><strong>Parola:</strong> morfologie</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFive3">
                                <p class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseFive3" aria-expanded="false" aria-controls="collapseThree3">
                                        Manager Sintaxă
                                    </a>
                                </p>
                            </div>
                            <div id="collapseFive3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree3">
                                <div class="panel-body">
                                    <p><strong>Email:</strong> sintaxa@logodava.org</p>
                                    <p><strong>Parola:</strong> sintaxa</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingSix3">
                                <p class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseSix3" aria-expanded="false" aria-controls="collapseThree3">
                                        Manager Lexic și Semantică
                                    </a>
                                </p>
                            </div>
                            <div id="collapseSix3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree3">
                                <div class="panel-body">
                                    <p><strong>Email:</strong> lexicsem@logodava.org</p>
                                    <p><strong>Parola:</strong> lexicsem</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingSeven3">
                                <p class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseSeven3" aria-expanded="false" aria-controls="collapseThree3">
                                        Manager Punctuație
                                    </a>
                                </p>
                            </div>
                            <div id="collapseSeven3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree3">
                                <div class="panel-body">
                                    <p><strong>Email:</strong> punctuatie@logodava.org</p>
                                    <p><strong>Parola:</strong> punctuatie</p>
                                </div>
                            </div>
                        </div>
                    </div>


			
		</div>
		
	</div>
	<div class="row" style="padding-top: 20px;">
		<div class="col-sm-6">
			<h5>Doriți să faceți o copie de rezervă a bazei de date.  Click pe <span style="font-size: 15px; color: gray;" class="glyphicon glyphicon-arrow-right"></span>
			<a class="btn btn-success" href="<?php echo $root; ?>/admin/backup">Copie de rezervă</a></h5>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div><a class="btn btn-primary" href="<?php echo $root; ?>/admin/"><span class="glyphicon glyphicon-arrow-left"></span> Înapoi</a></div>
		</div>
	</div>
</div>

<?php 
include 'footer.php'; 
?>