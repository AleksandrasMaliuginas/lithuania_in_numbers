"use strict";

var TERRITORIES_URL = "/territories";

function loadMap() {
  $("#lithuaniaMap").load("lithuaniaMap.svg");

  $.ajax({
    url: TERRITORIES_URL,
		dataType: "json",
		data: {},
		success: function (data) {
      console.log("Done");
			console.log(data);
		}
	});
}

function mapEventListener() {
  $("#lithuaniaMap").on("mouseover", "#County_Areas > path, #Mun_Areas > *", function() {
    $("#lithuaniaMap + .mapTooltip").addClass("visible");
    $("#lithuaniaMap + .mapTooltip .content").text( $(this).attr("name") );

    $(document).mousemove( function(e) {
      var positionX = e.pageX + 15,
          positionY = e.pageY - $("#lithuaniaMap + .mapTooltip").height()/2;

      $("#lithuaniaMap + .mapTooltip").css("left", positionX).css("top", positionY);
    });
  });

  $("#lithuaniaMap").on("mouseleave", "#County_Areas > path, #Mun_Areas > *", function() {
    $("#lithuaniaMap + .mapTooltip").removeClass("visible");
  });

  $("#lithuaniaMap").on("click", "#County_Areas > path", function() {
    $("#lithuaniaMap #County_Areas > path").show();
    $(this).hide();
  });
}
