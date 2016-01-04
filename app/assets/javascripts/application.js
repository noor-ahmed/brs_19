// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require bootstrap
//= require turbolinks
//= require_tree .
//= require jquery_nested_form

var ready;
  ready = function() {
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
};

$(document).ready(ready);
$(document).on('page:load', ready);
