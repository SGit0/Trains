<?php

$server="localhost";
$user="admin";
$pass="password";
$db="gestion_trajets";



$link = mysqli_connect($server , $user, $pass);
if (!$link) {
   die('Impossible de se connecter : ' . mysqli_error($link));
}

// Rendre la base de données foo, la base courante
$db_selected = mysqli_select_db($db, $link);
if (!$db_selected) {
   die ('Impossible de sélectionner la base de données : ' . mysqli_error($link));
}