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

function signInResgisterToggle(){
    
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