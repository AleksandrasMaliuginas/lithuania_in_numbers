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

      var dataArray = [ ['Year', 'Total', 'Men', 'Women'] ];
      Object.entries(data).map( ([key, value]) =>
        dataArray.push([new Date(key, 0, 1), value.total, value.men, value.women])
      );

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

      var dataArray = [ ['Year', 'Total', 'Men', 'Women'] ];
      Object.entries(data).map( ([key, value]) =>
        dataArray.push([new Date(key, 0, 1), value.total, value.men, value.women])
      );

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

      var dataArray = [ ['Year', 'Density'] ];
      Object.entries(data).map( ([key, value]) =>
        dataArray.push([new Date(key, 0, 1), value.density])
      );

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

function getPopulationRatio() {
  $.ajax({
    url: POPULATION_URL,
		dataType: 'json',
		data: {
      territoryId: filters.municipality
    },
    success: function(data) {

      var dataArray = [ ['Year', 'Total', 'Men', 'Women'] ];
      Object.entries(data).map( ([key, value]) =>
        dataArray.push([new Date(key, 0, 1), value.total, value.men, value.women])
      );

      lineChart(data, {
        title: 'Percentage of population by age',
        section: '#population-ratio',
        googleChartData: dataArray,
        beautify: function(val) {
          return splitInt(val);
        }
      });
		}
	});
}
