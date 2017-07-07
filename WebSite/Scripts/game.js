var boardElement;
var playerCells;

document.body.onload = () => {
    baseLoad();
    boardElement = document.getElementById("playerBoard");    
};

getRequestP("Board/UserBoard/" + sessionStorage["roomId"] + "/" + sessionStorage["userId"], (response) => { 
    console.log(response);
    playerCells = JSON.parse(response);
    generateBoard();
});

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
            cell.style.border = "solid";
            cell.style.padding = "15px";                        

            if(containsPosition(playerCells, j, i)){
                cell.style.backgroundColor = "blue";
            }

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

function containsPosition(player, x, y){
    for(var i = 0; i < player.length; i++){
        if(parseInt(player[i].X) == x && parseInt(player[i].Y) == y){
            return true;
        }
    }

    return false;
}