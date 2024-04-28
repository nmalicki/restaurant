<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */



function luhn($number): bool //https://medium.com/@edouard.courty/using-luhns-algorithm-to-validate-credit-card-numbers-and-more-1fc4ebe9db61#:~:text=The%20Luhn%20algorithm%20works%20by,digits%20of%20the%20doubled%20values.
{
    // Remove any spaces or non-digit characters
    $number = preg_replace('/\D/', '', $number);
    $sum = 0;
    $alt = false;

    for ($i = strlen($number) - 1; $i >= 0; $i--) {
        $digit = intval($number[$i]);
        if ($alt) {
            $digit *= 2;
            if ($digit > 9) {
                $digit -= 9;
            }
        }
        $sum += $digit;
        $alt = !$alt;
    }

    return ($sum % 10 == 0);
}

//after order is submitted successfully
$_SESSION['orderId'] = null;

//set orders.ordered to 1