"use strict";

var POPULATION_URL = "/people/population",
    AVERAGE_AGE_URL = "/people/averageAge",
    DENSITY_URL = "/people/density";

function getPopulation() {
  $.ajax({
    url: POPULATION_URL,
		dataType: 'json',
		data: {
      territoryId: filters.municipality
    },
    success: function(data) {
			// console.log(data);
      var dataArray = [ ['Year', 'Total', 'Men', 'Women'] ];
      Array.from(data, row => dataArray.push( [ new Date(row.year, 0, 1), row.total, row.men, row.women] ) );

      lineChart(data, {
        title: 'Population',
        section: '#population',
        googleChartData: dataArray,
        beautify: function(val) {
          return splitInt(val);
        }
      });
		}
	});
}

function getAverageAge() {
  $.ajax({
    url: AVERAGE_AGE_URL,
		dataType: 'json',
		data: {
      territoryId: filters.municipality
    },
    success: function (data) {
      // console.log(data);
      var dataArray = [ ['Year', 'Total', 'Men', 'Women'] ];
      Array.from(data, row => dataArray.push( [ new Date(row.year, 0, 1), row.total, row.men, row.women] ) );

      lineChart(data, {
        title: 'Average age',
        section: '#averageAge',
        googleChartData: dataArray,
        beautify: function(val) {
          return val.toFixed(2);
        }
      });
    }
	});
}

function getDensity() {
  $.ajax({
    url: DENSITY_URL,
		dataType: "json",
		data: {
      territoryId: filters.municipality
    },
    success: function (data) {
			// console.log(data);
      var dataArray = [ ['Year', 'Density'] ];
      Array.from(data, row => dataArray.push( [ new Date(row.year, 0, 1), row.density] ) );

      lineChart(data, {
        title: 'Density',
        section: '#density',
        googleChartData: dataArray,
        beautify: function(val) {
          return val.toFixed(1);
        }
      });
    }
	});
}
