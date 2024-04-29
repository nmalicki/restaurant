<html>
    <head>
        <?php include 'header.php'; ?>

        <title>Restaurant: Locations</title>
    </head>
    <body>
        
        <h1>Locations</h1>
        
        <div id="mountingDiv"></div>
        <?php
        //db call to get information and number of locations
        require 'shared/dbConnect.php';
        $userLat = "<script>document.writeln(userLat);</script>" ;
        $userLong = "<script>document.writeln(userLong);</script>" ;
        //echo $userLat;
        //echo $userLong;
        
        $sql = "SELECT * FROM `location` ORDER BY ST_Distance_Sphere( point('$userLong' , '$userLat'), point(location.longitude, location.latitude)) DESC";
        $result = queryDb($sql);
        $locations = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                array_push($locations, array($row["locationId"], $row["streetAddress"], $row["latitude"], $row["longitude"], $row["url"], $row["openingTime"], $row["closingTime"]));
                $locationsjson = json_encode($locations);
                echo "<script>var jsonLocations = $locationsjson;</script>";
            }
        } else {
            echo "0 results";
        }


        //js to add info to each
        //https://www.geeksforgeeks.org/program-distance-two-points-earth/
        ?>
        <script>locationElementMaker()</script>
        <!-- https://developers.google.com/maps/documentation/embed/get-started-->
<?php ?>
    </body>
</html>
