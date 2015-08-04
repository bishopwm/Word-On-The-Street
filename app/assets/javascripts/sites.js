
//Gets User Location, adds to Form//

$(function () {

	window.getLocation = function () {
	  console.log('Getting location...');
	  navigator.geolocation.getCurrentPosition(onLocation, onError, options);
	}


	var options = {
	  enableHighAccuracy: true,
	  timeout: 5000,
	  maximumAge: 0
	};

	function onLocation (position) {
	  var lat = position.coords.latitude;
	  var lon = position.coords.longitude;

	  console.log("Your posititon is " + lat + " latitude and " + lon + " longitude.");
	  window.localStorage.setItem('latitude', lat);
	  window.localStorage.setItem('longitude', lon);
	  addLocationValueToForm();
	}

	function onError(error) {
	  console.log("Getting location failed: " + error);
	}



	function addLocationValueToForm () {
	  document.getElementById('lat').value = window.localStorage.getItem("latitude");
	  document.getElementById('lon').value = window.localStorage.getItem("longitude");
	}

})










