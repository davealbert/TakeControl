<?php
define('APP_NAME', 'take_control');
require 'db.php';
require 'passhash_class.php';

$user = mysql_real_escape_string($_REQUEST['newusername']);
$pass = mysql_real_escape_string($_REQUEST['newpassword']);

$SQL = "SELECT id FROM `users` WHERE `email` = '$user'";

$result = mysql_query($SQL) or die('Database error 1');

if (mysql_num_rows($result) > 0){
  // User exsists
  die('Email already used.');
} else {
  // New user
  $hash = PassHash::hash($pass);
  $SQL = "INSERT INTO users (`email`,`password_hash`) values ('$user', '$hash');";
  mysql_query($SQL) or die('Database error 2');
  die('OK');
}

