function registerUser() {
    let user = {
        "username": usernameTextBox.value,
        "publicId": ""
    }

    postRequest("User/Register", user, (response) => {         
        user = JSON.parse(response);

        sessionStorage["username"] = user.username;
        sessionStorage["userId"] = user.publicId;

        console.log("User " + user.username + " with a public id of " + user.publicId + "was registered")
        sessionStorage["previousPage"] = "RoomPage";
        window.location.href = "../Pages/RoomPage.html";
    });
}