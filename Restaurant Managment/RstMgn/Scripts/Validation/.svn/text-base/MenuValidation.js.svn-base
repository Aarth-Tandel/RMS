function ValidMenuDetails() {
    var Dishname, Price, SelectedTypeVeg, SelectedTypeNonveg;
    debugger;
    Dishname = document.getElementById("MainContent_TxtDish").value;
    Price = document.getElementById("MainContent_TxtPrice").value;
    SelectedTypeNonveg = $('input[id*=MainContent_RadioBtnNonveg]').is(":checked");
    SelectedTypeVeg = $('input[id*=MainContent_RadioBtnVeg]').is(":checked");


    if (Dishname == "" || Price == "") {
        $('.tooltipped').tooltip({ delay: 50 });
        Materialize.toast('Please enter all values', 4000)
        return false;
    }

    if (SelectedTypeNonveg == false && SelectedTypeVeg == false ) {
        $('.tooltipped').tooltip({ delay: 50 });
        Materialize.toast('Please select a food type Yes or No', 4000)
        return false;
    }

    if (isNaN(Price)) {
        $('.tooltipped').tooltip({ delay: 50 });
        Materialize.toast('Please enter number greater than 0 in Price', 4000)
        return false;
    }

    if (parseInt("Price", 10) > 0) {
        $('.tooltipped').tooltip({ delay: 50 });
        Materialize.toast('Please enter number greater than 0 in Price', 4000)
        return false;
    }


    if (SelectedTypeNonveg == false && SelectedTypeVeg == false)
    {
        $('.tooltipped').tooltip({ delay: 50 });
        Materialize.toast('Please select food type Veg/NonVeg', 4000)
        return false;
    }
}