 <?php
$servername = "db";
$username = "user";
$password = "password";
$dbname = "gestion_trains";

$NOM = $_POST['nom'];
$PRENOM = $_POST['prenom'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}



$sql = "INSERT INTO stagiaire (nom,prenom) VALUES ('$NOM','$PRENOM')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}



$conn->close();

//petit commentaire sans conséquence
?>


