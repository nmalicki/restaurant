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
<form id="accountForm">
    <button id = "accountContainerClose" onClick="closePopUp('accountContainer')">X</button>
    <label>Email</label>
    <input id="accountEmail">
    <label>Given Name</label>
    <input id="accountGivenName">
    <label>Family Name</label>
    <input id="accountFamilyName">
</form>
<form id="signOutForm" method="POST"><input type="submit" name="signOut" value="Sign Out"></input></form>

