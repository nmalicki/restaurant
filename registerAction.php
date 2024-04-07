<?php
include "header.php";
require "shared/dbConnect.php";

$givenName = $_POST["givenName"];
$familyName = $_POST["familyName"];
$email = $_POST["email"];
$password = password_hash($_POST["password"], PASSWORD_DEFAULT);

$sql = "insert into customer VALUES (0, '$email', '$password', '$givenName', '$familyName', 0);";


try {
    $result = modifyDB($sql);
    echo "<h1 class= 'logInFeedback'>Registration Successful</h1>";
    //echo "<a class='logLink backLink' href='index.php'>< Home</a>";
} catch (Exception $e) {
    $error = $e->getMessage();
    if (fnmatch("Duplicate entry '*' for key 'email'", $error) == 1) {
        echo "<h1 class= 'logInFeedback'>Username already in use</h1>";
        echo "<a class='logLink backLink' href='index.php'>< Back</a>";
    } else {
        echo "Other error: $error \n";
    }
}
