<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Chef</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding-top: 100px;
        }
        h1 {
            color: #333;
        }
    </style>
</head>
<body>
    <?php
    // Retrieve given name from URL parameter
    $givenName = isset($_GET ['givenName']) ? htmlspecialchars($_GET['givenName']) : 'Chef';
    ?>
    <h1>Welcome <?php echo $givenName; ?></h1>
    <p>Thank you for registering as a chef!</p>
   
</body>
</html>