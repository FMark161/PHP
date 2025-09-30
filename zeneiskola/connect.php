<?php


$servername = "localhost";
$username   = "root";      // adatbázis felhasználónév
$password   = "";          // adatbázis jelszó
$dbname     = "z_iskola"; // adatbázis neve

$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Sikertelen kapcsolat: " . $conn->connect_error);
}
?>