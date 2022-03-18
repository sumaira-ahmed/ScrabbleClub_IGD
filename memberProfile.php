<!DOCTYPE html>
<html>
<body>

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


//recieving owners name from the last page and then other details via database
if(isset ($_GET['member']))
{

  $member = mysqli_real_escape_string($conn, $_GET['member']);

  $memberID = "SELECT memberID FROM member WHERE name = '$member';";
  $highScoreSQL = "SELECT member.name AS name,member.email AS email,
   CAST(AVG(scores.score) AS DECIMAL(10,1)) AS avgScore, CAST(MAX(scores.score) AS DECIMAL(10,1)) AS highScore, 
   game.gameID AS gameID FROM scores
   INNER JOIN member ON scores.memberID = member.memberID 
   INNER JOIN game ON scores.gameID = scores.gameID WHERE name = 'laura clark';";
  

  $highScoreResult = mysqli_query($conn, $highScoreSQL) or die(mysqli_error($conn));

  $row = mysqli_fetch_array($highScoreResult);

  $gameID = $row['gameID'];

  $gameSQL = "SELECT (SELECT member.name FROM member WHERE game.winner = member.memberID) AS winner ,(SELECT member.name FROM member 
  WHERE game.loser = member.memberID) AS loser ,game.location AS loc FROM game 
  INNER JOIN scores ON game.gameID = scores.gameID WHERE game.gameID = $gameID ;";

  $gameResult = mysqli_query($conn, $gameSQL) or die(mysqli_error($conn));
  $detail = mysqli_fetch_array($gameResult);

  
}else{
  echo "error";
}

//displaying member details
echo "<h1>".$row['name']." profile: "."</h1>";
echo "<h3>"."Email : " ." <a href='mailto: " . $row['email'] . " '>"  . $row['email']."</a>"."</h3>"; 


//displaying game details for members highscore 

echo "<h2>".$row['name']." Highest Score details: "."</h2>";
echo "<h3>"."High Score: ".$row['highScore']."</h2>";
echo "<h2>"."Game Details:  "."</h2>";
echo "<h3>"."Location: ".$detail['loc']."</h3>";
echo "<h3>"."Winner: ".$detail['winner']."</h3>";
echo "<h3>"."Loser: ".$detail['loser']."</h3>";
echo "<h3>"."Average Score: ".$row['avgScore']."</h3>";

?>