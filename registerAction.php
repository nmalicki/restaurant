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
    
    //query db for customerID
    $sql = "SELECT `customerId`, `paymentInfo` FROM `customer` WHERE `email` = '$email';";
    $result = queryDB($sql);
    if ($result->num_rows == 1) {
        if ($row = $result->fetch_assoc()) {
            $result = [$row['customerId'], $row['paymentInfo']];
        }
    }
    //setting session values
    $_SESSION["customerId"] = $result[0];
    $_SESSION['email'] = $email;
    $_SESSION['givenName'] = $givenName;
    $_SESSION['familyName'] = $familyName;
    $_SESSION['paymentInfo'] = $result[1];
    
    $exportEmail = json_encode($_SESSION["email"]);
    $exportName = json_encode($_SESSION["givenName"]);
    $exportFamilyName = json_encode($_SESSION["familyName"]);
    $exportPayment = json_encode($_SESSION["paymentInfo"]);

    checkOrCreateOrder();

              
              
    echo "<script type='text/javascript'> email= $exportEmail; givenName = $exportName;  familyName = $exportFamilyName; paymentInfo = $exportPayment; signedIn( '". $_SESSION['givenName'] ."'); </script>"; 
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
