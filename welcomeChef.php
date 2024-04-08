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
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a class="active" href="#home">Home</a>
        <a href="#view-menu">View Menu</a>
        <a href="#edit-ingredients">Edit Ingredients</a>
    </div>
    <?php
    // Sample data for ingredients
    $ingredients = array(
        array("Ketchup", 99),
        array("Mustard", 99),
        array("Bacon", 99),
        array("Beef Patty", 99),
        array("Cheddar Cheese", 99),
        array("American Cheese", 99),
        array("Onion", 99),
        array("Pickle", 99),
        array("Lettuce", 99),
        array("Bun", 99)
    );
    ?>
    <div class="container" id="home">
        <h1>Welcome Chef! </h1>
        <center><img src="shared/chef.jpg" alt=""/></center>
        <p>Thank you for registering as a chef!</p>
        <p>This is your personalized chef dashboard.</p>
        <p>You can manage your recipes, ingredients, and much more here.</p>
        <p>Get started by exploring the features available to you.</p>
        <p>Enjoy cooking!</p>
    </div>

    <div class="container" id="view-menu">
        <h2>View Menu</h2>
        <table>
            <tr>
                <th>Item</th>
                <th>Price</th>
            </tr>
            <tr>
                <td>Burger</td>
                <td>$10.99</td>
            </tr>
            <tr>
                <td>Pizza</td>
                <td>$14.99</td>
            </tr>
            <tr>
                <td>Chicken Parm</td>
                <td>$12.99</td>
            </tr>
            <tr>
                <td>Cheesesteak</td>
                <td>$11.99</td>
            </tr>
        </table>
    </div>

    <div class="container" id="edit-ingredients">
        <h2>Edit Ingredients</h2>
        <table>
            <tr>
                <th>Item</th>
                <th>Quantity</th>
            </tr>
            <?php foreach ($ingredients as $ingredient): ?>
                <tr>
                    <td><?php echo $ingredient[0]; ?></td>
                    <td><input type="number" value="<?php echo $ingredient[1]; ?>" min="0"></td>
                </tr>
            <?php endforeach; ?>
        </table>
    </div>
</body>
</html>
