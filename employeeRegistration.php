<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */

?>



<p><center>Employee Registration</center></p>
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







