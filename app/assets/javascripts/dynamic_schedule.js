function valBetween(v, min, max) {
    return (Math.min(max, Math.max(min, v)));
};

$(document).on('turbolinks:load', function() {
  $("#day").on('inserted.bs.popover', function () {
    var curTime = new Date();
    var curSeconds = (curTime.getHours() * 60 * 60) + (curTime.getMinutes() * 60) + curTime.getSeconds();
    //curSeconds = 33120;
    curSeconds = valBetween(curSeconds, 27540, 51660);
    var percentOfDay = (curSeconds-27540) / (51660-27540);
    var topLoc = Math.floor($(".schedule").height() * percentOfDay);
    $("#movable").css("top", topLoc + "px");
  });
});
