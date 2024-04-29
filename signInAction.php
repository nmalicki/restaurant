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
            echo "<h1 class='logInFeedback'>Log In Successful, Hello " . $row['givenName'] . "</h1>";
            echo "<a class='logLink backLink' href='index.php'>Home</a>";

            
              //setting session values
            $_SESSION["customerId"] = $row["customerId"];
            $_SESSION['email'] = $row["email"];
            $_SESSION['givenName'] = $row["givenName"];
            $_SESSION['familyName'] = $row["familyName"];
            $_SESSION['paymentInfo'] = $row["paymentInfo"];
            $exportEmail = json_encode($_SESSION["email"]);
            $exportName = json_encode($_SESSION["givenName"]);
            $exportFamilyName = json_encode($_SESSION["familyName"]);
            $exportPayment = json_encode($_SESSION["paymentInfo"]);
            
            checkOrCreateOrder();

              
              
             echo "<script type='text/javascript'> email= $exportEmail; givenName = $exportName;  familyName = $exportFamilyName; paymentInfo = $exportPayment; signedIn( '". $_SESSION['givenName'] ."'); </script>"; 
        } else {
            echo "<h1 class='logInFeedback'>Invalid username or password.</h1>";
            echo "<a class='logLink backLink' href='index.php'>< Back</a>";
        }
    }
} else {
    echo "<h1 class='logInFeedback'>Username or password is wrong </h1>";
    echo "<a class='logLink backLink' href='index.php'>< Back</a>";
}
