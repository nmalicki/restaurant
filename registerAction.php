<?php
require "dbConnect.php";

$givenName = $_POST["givenName"];
$familyName = $_POST["familyName"];
$userName = $_POST["userName"];
$password = password_hash($_POST["password"], PASSWORD_DEFAULT);
$position = $_POST["position"];

$sql = "insert into employee VALUES (0, '$userName', '$password', '$givenName', '$familyName', '$position');";


try {
    $result = modifyDB($sql);
    echo "<h1 class= 'logInFeedback'>Registration Successful</h1>";
    //echo "<a class='logLink backLink' href='index.php'>< Home</a>";
    
} catch (Exception $e) {
    $error = $e->getMessage();
    if (fnmatch("Duplicate entry '*' for key 'email'", $error) == 1) {
        echo "<h1 class= 'logInFeedback'>Username already in use</h1>";
        echo "<a class='logLink backLink' href='logIn.php'>< Back</a>";
    } else {
        echo "Other error: $error \n";
    }
}