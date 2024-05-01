<head>
    <?php
    session_start();
    //session_destroy();
    ?>
</head>
<link rel="stylesheet" href='shared/main.css'>

<script src="shared/scripts.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<nav id="navBar">

    <div id="contextMenu">
        <h1><a class="buttonLink" href="index.php">Restaurant</a></h1>


    </div>
    <div id="signInIsland">
        <a class="fakeButton" href="locations.php">Locations</a>
        <a id="cartButton" class="fakeButton" href="cart.php">Cart</a>
        <button id="signInButton" class="accentButton" onclick="signInPopUp()">Sign In</button>
        <button id="signOut"> Sign Out</button>
    </div>

    <div id="signInContainer">
<?php include 'customer/signInPopUp.php'; 
    if(isset($_SESSION['numDishes']) == false){
        $_SESSION['numDishes'] = 0;
    }
    echo "<script>numDishes = " . $_SESSION['numDishes'] . ";</script>";
    if(isset($_SESSION['orderId'])){
        echo "<script>console.log('orderId set');</script>";
    }
    
?>
    </div>

</nav>

<script>
    getUserLocation();
    updateCartButton();
</script>
<?php
if (isset($_SESSION['givenName'])) {
    $exportEmail = json_encode($_SESSION["email"]);
    $exportName = json_encode($_SESSION["givenName"]);
    $exportFamilyName = json_encode($_SESSION["familyName"]);
    $exportPayment = json_encode($_SESSION["paymentInfo"]);
    echo "<script type='text/javascript'> email= $exportEmail; givenName = $exportName;  familyName = $exportFamilyName; paymentInfo = $exportPayment; </script>";

    echo "<script type='text/javascript'>  signedIn('" . $_SESSION['givenName'] . "'); </script>";
}
?>