<?php

session_start();
if (isset($_SESSION['admin']) == true) {
} else {
    echo "Please log in first to see this page.";
    header("Location: adminLoginPage.php");
    echo "Please log in first to see this page.";
}

?>

<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Homepage</title>
    <style>
        body {
            font-family: Times New Roman, sans-serif;
            background-color: lightblue;
            text-align: center;
            padding-top: 100px;
        }
        h1 {
            color: #333;
        }
        h2{
            color: red;
        }
               .submitButton {
  background-color: blue; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
    </style>
</head>
<body>

<h1><center>Welcome Admin</center></h1>

<form name='employeeRegistration' action='registerRedirect.php' class="w3-container w3-card-4">
      <p>      
        <button class="submitButton">Register Employees</button></p> 
</form>

<form name='logout' action='adminLogoutAction.php' class="w3-container w3-card-4">
      <p>      
        <button class="submitButton" >Logout</button></p>  

</form>
</body>