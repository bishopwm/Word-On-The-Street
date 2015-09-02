
//Gets User Location, adds to Form//

$(function () {

	window.getLocation = function () {
	  console.log('Getting location...');
	  navigator.geolocation.getCurrentPosition(onLocation, onError, options);
	};


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
	};

	function onError(error) {
	  console.log("Getting location failed: " + error);
	  alert("Word on the Street failed to get your current location. Please ensure your location settings are turned to 'ON' and refresh your browser.")
	  location.reload(true);
	};



	function addLocationValueToForm () {
	  document.getElementById('lat').value = window.localStorage.getItem("latitude");
	  document.getElementById('lon').value = window.localStorage.getItem("longitude");
	  $('#submit').removeAttr('disabled');
	  $('#submit').empty();
	  $('#submit').append('<h4>Submit Search</h4>');
	};

});













