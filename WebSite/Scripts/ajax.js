function postRequest(link, jsonData, runMeWhenDone) {
    let request = new XMLHttpRequest();
    request.open("POST", "http://localhost:60253/api/" + link, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.onreadystatechange = () => {
        if (request.readyState == 4 && request.status >= 200 && request.status < 300) {
            console.log("Request Post: " + request.responseText);
            runMeWhenDone(request.responseText);
        }
    }

    request.send(JSON.stringify(jsonData));
}

function getRequestJ(link, jsonData, runMeWhenDone) {
    var request = new XMLHttpRequest();
    request.open("GET", "http://localhost:60253/api/" + link, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.onreadystatechange = () => {
        if (request.readyState == 4 && request.status >= 200 && request.status < 300) {
            console.log("Request Get: " + request.responseText);
            runMeWhenDone(request.responseText);
        }
    }

    request.send();
}

function getRequestP(link, runMeWhenDone){
    var request = new XMLHttpRequest();
    request.open("GET", "http://localhost:60253/api/" + link, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.onreadystatechange = () =>{
        if (request.readyState == 4 && request.status >= 200 && request.status < 300) {
            console.log("Request Get: " + request.responseText);
            runMeWhenDone(request.responseText);
        }
    };

    request.send();
}

window.onclose = () => {
    localStorage.clear();
};

Body.onload = () => {
    if (window.location.href !== window.origin + "/Pages/MainPage.html") {
        if (localStorage["username"] === undefined && localStorage["userId"] === undefined) {
            window.location.href = "../Pages/MainPage.html";
        }
    }
    else{
        localStorage.clear();
    }
};