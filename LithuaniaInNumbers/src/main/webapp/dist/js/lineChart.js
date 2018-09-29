"use strict";

function lineChart(data, options) {
  google.charts.load('current', { 'packages':['corechart', 'motionchart'], callback: drawChart });

  function drawChart() {
    var dataObjKeys = Object.keys( data[data.length - 1] ),
        chart = new google.visualization.LineChart( $(options.section + ' .chart')[0] ),
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
      if(data[a.row]) {
        $(options.section + " ." + dataObjKeys[0]).text( data[a.row][dataObjKeys[0]] );
        for(var i = 1; i < options.googleChartData[0].length; i++) {
          $(options.section + " .card-custom:nth-child(" + i + ") .content").text( options.beautify(data[a.row][ dataObjKeys[i] ]) );
        }
      }
    });

    chart.draw(googleData, styleOptions);

    $(options.section + " ." + dataObjKeys[0]).text( data[data.length - 1][dataObjKeys[0]] );
    for(var i = 1; i < options.googleChartData[0].length; i++) {
      $(options.section + " .card-custom:nth-child(" + i + ") .content").text( options.beautify(data[data.length - 1][ dataObjKeys[i] ]) );
    }

    // var view = new google.visualization.DataView(googleData);
    // view.hideColumns([2, 3]);
    // chart.draw(view, options);
  }
}
