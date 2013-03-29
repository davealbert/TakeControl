<?php
define('APP_NAME', 'take_control');
require 'db.php';
require 'passhash_class.php';


$user = mysql_real_escape_string($_REQUEST['user']);
$pass = mysql_real_escape_string($_REQUEST['pass']);


$SQL = "SELECT id,password_hash FROM `users` WHERE `email` = '$user'";

$result = mysql_query($SQL) or die('Database error 1');

if (mysql_num_rows($result) > 0){
  $row = mysql_fetch_assoc($result);
  // User exsists
  if (PassHash::check_password($row['password_hash'], $pass)) {
    // Login OK
    $expireDate = date('Y-m-d H:i:s', time()+3600); // one minute for now
    $sessionHash = PassHash::unique_salt();

    $SQL = "INSERT INTO sessions (user_id, session_hash ,expire_date) VALUES ('{$row['id']}', '$sessionHash', '$expireDate')
    ON DUPLICATE KEY UPDATE user_id='{$row['id']}', session_hash='$sessionHash',expire_date='$expireDate'";

    mysql_query($SQL) or die('Database error 2');
    die($sessionHash);
  }
}

die('Invalid username or password.');
