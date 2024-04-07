<?php

clearstatcache();
session_start();
unset($_SESSION['admin']);
header("Location: adminLoginPage.php");
session_destroy();
?>
