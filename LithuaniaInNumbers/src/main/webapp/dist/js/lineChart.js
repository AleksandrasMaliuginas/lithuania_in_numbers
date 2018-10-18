"use strict";

function lineChart(data, options) {
  google.charts.load('current', { 'packages':['corechart', 'motionchart'], callback: drawChart });

  function drawChart() {
    var xAxisVal = options.googleChartData[options.googleChartData.length - 1][0].getFullYear() ,
        columns = options.googleChartData[0];
    columns = columns.map(column => column.toLowerCase() );

    var chart = new google.visualization.LineChart( $(options.section + ' .chart')[0] ),
        googleData = google.visualization.arrayToDataTable(options.googleChartData),
        styleOptions = {
          title: options.title,
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
    // Sort by x axis
    googleData.sort([{column: 0}]);

    google.visualization.events.addListener(chart, 'onmouseover', function(a) {
      xAxisVal = options.googleChartData[a.row + 1][0].getFullYear();
      if(a.row + 1) {
        eventListener(xAxisVal, columns);
      }
    });

    chart.draw(googleData, styleOptions);

    eventListener(xAxisVal, columns);

    // var view = new google.visualization.DataView(googleData);
    // view.hideColumns([2, 3]);
    // chart.draw(view, options);
  }

  function eventListener(xAxisVal, columns) {
    $(options.section + " ." + columns[0]).text(xAxisVal);
    for(var i = 1; i < columns.length; i++) {
      $(options.section + " .card-custom:nth-child(" + i + ") .content")
        .text( options.beautify(data[xAxisVal][ columns[i] ]) );
    }
  }
}
