function ageSlider(targer) {
  $(target).slider({
    min: 0,
    max: 85,
    range: true,
    values: [12, 45],
    slide: function(event, ui) {
      
    }
  });
}
