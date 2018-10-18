"use strict";

var filters = {
  municipality: 1, // 1 = Lithuania
  ageFrom: 12,
  ageTo: 45
};

$(document).ready(function() {
  loadMap();
  mapEventListener();

  updateData();
});

function updateData() {
  getPopulation();
  getAverageAge();
  getDensity();
  getPopulationRatio();
}
