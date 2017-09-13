$(window).load(function() {
  loadScript();
});

var map;
var marker;
var offx;
var lngx;
var latx;

function createImage(url){
  var image = {
    url: url,
    // This marker is 32 pixels wide by 32 pixels tall.
    //size: new google.maps.Size(32, 32),
    size: new google.maps.Size(48, 48),
    // The origin for this image is 0,0.
    origin: new google.maps.Point(0,0),
    // The anchor for this image is the base of the flagpole at 0,32.
    //anchor: new google.maps.Point(0, 32)
    anchor: new google.maps.Point(24, 48)
  };
  return image;
}

function createMarker(coords, map, title){
  marker = new google.maps.Marker({
    position: coords,
    map: map,
    title: title
  });
}

function createCustomMarker(coords,map,offx){
  var popmsg = "ท่านสามารถเปลี่ยนตำแหน่งที่ตั้งของ " + offx + " โดยลาก icon ไปวาง ณ ตำแหน่ง\nที่ใกล้เคียงที่สุด"
  popmsg += "จากนั้น click ที่ icon อีกครั้งเพื่อยืนยันการ update ตำแหน่ง";

  marker = new google.maps.Marker({
    position: coords,
    map: map,
    title: popmsg,
    icon: createImage("/assets/green-icon.png"),
    draggable: true
  });
}

function createInfoWindow(text){
  var infowindow = new google.maps.InfoWindow({
    content: text
  });
  return infowindow;
}

function initialize() {
  var mapOptions = {
          center: new google.maps.LatLng(13.849998,100.52704),
          zoom: 10,
          mapTypeId: google.maps.MapTypeId.HYBRID,
          panControl: true,
          scaleControl: false,
          streetViewControl: true,
          overviewMapControl: true
        };

        // initializing map
        map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);

        // geocoding
        var geocoding  = new google.maps.Geocoder();
        $("#submit_button_geocoding").click(function(){
          codeAddress(geocoding);
        });
        $("#submit_button_reverse").click(function(){
          codeLatLng(geocoding);
        });

        latx = parseFloat(document.getElementById('admin_latitude').value);
        lngx = parseFloat(document.getElementById('admin_longitude').value);
        offx = document.getElementById('admin_offname').value;
        var poi = new google.maps.LatLng(latx, lngx);
        map.setCenter(poi);
        map.setZoom(18);
        createCustomMarker(poi, map, offx);

        // add infowindow when clicking on the simple marker marker


        google.maps.event.trigger(map, 'resize');

        google.maps.event.addListener(marker, 'click', function() {
          lngx = marker.getPosition().lng();
          latx = marker.getPosition().lat();
          var info = createInfoWindow("Office: " + offx + "<p/>" + "Longitude: <font color='red'>" + lngx + "</font><p/>Latitude: <font color='red'>" + latx + "</font>");
          setOfficeLngLat();
          info.open(map,marker);
        });

        google.maps.event.addListener(marker,'drag',function(event) {
          document.getElementById('admin_latitude').value = event.latLng.lat();
          document.getElementById('admin_longitude').value = event.latLng.lng();
        });

        google.maps.event.addListener(marker,'dragend',function(event) {
          document.getElementById('admin_latitude').value =event.latLng.lat();
          document.getElementById('admin_longitude').value =event.latLng.lng();
        });
}

var info;
function codeLatLng(geocoding){

  var input = $('#search_box_reverse').val();
  console.log(input);

  var latlngbounds = new google.maps.LatLngBounds();
  var listener;
  var regex = /([0-9])+\.([0-9])+\,([0-9])+\.([0-9])+/g;
  if(regex.test(input)) {
  var latLngStr = input.split(",",2);
  var lat = parseFloat(latLngStr[0]);
  var lng = parseFloat(latLngStr[1]);
  var latLng = new google.maps.LatLng(lat, lng);
  geocoding.geocode({'latLng': latLng}, function(results, status) {
     if (status == google.maps.GeocoderStatus.OK){
       if(results.length > 0){
         //map.setZoom(11);
         var marker;
         map.setCenter(results[1].geometry.location);
         var i;
        info = createInfoWindow("");
         for(i in results){
           latlngbounds.extend(results[i].geometry.location);
             marker = new google.maps.Marker({
             map: map,
             position: results[i].geometry.location
           });

          google.maps.event.addListener(marker, 'click', (function(marker,i) {
            return function() {
            info.setContent(results[i].formatted_address);
            info.open(map,marker);
            }
          })(marker,i));
        }

         map.fitBounds(latlngbounds);
         listener = google.maps.event.addListener(map, "idle", function() {
          if (map.getZoom() > 19) map.setZoom(19);
            google.maps.event.removeListener(listener);
          });
       }
     }
    else{
       alert("Geocoder failed due to: " + status);
     }
  });
  }else{
    alert("Wrong lat,lng format!");
  }
}

function codeAddress(geocoding){
  var address = $("#search_box_geocoding").val();
  if(address.length > 0){
    geocoding.geocode({'address': address},function(results, status){
      if(status == google.maps.GeocoderStatus.OK){
        map.setCenter(results[0].geometry.location);
        var marker  =  new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
        }else{
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }else{
    alert("Search field can't be blank");
  }
}

function loadScript() {
  console.log("map loading ...");
  var script = document.createElement('script');
  script.type = 'text/javascript';
  //'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBJYFdplGeKUUEmGZ-                                                      vL4ydiSZ09Khsa_o&sensor=false&libraries=drawing'
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    //'&v=3.14'+
    '&key=AIzaSyAAcZRWA7at7xCU3C1rCsmj1UxN3Fgbh8s'+
    '&libraries=drawing'+
    '&callback=initialize';
  script.async;
  script.defer;
  document.body.appendChild(script);
}

function setOfficeLngLat() {
  var off_lng = document.getElementById('admin_longitude');
  var off_lat = document.getElementById('admin_latitude');
  off_lng.value = lngx;
  off_lat.value = latx;
}
