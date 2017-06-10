function ValidDetails() {
    debugger;
    var Username, Password, RePassword;
    Username = document.getElementById("MainContent_TxtUsername").value;
    Password = document.getElementById("MainContent_TxtPassword").value;
    RePassword = document.getElementById("MainContent_TxtRePasword").value;

    var PasswordCheck = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;

    if (Username == "" || Password == "" || RePassword == "") {
        $('.tooltipped').tooltip({ delay: 50 });
        Materialize.toast('Please enter all values', 4000)
        return false;
    }

    if (!MainContent_TxtPassword.value.match(PasswordCheck)) {
        $('.tooltipped').tooltip({ delay: 50 });
        Materialize.toast('8 to 15 long characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character', 4000)
        return false;
    }

    if (Password != RePassword) {
        $('.tooltipped').tooltip({ delay: 50 });
        Materialize.toast('Password Typed does not match the confimed passowrd', 4000)
        return false;
    }
}