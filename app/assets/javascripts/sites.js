
//Gets User Location, adds to Form//
$(function() {


	if ("geolocation" in navigator) {
	  getLocation();
	} else {
	  alert("Geolocation is not available")
	}

	function getLocation() {
	  console.log('Getting location...'); 
	  navigator.geolocation.getCurrentPosition(onLocation, onError, options);
	}



	var options = {
	  enableHighAccuracy: true,
	  timeout: 5000,
	  maximumAge: 0
	};

	function onLocation (position) {
	  console.log("Got it!");
	  var lat = position.coords.latitude;
	  var lon = position.coords.longitude;
	  console.log("Your posititon is " + lat + " latitude and " + lon + " longitude.");
	  addLocationValueToForm(lat, lon);
	}

	function onError(error) {
	  console.log("Getting location failed: " + error);
	}



	function addLocationValueToForm (lat, lon) {
	  document.getElementById('lat').value = lat;
	  document.getElementById('lon').value = lon;
	}

})










