"use strict";

var $selectedGender = 0;

function loadGenderSelection() {
    $('#pills li').on('click', function () {
        $('#pills li').removeClass('active');

        var $this = $(this);
        $this.addClass('active');

        $selectedGender = $this.data('gender');

        console.log($(this).attr("data-gender"));

        filters["gender"] = parseInt($(this).attr("data-gender"));
        updateGenderValues();
    });
}