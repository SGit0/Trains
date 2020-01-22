<?php

$server="10.69.8.79";
$user="admin";
$pass="password";
$db="gestion_trajets";



$link = mysqli_connect($server , $user, $pass);
if (!$link) {
   die('Impossible de se connecter : ' . mysql_error());
}

// Rendre la base de données foo, la base courante
$db_selected = mysql_select_db($db, $link);
if (!$db_selected) {
   die ('Impossible de sélectionner la base de données : ' . mysql_error());
}