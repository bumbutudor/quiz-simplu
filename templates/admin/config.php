<!-- Adaugat la 11/10/2018 10:40 -->
<?php
include'header.php';
?>

<div class="container">
	<div class="row">
		<div class="col-sm-8">
			<h4>Creează o copie de rezervă a bazei de date. Click pe <span style="font-size: 15px; color: gray;" class="glyphicon glyphicon-arrow-right"></span>
			<a class="btn btn-primary" href="<?php echo $root; ?>/admin/backup">Backup</a></h4>
			
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