<link rel="stylesheet" href='shared/main.css'>
<script src="shared/scripts.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<nav id="navBar">
    <div id="contextMenu">
        <h1><a href="index.php">Restaurant</a></h1>
        <button>Test 1</button>
        <button>Test 2</button>
    </div>
    <div id="signInIsland">
        <button><a href="locations.php">Locations</a></button>
        <button id="signInButton" onclick="signInPopUp()">Sign In</button>
        <button id="signOut"> Sign Out</button>
    </div>
    
    <div id="signInContainer">
        <?php include 'customer/signInPopUp.php'; ?>
    </div>
</nav>
