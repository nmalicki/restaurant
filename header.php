<head>
<?php 
    session_start();
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
        <button><a class= "buttonLink" href="locations.php">Locations</a></button>
        <button id="signInButton" class="accentButton" onclick="signInPopUp()">Sign In</button>
        <button id="signOut"> Sign Out</button>
    </div>
    
    <div id="signInContainer">
        <?php include 'customer/signInPopUp.php'; ?>
    </div>
    <div id="accountContainer">
        <?php include 'customer/account.php'; ?>
    </div>
</nav>

<script>getUserLocation();</script>
<?php 
    if(isset($_SESSION['givenName']) ){        
        $exportEmail = json_encode($_SESSION["email"]);
        $exportName = json_encode($_SESSION["givenName"]);
        $exportFamilyName = json_encode($_SESSION["familyName"]);
        $exportPayment = json_encode($_SESSION["paymentInfo"]);
        echo "<script type='text/javascript'> email= $exportEmail; givenName = $exportName;  familyName = $exportFamilyName; paymentInfo = $exportPayment; </script>"; 

        echo "<script type='text/javascript'>  signedIn('" . $_SESSION['givenName'] . "'); </script>"; 
    }
?>