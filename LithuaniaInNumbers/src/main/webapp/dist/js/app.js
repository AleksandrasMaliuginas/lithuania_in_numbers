"use strict";

$(document).ready(function() {
  loadMap();
  mapEventListener();

  updateData();

});

function updateData() {
  console.log("Upadete data");
  getPopulation();
  getAverageAge();
  getDensity();
}

function toStr(number) {
  var string = String(number),
      index = 0;
  for(var i = string.length; i >= 0; i--) {
    if(index % 3 === 0) {
      string = [string.slice(0, i), " ", string.slice(i)].join('');
    }
    index++;
  }

  return string;
}


var filters = {
  municipality: 1, // 1 is Lithuania
  // ageFrom: 12,
  // ageTo: 45
};

// =============================================================================

var genderData1 = {
    total: 0,
    men: 0,
    women: 0
};

var genderData2 = {
    total: 0,
    men: 0,
    women: 0
};

function updateData1() {

	// http://lithuanianumbersapp.azurewebsites.net/ people/totals?&municipality=1
    let TOTALS_URL = "/people/totals";

	$.ajax({
		dataType: "json",
		url: TOTALS_URL,
		data: {
			municipality: filters.municipality
		},
		success: function (data) {
			console.log(data);

			let totals = Array.from(data, e => {
				return { x: e.date, y: e.totalCount }
			});

			plot("population-chart", totals);
		}
	});
}

/**
	Old one
 */

function updateData2(onlyPercentage = false) {

    // http://lithuanianumbersapp.azurewebsites.net/people/ages?date=2014-01-01&municipality=1
    var AGES_URL = "/people/ages";
    // http://lithuanianumbersapp.azurewebsites.net/people/totals?date=2009-03-01&municipality=1
    var TOTALS_URL0 = "/people/totals_url";
    // http://lithuanianumbersapp.azurewebsites.net/people/percentage?date=2017-01-01&municipality=1&ageFrom=10&ageTo=50
    var PERCENTAGE_URL = "/people/percentage";

    var agesPromise1, agesPromise2, totalsPromise1, totalsPromise2, percentagePromise1, percentagePromise2;

    if (!onlyPercentage) {
        agesPromise1 = $.ajax({
            dataType: "json",
            url: AGES_URL,
            data: {
                date: filters.date1,
                municipality: filters.municipality
            },
            success: function (data) {
                $("#average-years-1").text(parseFloat(data.totalAverage).toFixed(1));
                $("#average-years-man-1").text(parseFloat(data.menAverage).toFixed(1));
                $("#average-years-woman-1").text(parseFloat(data.womenAverage).toFixed(1));
            }
        });

        agesPromise2 = $.ajax({
            dataType: "json",
            url: AGES_URL,
            data: {
                date: filters.date2,
                municipality: filters.municipality
            },
            success: function (data) {
                $("#average-years-2").text(parseFloat(data.totalAverage).toFixed(1));
                $("#average-years-man-2").text(parseFloat(data.menAverage).toFixed(1));
                $("#average-years-woman-2").text(parseFloat(data.womenAverage).toFixed(1));
            }
        });

        totalsPromise1 = $.ajax({
            dataType: "json",
            url: TOTALS_URL0,
            data: {
                date: filters.date1,
                municipality: filters.municipality
            },
            success: function (data) {
                $("#population-all-1").text(parseInt(data.totalCount));
                $("#population-man-1").text(parseInt(data.menCount));
                $("#population-woman-1").text(parseInt(data.womenCount));
            }
        });

        totalsPromise2 = $.ajax({
            dataType: "json",
            url: TOTALS_URL0,
            data: {
                date: filters.date2,
                municipality: filters.municipality
            },
            success: function (data) {
                $("#population-all-2").text(parseInt(data.totalCount));
                $("#population-man-2").text(parseInt(data.menCount));
                $("#population-woman-2").text(parseInt(data.womenCount));
            }
        });
    }

    percentagePromise1 = $.ajax({
        dataType: "json",
        url: PERCENTAGE_URL,
        data: {
            date: filters.date1,
            municipality: filters.municipality,
            ageFrom: filters.ageFrom,
            ageTo: filters.ageTo
        },
        success: function (data) {
            genderData1.total = data.totalPercentage;
            genderData1.men = data.menPercentage;
            genderData1.women = data.womenPercentage;
            updateGenderValues();
        }
    });

    percentagePromise2 = $.ajax({
        dataType: "json",
        url: PERCENTAGE_URL,
        data: {
            date: filters.date2,
            municipality: filters.municipality,
            ageFrom: filters.ageFrom,
            ageTo: filters.ageTo
        },
        success: function (data) {
            genderData2.total = data.totalPercentage;
            genderData2.men = data.menPercentage;
            genderData2.women = data.womenPercentage;
            updateGenderValues();
        }
    });

    var afterAllPromise = onlyPercentage
        ? $.when(percentagePromise1, percentagePromise2)
        : $.when(agesPromise1, agesPromise2, totalsPromise1, totalsPromise2, percentagePromise1, percentagePromise2);

    // load order is fucked up, so lambda works instead of plain calling the function
    afterAllPromise.then(() => {
        calculateDiffPopulation()
    });
}

function updateGenderValues() {

    var percentage1, percentage2;
    switch (filters["gender"]) {
        case 0:
            percentage1 = genderData1.total;
            percentage2 = genderData2.total;
            break;
        case 1:
            percentage1 = genderData1.men;
            percentage2 = genderData2.men;
            break;
        case 2:
            percentage1 = genderData1.women;
            percentage2 = genderData2.women;
            break;
        default:
            percentage1 = 0;
            percentage2 = 0;
            break;
    }

    $("#percentage-age-1").text((percentage1 * 100).toFixed(1) + "%");
    $("#percentage-age-2").text((percentage2 * 100).toFixed(1) + "%");
}
