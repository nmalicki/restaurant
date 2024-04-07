<?php

$givenName = $_GET['givenName'];
$familyName = $_GET['familyName'];
$email = $_GET['email'];
$password = $_GET['password'];

require "../shared/dbConnect.php";

openDB();

$sql = "SELECT givenName, password FROM admin WHERE givenName = ?";

try {
  $stmt = $conn->prepare($sql);
  $stmt->bind_param('s', $givenName);
  $stmt->execute();
  $result = $stmt->get_result();
} catch (Exception $ex) {
  echo $ex->getMessage;
  $conn->close();
  exit;
}

if ($result->num_rows == 1) {
  $row = $result->fetch_assoc();
  if (password_verify($password, $row['password'])) {
    session_start();
    $_SESSION['admin'] = $row['givenName'];
    header("Location: ../adminWelcome.php");
  } else {
    echo "<h2>Login Failed</h2>";
  }
} else {
  echo "<h2>Login Failure</h2>";
  //header("Location: ../index.php");
}
    
?>