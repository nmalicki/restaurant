<?php
include "header.php";
require "shared/dbConnect.php";

$email = $_POST["email"];
$password = $_POST["password"];

$sql = "SELECT `customerId`, `email`, `password`, `givenName`, `familyName`, `paymentInfo` FROM `customer` WHERE `email` = ? and `password` = ?";

try {
    //not working
    $result = loginDB($sql, $email, $password);
    //echo $result[1], $result[2];
    echo "<h1 class= 'signInFeedback'>Sign In Successful</h1>";   
    
    
    //echo "<a class='logLink backLink' href='index.php'>< Home</a>";
} catch (Exception $e) {
    $error = $e->getMessage();
    echo "Other error: $error \n";
}
