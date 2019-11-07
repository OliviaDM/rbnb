import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/satellite-streets-v11'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    // This is for the custom markers
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'cover';
    element.style.width = '56px';
    element.style.height = '44px';

    new mapboxgl.Marker(element)
    // Passed the element as an argument to the new marker -> custom markers
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  console.log(bounds);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken}));
  }
};

export { initMapbox };


const mapElement2 = document.getElementById('map2');

const buildMap2 = () => {
  mapboxgl.accessToken = mapElement2.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map2',
    style: 'mapbox://styles/mapbox/satellite-streets-v11'
  });
};

const addMarkersToMap2 = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    // This is for the custom markers
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'cover';
    element.style.width = '56px';
    element.style.height = '44px';

    new mapboxgl.Marker(element)
    // Passed the element as an argument to the new marker -> custom markers
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers2 = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  console.log(markers);
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  console.log(bounds);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox2 = () => {
  if (mapElement2) {
    const map2 = buildMap2();
    const markers2 = JSON.parse(mapElement2.dataset.markers);
    addMarkersToMap2(map2, markers2);
    fitMapToMarkers2(map2, markers2);
  }
};

export { initMapbox2 }
