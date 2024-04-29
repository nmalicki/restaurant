<?php
include "header.php";
require "shared/dbConnect.php";
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */
//setting session information if not set already
checkOrCreateOrder();


//getting info from the form
$menuItemId = $_POST['menuItemId'];
echo "menuItemId: " . $menuItemId . "<br>";

$ingredients = [];
$sql = "SELECT menuitem.menuItemName, menuitem.basePrice, menuitem.description, ingredient.name, ingredient.price, ingredient.inStock, menuingredient.includedByDefault, menuingredient.extraCharge, menuItem.menuItemId, ingredient.ingredientId, menuIngredient.menuIngredientId FROM menuitem, menuingredient, ingredient where ingredient.ingredientId = menuingredient.ingredientId and menuitem.menuItemId = menuingredient.menuItemId and menuitem.menuItemId = $menuItemId ORDER BY ingredient.inStock DESC, menuingredient.includedByDefault DESC";
$result = queryDB($sql);
$ingredients = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        array_push($ingredients, array($row["menuItemName"], $row["basePrice"], $row["description"], $row["name"], $row["inStock"], $row["includedByDefault"], $row["extraCharge"], $row["menuItemId"], $row["ingredientId"], $row["menuIngredientId"]));
        //echo "<p>" . $row['menuItemName'] . $row['basePrice'] .  $row['description'] . $row['name'] . $row['inStock'] . "</p>";
    }
    $ingredientsJson = json_encode($ingredients);
    echo "<script>var jsoningredients = $ingredientsJson;</script>";
} else {
    echo "0 results";
    header('Location: http://localhost/restaurant/index.php');
}



$dishName = $_POST['dishName'];
//echo "Dish name: " . $dishName . "<br>";

$quantity = $_POST['quantity'];
//echo "Quantity: " . $quantity . "<br>";

$numIngredients = $_POST['numIngredients'];
//echo "numIngredients: " . $numIngredients . "<br>";



$dishIngredients = [];
$i = 0;
for($i = 0; $i < $numIngredients; $i += 1){
    if(isset($_POST['dish' . $i])){
        array_push($dishIngredients , $ingredients[$i]);

    }
    else{
        //array_push($dishIngredients , "off");
    }
}

$price = 10; //calculate cost of dish
//make dish object
echo "orderId: " . $_SESSION['orderId'] . "<br>";
$sql = "INSERT INTO `dish`(`dishId`, `price`, `quantity`, `orderId`, `menuId`) VALUES (0,  $price, $quantity, " . $_SESSION['orderId'] . ", " . $ingredients[0][7] . ");";
echo $sql . "<br>";
$result = modifyDb($sql);
//send dishIngredients to db
$sql ="SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'restaurant' AND TABLE_NAME  = 'dish';";
$result = queryDb($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $dishId = $row['AUTO_INCREMENT'] - 1;
    }
} else {
    echo "0 results";
}
for($i = 0; $i < sizeof($dishIngredients); $i+=1){
    $sql = "INSERT INTO `dishmenuingredient`(`dishingredientId`, `dishId`, `menuingredientId`) VALUES (0, " . $dishId . ", " . $ingredients[$i][9] . ");";
    echo $sql . "<br>";
    $result = modifyDb($sql);
}

$_SESSION['numDishes'] += 1;







//redirect when getting stuff in db works
header("Location: index.php");
die();
?>


