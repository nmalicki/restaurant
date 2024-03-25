<?php
include "header.php";
require "shared/dbConnect.php";

$email = $_POST["email"];
$password = $_POST["password"];
//echo $email . "<br>";

$sql = "SELECT `customerId`, `email`, `password`, `givenName`, `familyName`, `paymentInfo` FROM `customer` WHERE `email` LIKE '$email'";

try {
    $result = queryDb($sql);
    if(password_verify($password, PASSWORD_DEFAULT) == ""){
        echo "<h1 class= 'signInFeedback'>Sign In Successful</h1>";   
    }
    
    //echo "<a class='logLink backLink' href='index.php'>< Home</a>";
} catch (Exception $e) {
    $error = $e->getMessage();
    echo "Other error: $error \n";
}
