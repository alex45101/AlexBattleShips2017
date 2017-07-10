var playerBoardElement;
var enemyBoardElement;
var statusLabel;
var playerCells;
var enemyCells;

document.body.onload = () => {
    baseLoad();
    playerBoardElement = document.getElementById("playerBoard");
    enemyBoardElement = document.getElementById("enemyBoard");
    statusLabel = document.getElementById("gameStatus");
};

getRequestP("Board/UserBoard/" + sessionStorage["roomId"] + "/" + sessionStorage["userId"], (response) => {
    console.log(response);
    playerCells = JSON.parse(response);
    generateBoard(false);
});

getRequestP("Board/UserBoard/" + sessionStorage["roomId"] + "/" + sessionStorage["enemyId"], (response) => {
    console.log(response);
    enemyCells = JSON.parse(response);
    generateBoard(true);
});

function generateBoard(isEnemy) {
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
            cell.style.border = "solid";
            cell.style.padding = "15px";

            if (isEnemy === false && containsPosition(playerCells, j, i)) {
                cell.style.backgroundColor = "blue";
            }
            else if (isEnemy === true) {
                cell.onclick = () => {
                    console.log(cell);
                    placeMissle(cell);
                };
            }

            row.appendChild(cell);

            count++;
        }
        table.appendChild(row);
    }
    if (isEnemy == false) {
        playerBoardElement.appendChild(table);
    }
    else{
        enemyBoardElement.appendChild(table);
    }
}

function placeMissle(cell) {
    var cellGameBoard = {
        "publicRoomId": sessionStorage["roomId"].toString(),
        "publicUserId": sessionStorage["userId"].toString(),
        "X": cell.dataset.x.toString(),
        "Y": cell.dataset.y.toString()
    };

    postRequest("Board/Attack", cellGameBoard, (response) => {
        console.log(response);
        let cellStatus = JSON.parse(response);
        if (cellStatus.isHit == true) {
            if (cellStatus.isShip == true) {
                cell.style.backgroundColor = "red";
            }
            else{
                cell.style.backgroundColor = "gray";
            }
        }
    });
}

function containsPosition(player, x, y) {
    for (var i = 0; i < player.length; i++) {
        if (parseInt(player[i].X) == x && parseInt(player[i].Y) == y) {
            return true;
        }
    }

    return false;
}