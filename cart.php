<head>
    <title>Restaurant: Cart</title>
    <?php
    include "header.php";
    require "shared/dbConnect.php";
    
    if(isset($_SESSION['orderId']) == false){
        $sql ="SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'restaurant' AND TABLE_NAME  = 'orders';";
        $result = queryDb($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $orderId = $row['AUTO_INCREMENT'];
            }
        } else {
            echo "0 results";
        }
        $_SESSION['orderId'] = $orderId;
    }
    
    
    $sql = "SELECT menuItemName, dish.quantity FROM dish, orders, menuItem WHERE orders.orderId = " . $_SESSION['orderId'] . " AND dish.orderId = orders.orderId and dish.menuId = menuitem.menuItemId;";
    $result = queryDb($sql);
    $dishes = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($dishes, $row["menuItemName"], $row["quantity"]);
        }
    }
    
    $dishesJson = json_encode($dishes);
    echo "<script> cart = $dishesJson;</script>";
    
    if(isset($_SESSION['location'])){
        $locationJson = json_encode($_SESSION['location']);
    echo "<script> cartLocation = $locationJson;</script>";
    }
    else{
        //create button that sends them to location page
    }

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