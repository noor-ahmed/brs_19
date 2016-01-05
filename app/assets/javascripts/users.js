$(document).ready(function(){
  $(".following").hide();
  $(".followers").hide();

  $("#show-following").click(function(){
    $(".following").show();
    $(".followers").hide();
  });

  $("#show-followers").click(function(){
    $(".following").hide();
    $(".followers").show();
  });

  $("#hide-followers").click(function(){
    $("#followers_div").fadeOut("fast");
  });

  $("#hide-following").click(function(){
    $("#following_div").fadeOut("fast");
  });
});