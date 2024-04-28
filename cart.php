<head>
    <title>Restaurant: Cart</title>
    <?php
    include "header.php";
    require "shared/dbConnect.php";
    $sql = "SELECT orders.`orderId`, `dishId`, dish.menuId FROM `dish`, `orders`, menuItem, ingredient WHERE orders.orderId = 12 AND dish.orderId = orders.orderId and dish.menuId = menuitem.menuItemId;";
    //partial sql statement, not done or working rn
    /* 
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
     */

    ?>
</head>


<body id="cartBody" onload="populateCart()">
    <div>
        <div id="split">
            <div id="cart" class="cartDiv">
                <h1 class="cartH1">Cart</h1>
                <p id="cartList" ><p/>
            </div>
            <div id="totals" class="cartDiv"><h1 class="cartH1">Total</h1></div>
        </div>
        <div id="locationInfo" class="cartDiv"><h1 class="cartH1">Location</h1></div>
    </div>
</body>