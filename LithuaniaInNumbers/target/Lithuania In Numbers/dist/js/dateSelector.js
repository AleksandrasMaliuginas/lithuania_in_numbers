"use strict";

var monthNames = ["JAN", "FEB", "MAR", "APR"
    , "MAY", "JUN", "JUL", "AUG"
    , "SEP", "OCT", "NOV", "DEC"
];

var $dateSelection =
    `
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title" id="selectDateTitle">Start Date</h4>
</div>

<div class="text-left title-selection-box dateSelector">
    <div class="col-md-12">
        <select style="width:49%" id="dateSelectorYear" size="6">
			<option selected>2009</option>
			<option>2010</option>
			<option>2011</option>
			<option>2012</option>
			<option>2013</option>
			<option>2014</option>
			<option>2015</option>
			<option>2016</option>
			<option>2017</option>
		</select>
        <select id='dateSelectorMonth' style="width:49%" size="6">
			<option selected value='0'>Janaury</option>
			<option value='1'>February</option>
			<option value='2'>March</option>
			<option value='3'>April</option>
			<option value='4'>May</option>
			<option value='5'>June</option>
			<option value='6'>July</option>
			<option value='7'>August</option>
			<option value='8'>September</option>
			<option value='9'>October</option>
			<option value='10'>November</option>
			<option value='11'>December</option>
		</select>
    </div>
</div>

<div class="modal-footer">
    <input id="applySelectedDateTo" type="hidden" vale="">
    <button type="button" onclick="selectMonth();" class="btn btn-success" data-dismiss="modal">Ok</button>
    <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
</div>
`;


function loadDateOnModal($applyResult, $title) {
    $('#ModalContentContainer').html($dateSelection);
    $('#selectDateTitle').html($title);
    $('#applySelectedDateTo').val($applyResult);

    var $date = $('#' + $applyResult).html();
    var $year = $date.substring(4);
    var $month = $date.substring(0, 3);

    var monthIndex = monthNames.indexOf($month);

    $('#dateSelectorYear').val($year);
    $('#dateSelectorMonth').val(monthIndex);
    $('#myModal').modal('show');

    setTimeout(function () {
        scrollToSelection('#dateSelectorYear');
        scrollToSelection('#dateSelectorMonth');
    }, 300);
}

function selectMonth() {
    var year = $('#dateSelectorYear').val();
    var month = $('#dateSelectorMonth').val();
    var $applyTo = $('#applySelectedDateTo').val();

    $('#' + $applyTo).html(monthNames[month] + ' ' + year);

    console.log(month, year, $applyTo);

    if ($applyTo == "dateToButtonPicker") {
        filters["date1"] = year + "-" + (parseInt(month) + 1) + "-" + "01";
    } else {
        filters["date2"] = year + "-" + (parseInt(month) + 1) + "-" + "01";
    }

    updateData();
}

function scrollToSelection($id) {
    var $s = $($id);
    var $op = $s.find(":selected");

    var optionTop = $op.offset().top;
    var selectTop = $s.offset().top;

    $s.scrollTop($s.scrollTop() + (optionTop - selectTop));
}