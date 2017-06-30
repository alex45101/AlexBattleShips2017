var boardElement;
var shipButtons;
var selectedShip;

document.body.onload = () => {
    baseLoad();
    boardElement = document.getElementById("board");
    shipButtons = document.getElementsByName("ship");

    var checkBox = document.getElementById("readyCheckBox");
    checkBox.onclick = () => {
        let user = {
            "publicRoomId": sessionStorage["roomId"],
            "publicUserId": sessionStorage["userId"],
            "readyStatus": false
        };

        if (checkBox.value == "ready"){
            user.readyStatus = true;
        }

        postRequest("User/Ready", user, (response) => {
            console.log(response);
        });
    };

    for (let i = 0; i < shipButtons.length; i++) {
        shipButtons[i].onclick = () => {
            selectedShip = shipButtons.length - i + 1;
            console.log(selectedShip);
        };
    }

    generateBoard();
};

function generateBoard() {
    let count = 0;
    var table = document.createElement("TABLE");
    table.style.border = "solid";

    for (var i = 0; i < 10; i++) {
        let row = document.createElement("tr");
        row.id = "row:" + (i + 1);

        for (var j = 0; j < 10; j++) {
            let cell = document.createElement("td");
            cell.id = count;
            cell.setAttribute("data-x", j);
            cell.setAttribute("data-y", i);
            cell.innerHTML = "";
            cell.style.border = "solid";
            cell.style.padding = "15px";
            cell.onclick = () => {
                console.log(cell);
                placeShip(selectedShip, 0, cell.id);
            };

            row.appendChild(cell);

            count++;
        }
        table.appendChild(row);
    }

    boardElement.appendChild(table);
}

function placeShip(size, direction, cellId) {
    if (size !== undefined) {
        //right
        if (direction == 0) {

            var cellInfo = {
                "publicRoomId": sessionStorage["roomId"],
                "publicUserId": sessionStorage["userId"],
                "X": "",
                "Y": ""
            };

            for (var i = parseInt(cellId); i < parseInt(cellId) + parseInt(size); i++) {
                let cell = document.getElementById(i);
                cell.style.backgroundColor = "blue";

                cellInfo.X = cell.dataset.x;
                cellInfo.Y = cell.dataset.y;

                postRequest("Board/AddShipCell", cellInfo, (response) => {
                    if (response == "true") {
                        console.log("ship was added")
                    }
                });
            }

        }
    }
}