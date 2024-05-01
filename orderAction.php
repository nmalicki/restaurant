<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */

include "header.php";
require "shared/dbConnect.php";

$carDivisor = 4;

if(isset($_SESSION['paymentInfo']) == false){
    $_SESSION['paymentInfo'] = $_POST['payment'];
    //upload cc info to db
}

if(isset($_SESSION['orderId']) == false){
    header("Location: index.php");
    die();
}

if(isset($_SESSION['location']) == false){
    header("Location: locations.php?redirectToCart=true");
    die();
}
//update db for quantities
//if a quantity is now zero delete all dishmenuingredients and then the dish
for($i = 0; $i < count($_SESSION['dishes'])/$carDivisor; $i++){
    echo $i;
    $thisQuantity = $_POST['cartInput' . $i * $carDivisor];
    $thisDish = array_slice($_SESSION['dishes'], $i * $carDivisor, $carDivisor);
    print_r($thisDish);
    if($thisQuantity >  0){
        $sql = "UPDATE `dish` SET `quantity`= $thisQuantity WHERE dishId = $thisDish[3];";
        $result = modifyDB($sql); 
    }
    else{
        //remove from dish array as well
        $sql = "DELETE FROM `dishmenuingredient` WHERE dishId = $thisDish[3];";  
        $result = modifyDB($sql); 
        $sql = "DELETE FROM `dish` WHERE dishId = $thisDish[3];";
        $result = modifyDB($sql);
    }
    
    
    
}




$dishesJson = json_encode($_SESSION['dishes']);
echo "<script> postOrder = $dishesJson;</script>";
        
echo "<a class='logLink backLink' href='index.php'>< Back</a><br>";
echo "<h1 class='orderConfirm'>Order Successful</h1> <br>";
for($i = 0; $i < count($_SESSION['dishes']); $i+=$carDivisor){
    echo "<h3 id='postOrderDiv$i' class='postOrderDiv'></h3>";
}
echo "<script>postOrderDisplay(postOrder);</script>";
echo "<script>cleanUp();</script>";

//set orders.ordered to 1
$sql = "UPDATE `orders` SET `ordered`= 1 WHERE orderId = " . $_SESSION['orderId'];
$result = modifyDB($sql);

//after order is submitted successfully
unset($_SESSION['orderId']);
unset($_SESSION['numDishes']);
unset($_SESSION['dishes']);
