"use strict";

var updateAge;

function showValue(val) {
    $("#ageSliderValue").text(val[0] + " - " + val[1] + " yrs");

    if (updateAge != null) clearTimeout(updateAge);

    updateAge = setTimeout(function () {
        console.log(val[0], val[1]);

        filters["ageFrom"] = val[0];
        filters["ageTo"] = val[1];
        updateData(true);
    }, 200);
}



function loadAgeSlider() {
    $("#ageSliderTemp").slider({
        id: "mySliderAge",
        tooltip: 'hide',
        min: 0,
        max: 120,
        range: true,
        value: [12, 45]
    });

    $("#ageSliderTemp").on("slide", function (slideEvt) {
        showValue(slideEvt.value);
    });
}