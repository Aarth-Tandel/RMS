function ValidDetails() {
    var Name;
    debugger;
    Name = document.getElementById("MainContent_TxtBxName").value;

    var PasswordCheck = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;

    if (Name == "") {
        $('.tooltipped').tooltip({ delay: 50 });
        Materialize.toast('Please enter all values', 4000)
        return false;
    }

}