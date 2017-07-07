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

function getRequestP(link, runMeWhenDone) {
    var request = new XMLHttpRequest();
    request.open("GET", "http://localhost:60253/api/" + link, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.onreadystatechange = () => {
        if (request.readyState == 4 && request.status >= 200 && request.status < 300) {
            console.log("Request Get: " + request.responseText);
            runMeWhenDone(request.responseText);
        }
    };

    request.send();
}

document.body.onload = () => {
    baseLoad();
}

function baseLoad() {

    if (OnWindow("/Pages/MainPage.html") === false) {
        if (IsUserCreated() === false) {
            console.log(window.location.origin + "/Pages/MainPage.html");
            console.log(window.location.href);

            console.log("redirecting....");
            window.location.href = "../Pages/MainPage.html";
        }
        else {
            if (OnWindow("/Pages/SetupPage.html") === false && sessionStorage["roomId"] !== undefined) {
                var userJoin = {
                    "publicRoomId": sessionStorage["roomId"],
                    "publicUserId": sessionStorage["userId"]
                };

                if (sessionStorage["isHost"] === "false") {
                    postRequest("User/Leave", userJoin, (response) => {
                        if (response == "true") {
                            console.log("User left roomId: " + sessionStorage["roomId"]);
                            sessionStorage.removeItem("roomId");
                        }
                    });
                }
            }
        }
    }
}

function IsUserCreated() {
    return sessionStorage["username"] !== undefined && sessionStorage["userId"] !== undefined;
}

function OnWindow(link) {
    return window.location.href === window.location.origin + link;
}