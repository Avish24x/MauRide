import { Controller } from "@hotwired/stimulus"
import MapboxDirections from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions";


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [57.5522, -20.3000],
      zoom: 9.212
    })

    this.map.addControl(
      new MapboxDirections({
      accessToken: mapboxgl.accessToken
      }),
      'top-left'
      );

        // this.#addMarkersToMap()
        // this.#fitMapToMarkers()
        // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        //                                     mapboxgl: mapboxgl }))
      }
  }
