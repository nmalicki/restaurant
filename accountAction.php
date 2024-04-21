<?php
include "header.php";
require "shared/dbConnect.php";

$givenName = $_POST["accountGivenName"];
$familyName = $_POST["accountFamilyName"];
$email = $_POST["accountEmail"];
$currentpassword = $_POST["accountCurrentPassword"];
$newpassword = password_hash($_POST["accountNewPassword"], PASSWORD_DEFAULT);

$sessionEmail = $_SESSION['email'];
$sql = "SELECT * FROM `customer` WHERE `email` =  '$sessionEmail' ;";

$result = queryDB($sql);

if ($result->num_rows == 1) {
    if ($row = $result->fetch_assoc()) {
        $result = array($row["customerId"], $row["email"], $row["password"], $row["givenName"], $row["familyName"], $row["paymentInfo"]);
        if (password_verify($currentpassword, $row["password"])) {
            //seperate each update into individual to prevent errors
            $sql = "UPDATE `customer` SET `email`='$email',`password`='$newpassword',`givenName`='$givenName',`familyName`='$familyName' WHERE `email`= '$sessionEmail'";

            try {
                $result = modifyDB($sql);
                
                $_SESSION['email'] = $email;
                $_SESSION['givenName'] = $givenName;
                $_SESSION['familyName'] = $familyName;
                $exportEmail = json_encode($_SESSION["email"]);
                $exportName = json_encode($_SESSION["givenName"]);
                $exportFamilyName = json_encode($_SESSION["familyName"]);
                
                echo "<script type='text/javascript'> email= $exportEmail; givenName = $exportName;  familyName = $exportFamilyName; paymentInfo = $exportPayment; signedIn( '". $row["givenName"] ."'); </script>"; 

                
                echo "<h1 class= 'logInFeedback'>Account Information Updated Successfully</h1>";
                echo "<a class='logLink backLink' href='index.php'>< Home</a>";
            } catch (Exception $e) {
                $error = $e->getMessage();
                echo "Other error: $error \n";

            }
        }
        else {
            echo "<h1 class='logInFeedback'>Invalid password.</h1>";
            echo "<a class='logLink backLink' href='index.php'>< Back</a>";
            echo "<h1 class='logInFeedback'>$currentpassword</h1>";
        }
    
    }

}
