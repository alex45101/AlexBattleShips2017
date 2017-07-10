var listElement;

document.body.onload = () => {
    baseLoad();
    listElement = document.getElementById("roomDiv");
    getRooms();
};

function getRooms() {
    getRequestP("Room/RoomList/1", (response) => {
        var result = JSON.parse(response);
        for (let i = 0; i < result.length; i++) {

            var divElement = document.createElement("div");
            divElement.id = "Room" + result[i].rowNum;

            divElement.onclick = (event) => {

                sessionStorage["roomId"] = result[i].roomId;

                var userJoin = {
                    "publicRoomId":  sessionStorage["roomId"],
                    "publicUserId": sessionStorage["userId"]
                };

                postRequest("User/Join", userJoin, (response) => {
                    if (response == "true") {
                        sessionStorage["roomId"] =  sessionStorage["roomId"];
                        sessionStorage["isHost"] = false;

                        console.log(sessionStorage["username"] + " has joined the room " + result[i].roomName);
                        sessionStorage["previousPage"] = "SetupPage";
                        window.location.href = "../Pages/SetupPage.html";
                    } else {
                        console.log("The room is full");
                        alert("The room is full");
                    }
                });
            };

            var titleElement = document.createElement("h2");
            titleElement.innerHTML = "Room #" + result[i].rowNum;

            divElement.appendChild(titleElement);

            var element = document.createElement("h3");
            element.innerHTML = "Room Name: " + result[i].roomName + "<br> Host: " + result[i].hostUser + "<br> Status: " + result[i].status + "<br> Private: " + result[i].isPrivate;

            divElement.appendChild(element);

            listElement.appendChild(divElement);
            //listElement.append(document.createElement("br"));
        }
    });
}

function createRoom() {
    var roomInfo = {
        "name": createTextBox.value,
        "hostId": sessionStorage["userId"],
        "isPrivate": 0
    };

    postRequest("Room/Create", roomInfo, (response) => {
        roomInfo = JSON.parse(response);

        sessionStorage["roomId"] = roomInfo.publicId;
        sessionStorage["isHost"] = true;

        console.log("Post Response " + response);
        console.log("Created room: " + sessionStorage["roomId"])
        sessionStorage["previousPage"] = "SetupPage";
        window.location.href = "../Pages/SetupPage.html";
    });
}