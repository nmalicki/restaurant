<head>
    <?php include 'header.php'; ?>

    <title>Restaurant: Account</title>
</head>

<body onload="accountInfoFill()" onbeforeunload="unsavedAccountChanges()">
    <form id="accountForm" method="POST" action="accountAction.php" >
        <label>Email</label>
        <input id="accountEmail"name="accountEmail">
        <div id="registerNames">
            <div class = "half left">
                <label>Given Name</label>
                <input id="accountGivenName" name="accountGivenName">
            </div>
            <div class = "half right">
                <label>Family Name</label>
                <input id="accountFamilyName" name="accountFamilyName">
            </div>
        </div>
        <label>Current Password</label>
        <input id="accountCurrentPassword" name="accountCurrentPassword" type="password" required="">
        <label>New Password</label>
        <input id="accountNewPassword" name="accountNewPassword" type="password">
        <input name="submit" type="submit" class = "accentButton" value="Update Account Info">

    </form>
    <form id="signOutForm" method="POST" action="index.php"><input type="submit" name="signOut" value="Sign Out"></input></form>
</body>

