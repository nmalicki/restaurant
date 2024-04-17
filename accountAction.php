<?php
include "header.php";
require "shared/dbConnect.php";

$givenName = $_POST["accountGivenName"];
$familyName = $_POST["accountFamilyName"];
$email = $_POST["accountEmail"];
$password = password_hash($_POST["accountPassword"], PASSWORD_DEFAULT);

$sql = "UPDATE `customer` SET `email`='$email',`password`='$password',`givenName`='$givenName',`familyName`='$familyName' WHERE `email`= '$email'";

try {
    $result = modifyDB($sql);
    echo "<h1 class= 'logInFeedback'>Account Information Updated Successfully</h1>";
    echo "<a class='logLink backLink' href='index.php'>< Home</a>";
} catch (Exception $e) {
    $error = $e->getMessage();
    echo "Other error: $error \n";
    
}
