<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHPWebPage.php to edit this template
-->
<html>
    <head>
        <?php include 'header.php'; 
        require 'shared/dbConnect.php';
        
        if(isset($_POST["signOut"])){ 
            echo "<script type='text/javascript'> signOut; </script>"; //this is not working
            session_destroy(); //this is not working
            header('Location: index.php'); //readd when signOut() and destroy session work
            die();
        }
        
        
        $sql = "SELECT `menuItemId`, `menuItemName`, `basePrice`, `description` FROM `menuitem` WHERE 1";
        $result = queryDb($sql);
        $menuItems = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                array_push($menuItems, array($row["menuItemId"], $row["menuItemName"], $row["basePrice"], $row["description"]));
            }
            $menuItemsjson = json_encode($menuItems);
            echo "<script>var jsonMenuItems = $menuItemsjson;</script>";
        } else {
            echo "0 results";
        }
        ?>
        

        
        <title>Restaurant: Home</title>
    </head>
    <body onload="menuItemElementMaker()">
        <div id="mountingDiv"></div>
        <p>test</p>  
        <p>test</p> 
        <p>test</p> 
        <p>test</p> 
        <p>test</p> 

        <?php
        // put your code here
        ?>
    </body>
</html>
