<?php if ( ! defined('APP_NAME')) exit('No direct script access allowed');

$db_host = 'localhost';
$db_name = 'take_control';
$db_usr = '>> YOUR USERNAME <<';
$db_pass = '>> YOUR PASSWORD <<';
$db = mysql_connect($db_host, $db_usr, $db_pass)
or die('Could not connect: ' . mysql_error());

mysql_select_db($db_name, $db);