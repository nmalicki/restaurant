<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Chef</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }
        h1 {
            text-align: center;
        }
        p {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a class="active" href="#home">Home</a>
        <a href="#view-menu">View Menu</a>
        <a href="#edit-menu">Edit Menu</a>
    </div>
    <?php
    // Retrieve given name from URL parameter
    $givenName = isset($_GET ['givenName']) ? htmlspecialchars($_GET['givenName']) : 'Chef';
    ?>
    <h1>Welcome <?php echo $givenName; ?><center><img src="shared/chef.jpg" alt=""/></center>
    <p>Thank you for registering as a chef!</p>
    <p>This is your personalized chef dashboard.</p>
    <p>You can manage your recipes, ingredients, and much more here.</p>
    <p>Get started by exploring the features available to you.</p>
    <p>Enjoy cooking!</p>
   
</body>
</html>