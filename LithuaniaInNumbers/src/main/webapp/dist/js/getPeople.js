"use strict";

var POPULATION_URL = "/people/population";

function getPopulation() {
  $.ajax({
    url: POPULATION_URL,
		dataType: "json",
		data: {
      territoryId: 1
    },
		success: function (data) {
      console.log("Done people");
			console.log(data);
		}
	});
}
