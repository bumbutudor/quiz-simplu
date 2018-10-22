<!-- Adaugat la 10/10/2018 15:40 -->
<?php
include'header.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$database = 'logodava-quiz';
$user = 'supervizor';
$pass = 'Logodava2018';
$host = 'localhost';
$dir = dirname(__FILE__) . '/Backups/db_copie_' .$database.'_'. date("d.m.Y") . '.sql';

exec("mysqldump --user={$user} --password={$pass} --host={$host} {$database} --result-file={$dir} 2>&1", $output);
    if (is_null($output)){
        echo 'Nu se află nimic în baza de date!';
    } else {
        var_dump($output);
        echo '<p style="text-align:center;">Copia de rezervă a fost creată cu success în <strong><code>'.$dir.'</code></p></strong>';
    }
?>
<div style="text-align: center;"><a class="btn btn-primary" href="<?php echo $root; ?>/admin/"><span class="glyphicon glyphicon-arrow-left"></span> Înapoi</a></div>
<?php 
include 'footer.php'; 
?>