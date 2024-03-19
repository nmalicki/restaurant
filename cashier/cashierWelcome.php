<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cashier Homepage</title>
    <style>
        body {
            font-family: Times New Roman, sans-serif;
            background-color: lightblue;
            text-align: center;
            padding-top: 100px;
        }
        h1 {
            color: #333;
        }
        h2{
            color: red;
        }
    </style>
</head>
<body>
    <?php
    // Retrieve given name from URL parameter
    $givenName = isset($_GET ['givenName']) ? htmlspecialchars($_GET['givenName']) : 'cashier';
    ?>
    <h1>Welcome to the Restaurant <?php echo $givenName; ?>!</h1>
    <p>Thank you for registering as a cashier!</p>
    <h2>This is the cashier homepage</h2>
   
</body>
</html>