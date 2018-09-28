"use strict";

var filters = {
  municipality: 1, // 1 is Lithuania
  // ageFrom: 12,
  // ageTo: 45
};

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

function splitInt(number) {
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
