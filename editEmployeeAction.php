<?php
require "shared/dbConnect.php";

$employeeId = $_POST["employeeId"];
$givenName = $_POST["givenName"];
$familyName = $_POST["familyName"];
$userName = $_POST["userName"];
$password = password_hash($_POST["password"], PASSWORD_DEFAULT);
$position = $_POST["position"];

$sql = "UPDATE `employee` SET `employeeId`='$employeeId',`userName`='$userName',`password`='$password',`givenName`='$givenName',`familyName`='$familyName',`position`='$position' WHERE employeeId = '$employeeId'";

echo 'Success!';
header("Location: editEmployees.php");


try {
    $result = modifyDB($sql);
echo 'Success!';
header("Location: editEmployees.php");
    exit();
}
  
 catch (Exception $e) {
    $error = $e->getMessage();
    if (fnmatch("Duplicate entry '*' for key 'email'", $error) == 1) {
        echo "<h1 class= 'logInFeedback'>Username already in use</h1>";
        echo "<a class='logLink backLink' href='logIn.php'>< Back</a>";
    } else {
        echo "Other error: $error \n";
    }
}