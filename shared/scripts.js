/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
var cart = sessionStorage.getItem("cart");
if(cart == null){
    cart = "";
    sessionStorage.setItem("cart", cart);
}

var userLat = sessionStorage.getItem("lat");
var userLong = sessionStorage.getItem("long");
if (userLat == null){
    userLat = 42.5882997;
    userLong = -71.7922758;
    sessionStorage.setItem("lat", userLat);
    sessionStorage.setItem("long", userLong);
}

var setRestaurant = sessionStorage.getItem("setRestaurant");

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
    //send data to php 
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

function setRestaurant(location){
    sessionStorage.setItem("setRestaurant", location);
    console.log("Location set to", sessionStorage.getItem("setRestaurant"));
}

function locationElementMaker(){
    for (i = 0; i < jsonLocations.length; i++){
        thisLocation = jsonLocations[i];
        let div = document.createElement("div");
        div.className = "aLocationDiv";
        
        let mapDiv = document.createElement("div");
        mapDiv.className = "mapDiv";
        div.appendChild(mapDiv);
        
        //let mapiFrame = document.createElement("iFrame");
        
        let address = document.createElement("p");
        address.innerHTML = thisLocation[1];
        address.className = "aLocation";
        div.appendChild(address);
        
        let distance = document.createElement("p");
        distance.innerHTML = mapDistance(userLat, userLong, thisLocation[2], thisLocation[3]).toFixed(2) + " miles away";
        distance.className = "aLocation";
        div.appendChild(distance);
        
        let setRestaurantButton = document.createElement("button");
        setRestaurantButton.innerHTML = "Order Here";
        
        setRestaurantButton.setAttribute("onclick", "setRestaurant('" + thisLocation + "')"); //***setting to last location in array***
        setRestaurantButton.className = "aLocation";

        div.appendChild(setRestaurantButton);
        
        document.getElementById("mountingDiv").appendChild(div);
    }
    // url += apiKey + "&q=" + dbUrl
    
}

function goToMenuItem(menuItemId){
    console.log(menuItemId);
    window.location.href = "http://localhost/restaurant/menuItem.php?Id=" + menuItemId
}

function menuItemElementMaker(){
    for (i = 0; i < jsonMenuItems.length; i++){
        thisMenuItem = jsonMenuItems[i];
        let div = document.createElement("div");
        div.className = "menuItemDiv";
        
        let imDiv = document.createElement("img");
        imDiv.className = "imDiv";
        imDiv.src = "shared/fallback.jpg";
        div.appendChild(imDiv);
        
        let name = document.createElement("p");
        name.innerHTML = thisMenuItem[1];
        name.className = "aMenuItem";
        div.appendChild(name);
        
        let price = document.createElement("p");
        price.innerHTML = thisMenuItem[2];
        price.className = "aMenuItem";
        div.appendChild(price);
        
        let addToOrderButton = document.createElement("button");
        addToOrderButton.innerHTML = "Add to Order";
        addToOrderButton.setAttribute("onclick", "goToMenuItem(" + thisMenuItem[0] + ")");
        addToOrderButton.className = "menuOrderButton";

        div.appendChild(addToOrderButton);
        
        document.getElementById("mountingDiv").appendChild(div);
    }
}

function accountRedirect(){
    //document.getElementById("accountContainer").style.display = "block";//change this to redirct to account page
    window.location.href = "http://localhost/restaurant/account.php";    
}

function accountInfoFill(){
    document.getElementById("accountEmail").value = email;
    document.getElementById("accountGivenName").value = givenName;
    document.getElementById("accountFamilyName").value = familyName;
}

function signedIn(name){
    button = document.getElementById("signInButton");
    button.innerHTML = name;
    button.onclick = accountRedirect;
    //window.location.href = "http://localhost/restaurant/account.php";   //causes loop for some reason
}

function signOut(){
    button = document.getElementById("signInButton");
    button.innerHTML = "Sign In";
    button.onclick = signInPopUp;
    //header("Location: http://localhost/restaurant/index.php", true, 301);
    //exit();
}

//does not work as of now. see article for fix https://stackoverflow.com/questions/1119289/how-to-show-the-are-you-sure-you-want-to-navigate-away-from-this-page-when-ch
function unsavedAccountChanges(){
    alert("You have unsaved changes");
}


function addToCart(item){ //session storage is not storing between pages
    cart = sessionStorage.getItem("cart");
    if(cart == ""){
        cart = item;
        sessionStorage.setItem("cart", cart);
    }
    else{
        cart += ", " + item;
        sessionStorage.setItem("cart", cart);
    } 
    updateCartButton();
    //redirect back to index
}

function toggleButton(buttonName){
    button = document.getElementById(buttonName);
    if(button.className === "regularMenu notIncluded"){ //every button addresses top button
        button.className = "regularMenu";
        //console.log('disable');
    }
    else{
        button.className = "regularMenu notIncluded";
        //console.log('enabled');
    }
}

function menuItem(ingredients){
    let label = document.createElement("h1");
    label.className = "";
    label.innerHTML = ingredients[0][0];
    document.getElementById("menuDiv").appendChild(label);
    
    let superDiv = document.createElement("form");
    superDiv.className = "superDiv";
    superDiv.action = "index.php";
    
    let left = document.createElement("div");
    left.className = 'leftMenu';
    let right = document.createElement("div");
    right.className = 'rightMenu';
    
    let menuIm = document.createElement("img");
    menuIm.className = "menuIm";
    menuIm.src = "shared/fallback.jpg";
    left.appendChild(menuIm);
    
    let price = document.createElement("h2");
    price.innerHTML = "$" + ingredients[0][1];
    price.className = "menuh";
    left.appendChild(price);
    
    let desc = document.createElement("h4");
    desc.innerHTML = ingredients[0][2];
    desc.className = "menuh";
    left.appendChild(desc);
    
    let addToCart = document.createElement("button");
    addToCart.className = "addToCartButton";
    addToCart.innerHTML = "Add to Cart +";
    addToCart.setAttribute("onclick",  "addToCart('" + "test" + "')");
    addToCart.setAttribute("type", "submit");
    left.appendChild(addToCart);
    
    superDiv.appendChild(left);
    
    for (i = 0; i < ingredients.length; i++){
        thisIngredient = ingredients[i];
        let thisButton = document.createElement("button");
        thisButton.className = "regularMenu";
        thisButton.id = thisIngredient[3];
        thisButton.setAttribute("onclick",  "toggleButton('" + thisIngredient[3] + "')");
        thisButton.innerHTML = thisIngredient[3];
        thisButton.setAttribute("type", "button");
        if(thisIngredient[4] == 0){ //out of stock
           thisButton.className += " outOfStock";
           thisButton.disabled = true;
        }
        if(thisIngredient[5] == 0){ //not included
            thisButton.className += " notIncluded"
        }
        if(thisIngredient[6] == 1){ //extra charge
            thisButton.className += " extra";
            thisButton.innerHTML += " +$";
        }
        right.appendChild(thisButton);
        
    }
    superDiv.appendChild(right);
    document.getElementById("menuDiv").appendChild(superDiv);    
}

function updateCartButton(){
    button = document.getElementById("cartButton");
    cart = sessionStorage.getItem("cart");
    cart = cart.split(",");
    if(cart.length > 0){
        if(cart[0].localeCompare('') === 0){
            button.innerHTML = "Cart";
        }
        else{
            button.innerHTML = "Cart (" + cart.length + ")";
        }   
    }
    else{
        console.log(cart, "cart is empty");
    }
}


function populateCart(){
    cart = sessionStorage.getItem("cart");
    p = document.getElementById("cartList");
    if(cart === null || cart === ""){
        p.innerHTML = "Cart is empty";
    }
    else{
        p.innerHTML = cart;
    }
}