/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
var userLat;
var userLong;

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
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        console.log("Loaction services unsupported");
    }
    userLat = sessionStorage.getItem("lat");
    userLong = sessionStorage.getItem("long");

}

function showPosition(position) {
    sessionStorage.setItem("lat", position.coords.latitude);
    sessionStorage.setItem("long", position.coords.longitude);

}


function mapDistance(lat1, lon1, lat2, lon2, unit) {//from https://www.geodatasource.com/developers/javascript
	if ((lat1 == lat2) && (lon1 == lon2)) {
		return 0;
	}
	else {
		var radlat1 = Math.PI * lat1/180;
		var radlat2 = Math.PI * lat2/180;
		var theta = lon1-lon2;
		var radtheta = Math.PI * theta/180;
		var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
		if (dist > 1) {
			dist = 1;
		}
		dist = Math.acos(dist);
		dist = dist * 180/Math.PI;
		dist = dist * 60 * 1.1515;
		if (unit=="K") { dist = dist * 1.609344 }
		if (unit=="N") { dist = dist * 0.8684 }
		return dist;
	}
}

function locationElementMaker(){
    for (i = 0; i < jsonLocations.length; i++){
        thisLocation = jsonLocations[i];
        let div = document.createElement("div");
        div.style.backgroundColor = "#d9d9d9";
        div.style.width = "20%";
        div.style.height = "30%";
        div.style.marginLeft = "15%";
        div.style.paddingTop = "1%";
        div.style.backgroundColor = "#d9d9d9";
        div.style.display = "inline flex";
        
        let map = document.createElement("iFrame");
        map.style.border = 0;
        //div.appendChild(map);
        
        let address = document.createElement("p");
        address.innerHTML = thisLocation[1];
        div.appendChild(address);
        let distance = document.createElement("p");
        console.log(userLat, userLong, thisLocation[2], thisLocation[3]);
        distance.innerHTML = mapDistance(userLat, userLong, thisLocation[2], thisLocation[3]) + "m away";
        div.appendChild(distance);
        
        document.getElementById("mountingDiv").appendChild(div);
    }
    // url += apiKey + "&q=" + dbUrl
    
}