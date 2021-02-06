<?php

$db_host = "cilsy.cqtgouliw6ug.ap-southeast-1.rds.amazonaws.com";
$db_user = "admin";
$db_pass = "12345678";
$db_name = "dbsosmed";

try {    
    //create PDO connection 
    $db = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_pass);
} catch(PDOException $e) {
    //show error
    die("Terjadi masalah: " . $e->getMessage());
}
