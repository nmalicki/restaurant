<?php

$userName = $_GET['userName'];
$password = $_GET['password'];


require "../shared/dbConnect.php";

openDB();

$sql = "SELECT userName, password FROM employee WHERE givenName = ?";

/*
try {
    $result = loginDB($sql, $givenName, $password);
} catch (Exception $ex) {
  echo $ex->getMessage;

}
 
 */

try {
  $stmt = $conn->prepare($sql);
  $stmt->bind_param('s', $userName);
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
    $_SESSION['employee'] = $row['userName'];
    header("Location: ../cashierWelcome.php");
  } else {
    echo "<h2>Login Failed</h2>";
  }
} else {
  echo "<h2>Login Failure</h2>";
  //header("Location: ../index.php");
}

?>