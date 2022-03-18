<!DOCTYPE html>
<html>
<body>
<h1>Welcome to Scrabble Club web page</h1> 

<p> Register New Member </p>
      <a href="newMember.php" target="_self">Link</a>

</html>
</body>
<?php

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

echo "<h2>View member profiles</h2>"; 


// displaying all member names

$memberProfile = "select name FROM member;";

$memberProfileResult = $conn->query($memberProfile);

if ($memberProfileResult-> num_rows > 0) {
    // output data of each row
    while($row = $memberProfileResult->fetch_assoc()) {

      //creating link to new page to display member profile
      echo "<h3>"."<a href = 'memberProfile.php?member={$row['name']}'>{$row['name']}</a>"."</h3>"; 

      
  
    }
  }

  