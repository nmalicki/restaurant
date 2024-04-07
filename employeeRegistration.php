<?php
session_start();
if (isset($_SESSION['admin']) == true) {
    echo "Welcome " . $_SESSION['admin'] . "!" ;
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
    <title>Employee Registration</title>
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
<h1><center>Employee Registration</center></h1>
<div id="toggleDiv">
 
</div>

<form style="text-align: center" id="registerForm" action="cashier/employeeRegisterAction.php" method="POST">
    <div id="registerNames">
        <div class="half left">
            <label>Given Name</label>
            <br>
            <input name="givenName"></input>
        </div>
        <div class="half right">
            <label>Family Name</label>
            <br>
            <input name="familyName"></input>
        </div>
    </div>    
    <label>User Name</label>
    <br>
    <input name="userName"></input>
    <br>
    <label>Password</label>
    <br>
    <input type="password" name="password"></input>
    <br>
    <label>Confirm password</label>
    <br>
    <input type="password"></input>

    <br>
    <br>

    <p style="text-align: center">Position</p>
<div class="w3-dropdown-content w3-bar-block w3-border">
<input id="chef" class="w3-radio" type="radio" name="position" value="chef" checked="">
<label>Chef</label>
<input id="cashier" class="w3-radio" type="radio" name="position" value="cashier">
<label>Cashier</label>
<br>
<br>
<input type="submit" class="submitButton"></input>
</div>
</form>
</form>
</body>






