"use strict";

var POPULATION_URL = "/people/population",
    AVERAGE_AGE_URL = "/people/averageAge";

function getPopulation() {
  $.ajax({
    url: POPULATION_URL,
		dataType: "json",
		data: {
      territoryId: filters.municipality
    },
    success: function (data) {
      // console.log("Done people");
			console.log(data);

      var dataArray = [ ['Year', 'Total', 'Men', 'Women'] ];
      Array.from(data, row => dataArray.push( [ new Date(row.year, 0, 1), row.total, row.men, row.women] ) );

      google.charts.load('current', { 'packages':['corechart', 'motionchart'], callback: drawChart });
      function drawChart() {
        var googleData = google.visualization.arrayToDataTable(dataArray);
        googleData.sort([{column: 0}]);

        var options = {
          title: 'Population',
          legend: { position: 'bottom' },
          animation: {
            startup: true,
            duration: 1000,
            easing: 'inAndOut',
          },
          backgroundColor: 'transparent',
          focusTarget: 'category',
          legend: { position: 'bottom' },
          tooltip: {
            trigger: 'none'
          },
          hAxis: {
            gridlines: {
              color: 'transparent',
              count: -1
            }
          },
          vAxis: {
            format: 'short',
            minValue: 0
          }
        };

        var chart = new google.visualization.LineChart(document.getElementById('populationChart'));

        google.visualization.events.addListener(chart, 'onmouseover', selectHandler);
        function selectHandler(a) {
          $("#population .year").text(data[a.row].year);
          $("#population .card-custom:nth-child(1) .content").text(toStr(data[a.row].total));
          $("#population .card-custom:nth-child(2) .content").text(toStr(data[a.row].men));
          $("#population .card-custom:nth-child(3) .content").text(toStr(data[a.row].women));
        }

        chart.draw(googleData, options);

        $("#population .year").text(data[data.length - 1].year);
        $("#population .card-custom:nth-child(1) .content").text(toStr(data[data.length - 1].total));
        $("#population .card-custom:nth-child(2) .content").text(toStr(data[data.length - 1].men));
        $("#population .card-custom:nth-child(3) .content").text(toStr(data[data.length - 1].women));


        // var view = new google.visualization.DataView(googleData);
        // view.hideColumns([2, 3]);
        // chart.draw(view, options);
      }
		}
	});
}


function getAverageAge() {
  $.ajax({
    url: AVERAGE_AGE_URL,
		dataType: "json",
		data: {
      territoryId: filters.municipality
    },
    success: function (data) {
      // console.log("Done people");
			console.log(data);

      var dataArray = [ ['Year', 'Total', 'Men', 'Women'] ];
      Array.from(data, row => dataArray.push( [ new Date(row.year, 0, 1), row.total, row.men, row.women] ) );

      google.charts.load('current', { 'packages':['corechart', 'motionchart'], callback: drawChart });
      function drawChart() {
        var googleData = google.visualization.arrayToDataTable(dataArray);
        googleData.sort([{column: 0}]);

        var options = {
          title: 'Average age',
          legend: { position: 'bottom' },
          animation: {
            startup: true,
            duration: 1000,
            easing: 'inAndOut',
          },
          backgroundColor: 'transparent',
          focusTarget: 'category',
          legend: { position: 'bottom' },
          tooltip: {
            trigger: 'none'
          },
          hAxis: {
            gridlines: {
              color: 'transparent',
              count: -1
            }
          },
          vAxis: {
            format: 'short',
            minValue: 0
          }
        };

        var chart = new google.visualization.LineChart(document.getElementById('averageAgeChart'));

        google.visualization.events.addListener(chart, 'onmouseover', selectHandler);
        function selectHandler(a) {
          $("#averageAge .year").text(data[a.row].year);
          $("#averageAge .card-custom:nth-child(1) .content").text(data[a.row].total.toFixed(2));
          $("#averageAge .card-custom:nth-child(2) .content").text(data[a.row].men.toFixed(2));
          $("#averageAge .card-custom:nth-child(3) .content").text(data[a.row].women.toFixed(2));
        }

        chart.draw(googleData, options);

        $("#averageAge .year").text(data[data.length - 1].year);
        $("#averageAge .card-custom:nth-child(1) .content").text(data[data.length - 1].total.toFixed(2));
        $("#averageAge .card-custom:nth-child(2) .content").text(data[data.length - 1].men.toFixed(2));
        $("#averageAge .card-custom:nth-child(3) .content").text(data[data.length - 1].women.toFixed(2));
      }
    }
	});
}
