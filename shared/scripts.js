/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

function signInPopUp(){
    document.getElementById("signInContainer").style.display = "block";
}

function closePopUp(target){
    document.getElementById(target).style.display = "none";
}

function signInResgisterToggle(s){
    registerForm = document.getElementById("registerForm");
    signInForm = document.getElementById("signInForm");
    registerButton = document.getElementById("registerButton");
    signInButton = document.getElementById("signInFormButton")
    
    if(window.getComputedStyle(signInForm, null).display === "none" && s != "r"){
        registerForm.style.display = "none";
        signInForm.style.display = "block";
        registerButton.style.backgroundColor = "#d9d9d9";
        signInButton.style.backgroundColor = "#989898";
    }
    else if(s != "s"){
        registerForm.style.display = "block";
        signInForm.style.display = "none";
        registerButton.style.backgroundColor = "#989898";
        signInButton.style.backgroundColor = "#d9d9d9";
    }
    
    
}

function getUserLocation(){
    console.log("Anything");
    /*
    if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition((position) => {
            console.log(position.coords.latitude, position.coords.longitude);
        });
    } else {
        console.log("Fail");
    }
     *
     */
}

function locationDOMMaker(){

}