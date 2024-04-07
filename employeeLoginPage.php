<?php
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Login</title>
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


<h1><center>Employee Login</center></h1>
<div id="toggleDiv">

</div>

<form style="text-align: center" id="registerForm" action="cashier/EmployeeLoginAction.php" method="GET">
    <div id="registerNames">

    </div>    
    <label>User Name</label>
    <br>
    <input name="userName"></input>
    <br>
    <label>Password</label>
    <br>
    <input type="password" name="password"></input>
    <br><br><br>

        <input type="submit" class="submitButton"></input>
    </div>

    <br>
    <br>



 
</div>
</form>
</form>







