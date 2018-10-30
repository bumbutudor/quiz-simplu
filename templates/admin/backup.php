<!-- Adaugat la 10/10/2018 15:40 -->
<?php
include'header.php';


use Ifsnop\Mysqldump as IMysqldump;


ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


$dir = dirname(__FILE__) . '/Backups/db_copie_' .'logodava-quiz'.'_'. date("d.m.Y") . '.sql';

try {
    $dump = new IMysqldump\Mysqldump('mysql:host=localhost;dbname=logodava-quiz', 'supervizor', 'Logodava2018');
    $dump->start($dir);
    echo '<div class="container" style="text-align:center;">
    		<p style="font-size: 18px">Baza de date a fost salvată cu succes în mapa Backups</p> <br/>
    	 </div>';
} catch (\Exception $e) {
    echo 'mysqldump-php error: ' . $e->getMessage();
}




?>
<div style="text-align: center;"><a class="btn btn-primary" href="<?php echo $root; ?>/admin/"><span class="glyphicon glyphicon-arrow-left"></span> Înapoi</a></div>
<?php 
include 'footer.php'; 
?>