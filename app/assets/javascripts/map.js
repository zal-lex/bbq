ymaps.ready(init);
var myMap;

function init(){
  if (document.getElementById('map') !== null) {
    address = document.getElementById('map').getAttribute('data-address');
  } else {
    address = ''
  }

  myMap = new ymaps.Map("map", {
    center: [53.90233836680701,27.56163915837756],
    zoom: 10
  });

  myGeocoder = ymaps.geocode(address);

  myGeocoder.then(
    function (res) {
      coordinates = res.geoObjects.get(0).geometry.getCoordinates();

      myMap.geoObjects.add(
        new ymaps.Placemark(
          coordinates,
          {iconContent: address},
          {preset: 'islands#blueStretchyIcon'}
        )
      );

      myMap.setCenter(coordinates);
      myMap.setZoom(15);
    }, function (err) {
      alert('Ошибка при определении местоположения');
    }
  );
};
