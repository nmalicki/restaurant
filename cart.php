<head>
    <title>Restaurant: Cart</title>
    <?php
    include "header.php";
    require "shared/dbConnect.php";
    
    checkOrCreateOrder();
    
    
    $sql = "SELECT menuItemName, dish.quantity, dish.price, dish.dishId FROM dish, orders, menuItem WHERE orders.orderId = " . $_SESSION['orderId'] . " AND dish.orderId = orders.orderId and dish.menuId = menuitem.menuItemId;";
    $result = queryDb($sql);
    $dishes = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($dishes, $row["menuItemName"], $row["quantity"], $row['price'], $row['dishId']);
        }
    }
    $_SESSION['dishes'] = $dishes;
    $dishesJson = json_encode($dishes);
    echo "<script> cart = $dishesJson;</script>";
    
    if(isset($_SESSION['location'])){
        $locationJson = json_encode($_SESSION['location']);
    echo "<script> cartLocation = $locationJson;</script>";
    }
    if(isset($_SESSION['paymentInfo'])){
        $payment = $_SESSION['paymentInfo'];
    }
    else{
        $payment = "";
    }


    ?>
</head>


<body id="cartBody" onload="populateCart()">
    <form action="orderAction.php" method="POST">
        <div id="split">
            <div id="cart" class="cartDiv">
                <h1 class="cartH1">Cart</h1>
                <p id="cartList" ><p/>
            </div>
            <div id="totals" class="cartDiv">
                <h1 class="cartH1">Total</h1>
                <div id="totalSubDiv"></div>
                <div id="paymentDiv">
                    <h3>Payment Info</h3>
                    <input id="payInput" name="payment" type="number" value="<?php echo $payment?>" required></input>
                </div>
                    
            </div>
        </div>
        <div id="locationInfo" class="cartDiv"><h1 class="cartH1" maxLength="16">Location</h1></div>
        
        <button id="orderButton">Order</button>
    </form>
</body>