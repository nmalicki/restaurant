<?php

//connection string
$servername = "localhost";
$dbname = "restaurant";
$username = "root";
$dbpassword = "";
$conn;

// APIs 
function openDB() {
    global $servername, $username, $dbpassword, $dbname, $conn;

// Create connection
    $conn = new mysqli($servername, $username, $dbpassword, $dbname);
    if ($conn->connect_error)
        return $conn->connect_error;
    else
        return "Connected";
}

function closeDB() {
    global $conn;
    $conn->close();
}

// API to modify DB
function modifyDB($sql) {
    global $conn;
    $message = openDB();
    if ($message == "Connected") {
        if ($conn->query($sql) === TRUE)
            $message = "Update Successful";
        else
            $message = $conn->error;
        closeDB();
    }
    return $message . "<br>";
}

// API to query DB
function queryDB($sql) { // returns an object or a string
    global $conn;
    $message = openDB();
    if ($message == "Connected") {
        $result = $conn->query($sql);
        if (gettype($result) == "object")
            $message = $result;
        else
            $message = $conn->error . "<br>Your SQL:" . $sql;
        closeDB();
    }
    return $message;
}

// API for login with prepared statement
function loginDB($sql, $user, $pwd) {
    global $conn;
    $message = openDB();
    if ($message == "Connected") {
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $user, $pwd);
        $stmt->execute();
        $result = $stmt->get_result();
        if (gettype($result) == "object")
            $message = $result;
        else
            $message = $conn->error . "<br>Your SQL:" . $sql;
        closeDB();
    }
    return $message;
}

function checkOrCreateOrder() {
    if (isset($_SESSION['location'])) {
            $location = $_SESSION['location'][0];
        } else {
            $location = "NULL";
        }
        
        if (isset($_SESSION['customerId'])) {
            $customerId = $_SESSION['customerId'];
        } else {
            $customerId = "NULL";
    }
    
    if (isset($_SESSION['orderId']) == false) {
        $sql = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'restaurant' AND TABLE_NAME  = 'orders';";
        $result = queryDb($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $orderId = $row['AUTO_INCREMENT'];
            }
        }

        $sql = "INSERT INTO `orders` (`orderId`, `date`, `customerId`, `locationId`) VALUES (" . $orderId . ", '" . date("Y-m-d") . "', " . $customerId . ", " . $location . ");";
        $result = modifyDb($sql);
        $_SESSION['orderId'] = $orderId;
    } else {
        $sql = "UPDATE `orders` SET `customerId`= $customerId, `locationId` = $location WHERE orders.orderid =  " . $_SESSION['orderId'] . ";";
        $result = modifyDb($sql);
    }
}
?>
