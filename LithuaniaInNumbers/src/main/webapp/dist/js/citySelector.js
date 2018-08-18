"use strict";

var selectedCityIndex = 0;

// HTML of city selection
var citySelection = `
<div class="modal-header">
	<button type="button" class="close"
	data-dismiss="modal">&times;</button>
	<h4 class="modal-title">Select Municipality</h4>
</div>
<div class="text-left title-selection-box">
	<div class="col-md-10" id="ManicipSelect">
		MUNICIP-LIST
	</div>
</div>

<div class="modal-footer">
	<button type="button" onclick="selectCity();" class="btn btn-success" data-dismiss="modal">Ok</button>
	<button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
</div>
`;

// HTML of city option
var municipOption = `
<div class="radio radio-primary">
	<label>
		<input name="ManicipOption" type="radio" value="MUNICIP-ID">
		<span class="circle"></span>
		<span class="check"></span>
		MUNICIP-NAME
	</label>
</div>
`;

// will get filled after AJAX call - this is needed as an 'all' option
var municipalities = [{ municipalityId: null, title: 'Lithuania' }];

function loadMunicipList() {
	$.ajax({
		dataType: "json",
		url: "/people/municipalities",
		data: {},
		success: function (data) {
			// for the default entry (all municipalities)
			var municipList = municipOption
				.replace('MUNICIP-ID', 0)
				.replace('MUNICIP-NAME', municipalities[0].title);

			for (var i = 0; i < data.length; i++) {
				municipalities.push({
					municipalityId: data[i].municipalityId,
					title: data[i].title
				});

				municipList += municipOption
					.replace('MUNICIP-ID', i + 1) // this ID marks the array's index, not the real id
					.replace('MUNICIP-NAME', municipalities[i + 1].title);
			}

			citySelection = citySelection
				.replace('MUNICIP-LIST', municipList);
		}
	});
}

function loadCityOnModal() {
	$('#ModalContentContainer').html(citySelection);
	$('#myModal').modal('show');
	$('#ManicipSelect [type="radio"]')[selectedCityIndex].checked = true;

	setTimeout(function () {
		scrollToSelectedManicip();
	}, 300);
}

function scrollToSelectedManicip() {
	var $s = $('.title-selection-box');
	var $op = $('#ManicipSelect :checked');

	var optionTop = $op.offset().top - 5;
	var selectTop = $s.offset().top;

	$s.scrollTop($s.scrollTop() + (optionTop - selectTop));
}

function selectCity() {
	selectedCityIndex = $('#ManicipSelect :checked').val();
	filters.municipality = municipalities[parseInt(selectedCityIndex)].municipalityId;

	$('#selectedManicipName').html(municipalities[selectedCityIndex].title);

	updateData();
}
