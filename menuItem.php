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
                array_push($ingredients, array($row["menuItemName"], $row["basePrice"], $row["description"], $row["name"], $row["inStock"], $row["includedByDefault"], $row["extraCharge"], $row['price']));
                //echo "<p>" . $row['menuItemName'] . $row['basePrice'] .  $row['description'] . $row['name'] . $row['inStock'] . "</p>";
            }
            $ingredientsJson = json_encode($ingredients);
            echo "<script>var jsoningredients = $ingredientsJson;</script>";
        } else {
            echo "0 results";
            header('Location: http://localhost/restaurant/index.php');
        }
        ?>

    </head>

    <body onload="menuItem(jsoningredients)"> 

        <div id="menuDiv">
            <a href="index.php" class="buttonLink">< Back</a>
            <h1 name="dishName"><?php echo $ingredients[0][0] ?></h1>
            <form class="superDiv" action="menuAction.php" method="POST">
                <input name="dishName" class="postInput" value="<?php echo $ingredients[0][0] ?>"></input>
                <input name="menuItemId" class="postInput" value="<?php echo $menuItemId ?>"></input>
                <input name="numIngredients" class="postInput" value="<?php echo sizeof($ingredients) ?>"></input>


                <div class="leftMenu">
                    <image src = "shared/fallback.jpg" class="menuIm">
                    <h2 class="menuh">$<?php echo $ingredients[0][1]; ?></h2>
                    <h4 class="menuh"><?php echo $ingredients[0][2]; ?></h4>
                    
                </div>
                <div id="rightMenu" class="rightMenu">
                    <div id="ingredientsDiv"></div>
                    <div class="quantDiv">
                        <button id="minus" type="button" class="quantity">-</button>
                        <input name="quantity" id="quantCounter" class="quantity" value="1"></input>
                        <button id="plus" type="button" class="quantity">+</button>
                        
                        
                    </div>
                    <input type="reset" id="resetButton">
                    <button id="addToCartButton" type="submit" class="addToCartButton">Add to Cart +</button>
                </div>

            </form>
        </div>


    </body>
</html>






<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */

// "SELECT menuitem.name, menuitem.basePrice, menuitem.description, ingredient.name, ingredient.price, ingredient.inStock FROM menuitem, menuingredient, ingredient where ingredient.ingredientId = menuingredient.ingredientId and menuitem.menuItemId = menuingredient.menuItemId and menuitem.menuItemId = 1;"