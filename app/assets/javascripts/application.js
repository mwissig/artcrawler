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
function expandProfileTop() {
  document.getElementById("statement-grid").classList.toggle("statementGridExpandTop");
  document.getElementById("statement-grid").classList.remove("statementGridExpandBottom");
}

function expandProfileBottom() {
  document.getElementById("statement-grid").classList.toggle("statementGridExpandBottom");
  document.getElementById("statement-grid").classList.remove("statementGridExpandTop");
}


function expandTopNav() {
  document.getElementById("expand").classList.toggle("expanded");
  if (fold == false) {
    document.getElementById("expandcollapse").innerHTML = "unfold_less";
    fold = true;
  } else {
    document.getElementById("expandcollapse").innerHTML = "unfold_more";
    fold = false;
  }
}

var fold = false;

function zoomIn(div) {
  document.getElementById('artist' + div).classList.toggle("zoom");
  document.getElementById('info' + div).classList.toggle("hidden");
  document.getElementById('browseart').classList.toggle("split");
  document.getElementById('paginate').classList.toggle("hidden");
}
 //
 // ===============================


var mycoords = [];
var bigarr = [];
var finaldest = "Brooklyn, NY";

getLocation();

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    console.log("Geolocation is not supported by this browser.");
  }
}


function showPosition(position) {

  mycoords.push(position.coords.latitude);
  mycoords.push(position.coords.longitude);

  var directionDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;
  var mylat = mycoords[0];
  var mylng = mycoords[1];
  var origin = new google.maps.LatLng(mylat, mylng);
geocoderLoop();

}

function geocoderLoop(){
  for (i = 0; i < waypointsarray.length; i++) {
    var address = waypointswithid[i]['location'];
    var id = waypointswithid[i]['id'];
    geocodeAddress(address, id);

  }
}


var geocodeAddress = (address, id) => {
  axios.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&components=country:US&key=AIzaSyDJkEKxoYJlOJF2vWKpzp1rDfztV_BJ6_Y").then((response) => {

    var mylat = mycoords[0];
    var mylng = mycoords[1];
    var endlat = response.data.results[0].geometry.location.lat;
    var endlng = response.data.results[0].geometry.location.lng;
    calculateDistance(mylat,mylng,endlat,endlng, id);
  }).catch((error) => {
    console.log(error);
  });
}

var calculateDistance = (mylat,mylng,endlat,endlng,id,callback) => {
//   var calculate = new google.maps.DistanceMatrixService();
//   calculate.getDistanceMatrix({
//     origins: [{
//       lat: mylat,
//       lng: mylng
//     }],
//     destinations: [{
//       lat: endlat,
//       lng: endlng
//     }],
//     unitSystem: google.maps.UnitSystem.IMPERIAL,
//     travelMode: 'WALKING'
//   }, (response, status) => {
//     var miles = response.rows[0].elements[0].distance.text;
//     num = miles.slice(0, -3);
//     total = parseFloat(num);
//     arr = [total, id];
//     bigarr.push(arr);
//     bigarr.sort();
//     bigarr.reverse();
//     finaldest = bigarr[0][1];
//     console.log(finaldest);
// return finaldest;
// callback();
//   }
// );


  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var myOptions = {
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: city
    };
    map = new google.maps.Map(document.getElementById("map_canvas"),
{ mapTypeControl: false,
streetViewControl: false }
  );
    directionsDisplay.setMap(map);
    calcRoute();
  }

  function calcRoute() {

  var origin = new google.maps.LatLng(mylat, mylng);
    var request = {
      origin: origin,
      destination: origin,
      waypoints: waypointsarray,
      optimizeWaypoints: true,
      travelMode: google.maps.DirectionsTravelMode.WALKING
    };

    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
        var route = response.routes[0];

      } else {
        alert("directions response " + status);
        nextAddress--;
          delay++;
      }
    });
  }
    var directionsService = new google.maps.DirectionsService();
  var city = new google.maps.LatLng(clat, clng);

  initialize();
};

function openOnMap(i){
    google.maps.event.trigger(markers[i], 'click');
}
