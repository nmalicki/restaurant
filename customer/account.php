<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */


if(isset($_POST["signOut"])){
    echo "<script type='text/javascript'> signOut; </script>"; 
    session_destroy(); 
    header('Location: index.php');
    die();
    
    

}
?>
<form id="accountForm" method="POST" action="accountAction.php">
    <button id = "accountContainerClose" onClick="closePopUp('accountContainer')">X</button>
    <label>Email</label>
    <input id="accountEmail"name="accountEmail">
    <label>Given Name</label>
    <input id="accountGivenName" name="accountGivenName">
    <label>Family Name</label>
    <input id="accountFamilyName" name="accountFamilyName">
    <label>Password</label>
    <input id="accountPassword" name="accountPassword" type="password" required="">
    <input name="submit" type="submit" class = "accentButton" value="Update Account Info">
    
</form>
<form id="signOutForm" method="POST"><input type="submit" name="signOut" value="Sign Out"></input></form>

