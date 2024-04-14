<?php
require "shared/dbConnect.php";

$employeeId = $_POST["employeeId"];

$sql = "DELETE * FROM `employee` WHERE employeeId = '$employeeId'";

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