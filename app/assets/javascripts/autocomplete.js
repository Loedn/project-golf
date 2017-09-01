var search = document.querySelector('.autocomplete_input');
var autocomplete = new google.maps.places.Autocomplete(search, {});
google.maps.event.addDomListener(search, 'keydown', function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
  }
});
