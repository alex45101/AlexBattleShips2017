function registerUser() {
    let user = {
        "username": usernameTextBox.value,
        "publicId": ""
    }

    postRequest("User/Register", user, (response) => {         
        user = JSON.parse(response);

        localStorage["username"] = user.username;
        localStorage["userId"] = user.publicId;

        console.log("User " + user.username + " with a public id of " + user.publicId + "was registered")

        window.location.href = "../Pages/RoomPage.html";
    });
}