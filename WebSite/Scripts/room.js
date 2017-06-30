var listElement;

Body.onload = () =>{
    listElement = document.getElementById("roomDiv");    
    getRooms();
};

function getRooms(){
    getRequestP("Room/RoomList/1", (response) =>{
        var result = JSON.parse(response);
        for(var i = 0; i < result.length; i++){     

            var divElement = document.createElement("div");            
            divElement.id = "Room" + result[i].rowNum;
            
            divElement.addEventListener(onclick = (event) =>{
               /* var userJoin = {
                    "usern"
                };*/

                postRequest("/User/Join", )
            });

            var titleElement = document.createElement("h2");
            var tite = titleElement.innerHTML = "Room #" + result[i].rowNum;

            divElement.appendChild(titleElement);

            var element = document.createElement("h3");
            var text = element.innerHTML = "Room Name: " + result[i].roomName + "<br> Host: " + result[i].hostUser + "<br> Status: " + result[i].status + "<br> Private: " + result[i].isPrivate;

            divElement.appendChild(element);
            
            listElement.append(divElement);
            //listElement.append(document.createElement("br"));
        }
    });
}

function createRoom(){
    var roomInfo = {
        "name": createTextBox.value,
        "hostId": localStorage["userId"],
        "isPrivate": 0
    };

    postRequest("Room/Create", roomInfo, (response) =>{
        roomInfo = JSON.parse(response);        

        console.log("Post Response " + response);        
        window.location.href = "../Pages/SetupPage.html";
    });
}