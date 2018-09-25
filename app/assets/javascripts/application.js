// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
var fold = false;

function zoomIn(div) {
  document.getElementById('artist' + div).classList.toggle("zoom");
  document.getElementById('info' + div).classList.toggle("hidden");
  document.getElementById('browseart').classList.toggle("split");
  document.getElementById('paginate').classList.toggle("hidden");
}

function expandTopNav() {
  document.getElementById("expand").classList.toggle("expanded");
  if (fold == false) {
  document.getElementById("expandcollapse").innerHTML = "unfold_less";
  fold = true;
}
  else {
    document.getElementById("expandcollapse").innerHTML = "unfold_more";
    fold = false;
  }
}
