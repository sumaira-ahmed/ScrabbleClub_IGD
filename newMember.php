<!DOCTYPE html>
<html>
<body>
<h1>Create New Member</h1> 


<div id="scrabble">

<h2>Welcome to Scrabble Club!Please enter your details below.</h2>
<form action="" method="post">
<label>Name :</label>
<input type="text" name="name" required placeholder="Please Enter Name"/><br><br>

<label>Email :</label>
<input type="email" name="email" required placeholder="123@gmail.com"/><br><br>

<label>Phone :</label>
<input type="phone" name="phone" required placeholder="Please enter phone"/><br><br>

<label>Address :</label>
<input type="address" name="address" required placeholder="Please enter your address"/><br><br>

<label>Date of Birth: </label>
<input type = "date" name="DOB" required placeholder="dd/mm/year"/><br><br>

 

<br><br>
<input type="submit" value=" Submit Details " name="submit"/><br />
</form>
</div>

<?php

if(isset($_POST["submit"])){

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "scrabble";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "INSERT INTO member (name, email, phone, DOB,address,dateJoined)
VALUES 
('".$_POST["name"]."','".$_POST["email"]."','".$_POST["phone"]."','".$_POST["DOB"]."','".$_POST["address"]."','"."')";

if(mysqli_query($conn, $sql)){
    echo "Data successfully Saved.";
 } else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
 }
}
$conn->close();

?>
