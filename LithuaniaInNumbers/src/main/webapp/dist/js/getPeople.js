"use strict";

var POPULATION_URL = "/people/population",
    MEDIAN_AGE_URL = "/people/medianAge";

function getPopulation() {
  $.ajax({
    url: POPULATION_URL,
		dataType: "json",
		data: {
      territoryId: filters.municipality
    },
		success: function (data) {
      // console.log(data);

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
