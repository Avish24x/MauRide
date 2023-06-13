import { Controller } from "@hotwired/stimulus";
import MapboxDirections from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [57.5522, -20.3000],
      zoom: 9.212
    });

    this.directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken
    });

    this.map.addControl(
      this.directions,
      'top-left'
    );

    this.directions.setOrigin([this.markersValue[0].lng, this.markersValue[0].lat]);
    this.directions.setDestination([this.markersValue[1].lng, this.markersValue[1].lat]);

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.#addGeolocateControl();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  #addGeolocateControl() {
    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
      })
    );
  }
}
