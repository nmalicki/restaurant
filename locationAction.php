<?php
include "header.php";
require "shared/dbConnect.php";
/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */

$location = $_POST['set_location'];
$_SESSION['location'] = $location;

checkOrCreateOrder();

//change the db location of order
if(isset($_GET['redirectToCart'])){
    header("Location: cart.php");
}
else{
    header("Location: locations.php");
    
}
//die();