"use strict";

var TERRITORIES_URL = "/territories";

function loadMap() {
  $("#lithuaniaMap").load("lithuaniaMap.svg", getTerritories);
  $(".territoryName").text("Lithuania");
}

function getTerritories() {
  $.ajax({
    url: TERRITORIES_URL,
    dataType: "json",
    data: {},
    success: function(data) {
      $.grep(data, function(row) {
        $("#County_Areas > path[name='" + row.title + "'], #Mun_Areas > *[name='" + row.title + "']")
          .attr("id", row.id)
          .attr("countyId", row.countyId);
      });
    }
  });
}

function mapEventListener() {
  $("#lithuaniaMap").on("mouseover", "#County_Areas > path, #Mun_Areas > *", function() {
    $("#lithuaniaMap + .mapTooltip").addClass("visible");
    $("#lithuaniaMap + .mapTooltip .content").text( $(this).attr("name") );

    $("#lithuaniaMap").mousemove( function(e) {
      var positionX = e.pageX + 20,
          positionY = e.pageY - $("#lithuaniaMap + .mapTooltip").height()*2;

      $("#lithuaniaMap + .mapTooltip").css("left", positionX).css("top", positionY);
    });
  });

  $("#lithuaniaMap").on("mouseleave", "#County_Areas > path, #Mun_Areas > *", function() {
    $("#lithuaniaMap + .mapTooltip").removeClass("visible");
  });


  $("#lithuaniaMap").on("click", "#County_Areas > path", function() {
    $("#lithuaniaMap #Mun_Areas > *").css("fill", "#FDFCEA");
    $("#lithuaniaMap #County_Areas > path").show();
    $(this).hide();

    $(".territoryName").text( territoryBeautifier($(this).attr("name")) );
    filters.municipality = $(this).attr("id");

    updateData();
  });

  $("#lithuaniaMap").on("click", "#Mun_Areas > *", function() {
    $("#lithuaniaMap #Mun_Areas > *").css("fill", "#FDFCEA");
    $(this).css("fill", "var(--green)");

    $(".territoryName").text( territoryBeautifier($(this).attr("name")) );
    filters.municipality = $(this).attr("id");

    updateData();
  });
}

 function territoryBeautifier(str) {
  return str//.replace(' county','')
    .replace('d.','district')
    .replace('c.','city')
    .replace('mun.','');
 }
