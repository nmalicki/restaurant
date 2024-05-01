/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
const cartDivisor = 4;
var userLat = sessionStorage.getItem("lat");
var userLong = sessionStorage.getItem("long");
if (userLat == null) {
    userLat = 42.5882997;
    userLong = -71.7922758;
    sessionStorage.setItem("lat", userLat);
    sessionStorage.setItem("long", userLong);
}

var setRestaurant = sessionStorage.getItem("setRestaurant");

function signInPopUp() {
    document.getElementById("signInContainer").style.display = "block";
}

function closePopUp(target) {
    document.getElementById(target).style.display = "none";
}

function signInResgisterToggle(s) {
    registerForm = document.getElementById("registerForm");
    signInForm = document.getElementById("signInForm");
    registerButton = document.getElementById("registerButton");
    signInButton = document.getElementById("signInFormButton");

    if (window.getComputedStyle(signInForm, null).display === "none" && s != "r") {
        registerForm.style.display = "none";
        signInForm.style.display = "block";
        registerButton.style.backgroundColor = "#d9d9d9";
        signInButton.style.backgroundColor = "#989898";
    } else if (s != "s") {
        registerForm.style.display = "block";
        signInForm.style.display = "none";
        registerButton.style.backgroundColor = "#989898";
        signInButton.style.backgroundColor = "#d9d9d9";
    }
}


function getUserLocation() {
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
    } else {
        var radlat1 = Math.PI * lat1 / 180;
        var radlat2 = Math.PI * lat2 / 180;
        var theta = lon1 - lon2;
        var radtheta = Math.PI * theta / 180;
        var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        if (dist > 1) {
            dist = 1;
        }
        dist = Math.acos(dist);
        dist = dist * 180 / Math.PI;
        dist = dist * 60 * 1.1515;
        if (unit == "K") {
            dist = dist * 1.609344
        }
        if (unit == "N") {
            dist = dist * 0.8684
        }
        return dist;
    }
}

function storeRestaurant(i) {
    for(j = 0; j < jsonLocations.length; j++){
        if(parseInt(jsonLocations[j][0]) === i){
            sessionStorage.setItem("setRestaurant", jsonLocations[j]);
        }
    }
}

function locationElementMaker() {
    for (i = 0; i < jsonLocations.length; i++) {
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
        
        temp = thisLocation;
        setRestaurantButton.setAttribute("onclick", "storeRestaurant(" + temp[0] + ")"); //this line looks wrong to me
        setRestaurantButton.className = "aLocation";
        setRestaurantButton.id = "setRestaurantButton" + temp[0];
        
        
        let form = document.createElement("form");
        form.setAttribute("method", "POST");
        if(window.location.href === "http://localhost/restaurant/locations.php?redirectToCart=true"){
            form.setAttribute("action", "locationAction.php?redirectToCart=true");
        }else{
            form.setAttribute("action", "locationAction.php");
        }
        form.className = "locationForm";
        form.appendChild(setRestaurantButton);
        
        hidden = document.createElement("input");
        hidden.className = "hidden";
        hidden.value = thisLocation;
        hidden.name = "set_location";
        
        form.appendChild(hidden);
        
        div.appendChild(form);

        document.getElementById("mountingDiv").appendChild(div);
    }
    // url += apiKey + "&q=" + dbUrl

}

function goToMenuItem(menuItemId) {
    //console.log(menuItemId);
    window.location.href = "http://localhost/restaurant/menuItem.php?Id=" + menuItemId
}

function menuItemElementMaker() {
    for (i = 0; i < jsonMenuItems.length; i++) {
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

function accountRedirect() {
    //document.getElementById("accountContainer").style.display = "block";//change this to redirct to account page
    window.location.href = "http://localhost/restaurant/account.php";
}

function accountInfoFill() {
    document.getElementById("accountEmail").value = email;
    document.getElementById("accountGivenName").value = givenName;
    document.getElementById("accountFamilyName").value = familyName;
}

function signedIn(name) {
    button = document.getElementById("signInButton");
    button.innerHTML = name;
    button.onclick = accountRedirect;
    //window.location.href = "http://localhost/restaurant/account.php";   //causes loop for some reason
}

function signOut() {
    button = document.getElementById("signInButton");
    button.innerHTML = "Sign In";
    button.onclick = signInPopUp;
    //header("Location: http://localhost/restaurant/index.php", true, 301);
    //exit();
}

//does not work as of now. see article for fix https://stackoverflow.com/questions/1119289/how-to-show-the-are-you-sure-you-want-to-navigate-away-from-this-page-when-ch
function unsavedAccountChanges() {
    alert("You have unsaved changes");
}


function addToCart(item) { //session storage is not storing between pages
    updateCartButton();
    //redirect back to index
}

function toggleButton(buttonName) {
    button = document.getElementById(buttonName);
    if (button.className === "regularMenu notIncluded") { //every button addresses top button
        button.className = "regularMenu";
        //console.log('disable');
    } else {
        button.className = "regularMenu notIncluded";
        //console.log('enabled');
    }
}

function increase() {
    counter = document.getElementById("quantCounter"); //this takes too long
    n = parseInt(counter.value);
    if (n < 5) {
        n += 1;
        counter.value = n;
    } else {
        alert("Limit of 5");
    }
}

function decrease() {
    counter = document.getElementById("quantCounter"); //this takes too long
    n = parseInt(counter.value);
    if (n > 1) {
        n -= 1;
        counter.value = n;
    } else {
        alert("Minimum 1");
    }
}

function menuItem(ingredients) { //switch buttons to toggle buttons https://stackoverflow.com/questions/76837048/creating-the-simplest-html-toggle-button
    console.log("menuItem");
    let ing = document.getElementById("ingredientsDiv");
    let addToCart = document.getElementById("addToCartButton");
    addToCart.setAttribute("onclick", "addToCart('" + "test" + "')");

    for (i = 0; i < ingredients.length; i++) {
        thisIngredient = ingredients[i];

        let thisLabel = document.createElement("label");
        thisLabel.className = "toggleButton";
        let thisCheckBox = document.createElement("input");
        thisCheckBox.setAttribute("type", "checkbox");
        thisCheckBox.className = "toggleBox";
        thisCheckBox.checked = true;
        thisCheckBox.name = "dish" + String(i);

        thisLabel.innerHTML += thisIngredient[3];

        if (thisIngredient[5] == 0) { //not included
            thisCheckBox.checked = false;
        }
        if (thisIngredient[6] == 1) { //extra charge
            thisLabel.className += " extra";
            thisLabel.innerHTML += " +$" + thisIngredient[7];
        }
        if (thisIngredient[4] == 0) { //out of stock
            thisLabel.className = "toggleButton outOfStock";
            thisLabel.disabled = true;
            thisCheckBox.disabled = true;
        }

        thisLabel.appendChild(thisCheckBox);
        ing.appendChild(thisLabel);
    }
    let plusB = document.getElementById("plus");
    plusB.setAttribute("onclick", "increase()");
    let minusB = document.getElementById("minus");
    minusB.setAttribute("onclick", "decrease()");

}

function updateCartButton() {
    button = document.getElementById("cartButton");
    try{
        if(numDishes > 0){
            button.innerHTML = "Cart (" + numDishes + ")";
        }
        else{
            button.innerHTML = "Cart";
        }
    }
    catch(ReferenceError){
        button.innerHTML = "Cart";
    }
}


function populateCart() {
    let runningTotal = 0;
    div = document.getElementById("cartList");
    h = document.createElement("h3");
    h.innerHTML = "Number of Items: " + cart.length/cartDivisor;
    div.appendChild(h);
    if (cart === null) {
        let p = document.createElement("p");
        p.innerHTML = "Cart is empty";
        div.appendChild(p);
    } else {
        for(i = 0; i < cart.length; i+=cartDivisor){
            runningTotal += parseFloat(cart[i+2]);
            let subDiv = document.createElement("div");
            subDiv.className = "cartSubDiv";
            let p = document.createElement("p");
            p.innerHTML = cart[i] + " $" + cart[i+2];
            subDiv.appendChild(p);
            
            let inp = document.createElement("input");
            inp.value = cart[i+1];
            inp.className = "smallInput";
            inp.setAttribute("type", "number");
            inp.setAttribute("name", "cartInput" + i);
            subDiv.appendChild(inp);
            
            div.appendChild(subDiv);
        }
    }
    
    let locationDiv = document.getElementById("locationInfo");
    let locationP = document.createElement("h3");
    locationP.className = "locationP";
    try{
        locationP.innerHTML = cartLocation.split(",")[1];
    }
    catch(ReferenceError){
        locationP.innerHTML = "No location set";
    }
    
    let totals =  document.getElementById("totalSubDiv");
    
    let totalP = document.createElement("p");
    totalP.className = "totalInfo";
    totalP.innerHTML = "Subtotal: " + runningTotal.toFixed(2);
    totals.appendChild(totalP);
    
    let taxP = document.createElement("p");
    taxP.innerHTML = "Tax(6.25%): " + (runningTotal * 0.0625).toFixed(2);
    taxP.className = "totalInfo";
    totals.appendChild(taxP);
    
    let totalh = document.createElement("h2");
    totalh.innerHTML = "Final Total: " +  (runningTotal * 1.0625).toFixed(2);
    totalh.className = "totalInfo";
    totals.appendChild(totalh);
    
    
    locationDiv.appendChild(locationP);
}

function cleanUp(){
    //clearList = [cart, numDishes, jsonDishes, dishes];
    try{delete cart;} catch(ReferenceError){}
    try{delete numDishes;} catch(ReferenceError){}
    try{delete dishes;} catch(ReferenceError){}
    try{delete order;} catch(ReferenceError){}
    
    updateCartButton();
}

function postOrderDisplay(orderDishes){
    console.log(cartDivisor);
    for(i = 0; i < orderDishes.length; i+=cartDivisor){
        let div = document.getElementById("postOrderDiv" + i);
        div.innerHTML = orderDishes[i+1] + "x " + orderDishes[i]+ "<br>";
    }
}

function selectedLocation(){
    for(i = 1; i < 5; i++){
            try{
                let button = document.getElementById("setRestaurantButton" + i);
                button.disabled = false;
            }
            catch(TypeError){
            }
        }
    id = sessionStorage.getItem("setRestaurant");
    if (id === 'undefined' || id === null) {
        console.log('no location');
    }
    else{
        button = document.getElementById("setRestaurantButton" + id.split(",")[0]);
        button.disabled = true;
    }
}