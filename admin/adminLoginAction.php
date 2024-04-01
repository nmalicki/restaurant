<?php
require "../shared/dbConnect.php";
$givenName = $_GET['givenName'];
$familyName = $_GET['familyName'];
$email = $_GET['email'];
$password = $_GET['password'];


$sql = "select givenName, familyName, email, password from admin where email = ? and password = ?";


try {
    $result = loginDB($sql, $givenName, $password);
} catch (Exception $ex) {
  echo $ex->getMessage;

}
if ($result->num_rows == 1) {
  $row = $result->fetch_assoc();
  if (password_verify($password, $row['password'])) {
    session_start();
    $_SESSION['admin'] = $row['givenName'];
    header("Location: ../employeeRegistration.php");
  } else {
    echo "<h2>Login Failed</h2>";
  }
} else {
  echo "<h2>Login Failed</h2>";
  header("Location: ../index.php");
}

?>