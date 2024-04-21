<?php
session_start();
if (isset($_SESSION['admin']) == true) {
    
} else {
    echo "Please log in first to see this page.";
    header("Location: adminLoginPage.php");
    echo "Please log in first to see this page.";
}
require "shared/dbConnect.php";

openDB();
?>

<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Edit</title>
        <style>
            body {
                font-family: Times New Roman, sans-serif;
                background-color: lightgreen;
                text-align: center;
                padding-top: 100px;
            }
            h1 {
                color: #333;
            }
            h2{
                color: red;
            }
            .submitButton {
                background-color: blue; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
        </style>
    </head>
    <body>

        <h1><center>Edit Employees</center></h1>

        <label><center>Enter updated employee info (ID must match employee to be changed)</center></label>    <br>
        <form style="text-align: center" id="registerForm" action="editEmployeeAction.php" method="POST">
            <div id="registerNames">
                <label>ID</label>

                <input name="employeeId"></input>

                <label>Given Name</label>

                <input name="givenName"></input>

                <label>Family Name</label>

                <input name="familyName"></input><br>
                <br>

                <label>User Name</label>

                <input name="userName"></input>

                <label>Password</label>

                <input type="password" name="password"></input>

                <label>Position</label>

                <input type="position" name = "position"></input>
                <br>
                <br>
                <input type="submit" class="submitButton"></input>
        </form>
                <br>
                <br>
                <br>
                <h1><center>Delete Employees</center></h1>

                <label><center>Enter ID of employee to delete</center></label>    <br>
                <form style="text-align: center" id="registerForm" action="deleteEmployeeAction.php" method="POST">
                    <div id="registerNames">
                        <label>ID</label>

                        <input name="employeeId"></input>
                        <input type="submit" class="submitButton"></input>
                        <br>
                        <br>
                        <br>
                        <label><center>List of current employee info</center></label>       
                        <?php
                        $sql = "SELECT * FROM employee";
                        $result = $conn->query($sql);
                        if ($result->num_rows > 0) {
                            // output data of each row
                            while ($row = $result->fetch_assoc()) {
                                echo "<br> id: " . $row["employeeId"] . " - User name: " . $row["userName"] . " - Given Name: " . $row["givenName"] . " - Family Name: " . $row["familyName"] . " - Position: " . $row["position"] . "<br>";
                            }
                        } else {
                            echo "0 results";
                        }
                        ?>
                </form>
                        </body>
