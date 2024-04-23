<html>
    <head>
        <title>Restaurant: Menu Item</title>
        <?php 
            include 'header.php'; 
            require 'shared/dbConnect.php';
            $menuItemId = $_GET['Id'];
            $ingredients = [];
            $sql = "SELECT menuitem.menuItemName, menuitem.basePrice, menuitem.description, ingredient.name, ingredient.price, ingredient.inStock, menuingredient.includedByDefault, menuingredient.extraCharge FROM menuitem, menuingredient, ingredient where ingredient.ingredientId = menuingredient.ingredientId and menuitem.menuItemId = menuingredient.menuItemId and menuitem.menuItemId = $menuItemId ORDER BY ingredient.inStock DESC, menuingredient.includedByDefault DESC";
            $result = queryDB($sql);
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    array_push($ingredients, array($row["menuItemName"], $row["basePrice"], $row["description"], $row["name"], $row["inStock"], $row["includedByDefault"], $row["extraCharge"]));
                    //echo "<p>" . $row['menuItemName'] . $row['basePrice'] .  $row['description'] . $row['name'] . $row['inStock'] . "</p>";
                }
            $ingredients = json_encode($ingredients);
            echo "<script>var jsoningredients = $ingredients;</script>";
        } else {
            echo "0 results";
            header('Location: http://localhost/restaurant/index.php');
        }
        ?>
        
    </head>
    
    <body onload="menuItem(jsoningredients)">
        <div id="menuDiv"></div>
            
    </body>
</html>






<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */

// "SELECT menuitem.name, menuitem.basePrice, menuitem.description, ingredient.name, ingredient.price, ingredient.inStock FROM menuitem, menuingredient, ingredient where ingredient.ingredientId = menuingredient.ingredientId and menuitem.menuItemId = menuingredient.menuItemId and menuitem.menuItemId = 1;"