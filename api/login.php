<?php
define('APP_NAME', 'take_control');
require 'db.php';
require 'passhash_class.php';


$user = mysql_real_escape_string($_REQUEST['user']);
$pass = mysql_real_escape_string($_REQUEST['pass']);


$SQL = "SELECT password_hash FROM `users` WHERE `email` = '$user'";

$result = mysql_query($SQL) or die('Database error 1');

if (mysql_num_rows($result) > 0){
  $row = mysql_fetch_assoc($result);
  // User exsists
  if (PassHash::check_password($row['password_hash'], $pass)) {
    // Login OK
    die('LOGIN OK');
  }
}



die('Invalid username or password.');