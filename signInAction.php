<?php

include "header.php";
require "shared/dbConnect.php";

$email = $_POST["email"];
$password = $_POST["password"];

$sql = "SELECT * FROM `customer` WHERE `email` = '$email';";

$result = queryDB($sql);

if ($result->num_rows == 1) {
    if ($row = $result->fetch_assoc()) {
        $result = array($row["customerId"], $row["email"], $row["password"], $row["givenName"], $row["familyName"], $row["paymentInfo"]);
        if (password_verify($password, $row["password"])) {
            //ui for user after successfull login
            echo "<h1 class='logInFeedback'>Log In Successful</h1>";
            echo "<a class='logLink backLink' href='index.php'>< Home</a>";

            /*
              //setting session values
              $_SESSION['usertype'] = $row["userType"];
              $_SESSION['favoriteTeam'] = $row["favoriteTeam"];
              $_SESSION['userInfo'] = $result;

              //converting session values to json
              $exportType = json_encode($_SESSION["usertype"]);
              $exportUserInfo = json_encode($_SESSION["userInfo"]);
              $exportTeam = json_encode($_SESSION["favoriteTeam"]);

              //make json visible to js
              echo "<script>usertype = $exportType;  sessionStorage.setItem('userInfo', $exportUserInfo); loggedIn();</script>";
             * 
             */
        } else {
            echo "<h1 class='logInFeedback'>Invalid username or password.</h1>";
            echo "<a class='logLink backLink' href='index.php'>< Back</a>";
        }
    }
} else {
    echo "<h1 class='logInFeedback'>Username or password is wrong </h1>";
    echo "<a class='logLink backLink' href='index.php'>< Back</a>";
}
