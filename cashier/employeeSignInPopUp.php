<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */

?>


<button id="signInContainerClose" onclick="closePopUp('signInContainer')">X</button>
<p><center>Employee Login</center></p>
<div id="toggleDiv">
    <button id="registerButton">Register</button>
    <button id="signInFormButton">Sign In</button>
</div>

<form id="registerForm" action="employeeRegisterAction.php" method="POST">
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
    <label>Position</label>
    <br>
    <input name="position"></input>
    <br>
    <br>
    <input type="submit" class="submitButton"></input>
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





