<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */

?>



<div id="toggleDiv">
    <button id="registerButton">Register</button>
    <button id="signInFormButton">Sign In</button>
</div>

<form id="registerForm" action="EmployeeRegisterAction.php" method="POST">
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
    
    <button class="w3-button" type="button">Position</button>
<div class="w3-dropdown-content w3-bar-block w3-border">
<input id="chef" class="w3-radio" type="radio" name="position" value="chef" checked="">
<label>Chef</label>
<input id="cashier" class="w3-radio" type="radio" name="position" value="cashier">
<label>Cashier</label>
<br>
<input type="submit" class="submitButton"></input>
</div>
</form>


<form id="logInForm">
    <label>email</label>
    <br>
    <input></input>
    <br>
    <label>Password</label>
    <br>
    <input></input>
    <br>
    <br>
    <input type="submit" class="submitButton"></input>
</form>





