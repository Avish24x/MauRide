import { Controller } from "@hotwired/stimulus";
import MapboxDirections from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions";

export default class extends Controller {
  static values = {
    apiKey: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    const urlParams = new URLSearchParams(window.location.search);
    const paramsQuery = urlParams.get("query");
    console.log(paramsQuery)

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [57.5522, -20.3000],
      zoom: 9.212,
      // interactive: false
    });

    // this.map.dragPan.disable();
    // this.map.scrollZoom.disable();
    // this.map.doubleClickZoom.disable();
    // this.map.touchZoomRotate.disable();

    // this.map.dragPan.disable();
    this.map.doubleClickZoom.disable();
    this.#addGeolocateControl();
    this.#loadNearbyRides();
    const myFunction = async () => {
      const position = await new Promise((resolve, reject) => {
        navigator.geolocation.getCurrentPosition(resolve, reject);
      });

      window.currentPosition = position.coords
      this.#loadNearbyRides(position.coords.latitude, position.coords.longitude, paramsQuery);
    };
    this.#fitMapToMarkers()
    myFunction()


    // this.map.on('load', () => {

    //   this.map.addSource('circleradius', {
    //     type: 'geojson',
    //     data: {
    //       type: 'Feature',
    //       geometry: {
    //         type: 'Point',
    //         coordinates: [currentPosition.longitude, currentPosition.latitude]
    //       }
    //     }
    //   });



    //   this.map.addLayer({
    //     id: 'circleradius',
    //     type: 'circle',
    //     source: 'circleradius',
    //     paint: {
    //       'circle-radius': 56,
    //       'circle-color': 'rgba(255, 0, 0, 0.5)' // Adjust the circle color and opacity as needed
    //     }
    //   })
    // })

  }

  #fitMapToMarkers() {

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

  #loadNearbyRides(latitude, longitude, query) {
    if (query !== null) {
      fetch(`/rides/nearby?query=${query}`)
        .then((response) => response.json())
        .then((data) => {
          // Process the nearby rides data as needed
          data.forEach((marker) => {
            const popup = new mapboxgl.Popup().setHTML(marker.info_window_html) // Add this
            new mapboxgl.Marker()
              .setLngLat([ marker.lng, marker.lat ])
              .setPopup(popup) // Add this
              .addTo(this.map)
          })
          const bounds = new mapboxgl.LngLatBounds()
          data.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
          this.map.fitBounds(bounds, { padding: 70, zoom: 9.212, duration: 1 })
        })
        .catch((error) => {
          // Handle the error
          console.error(error);
        });
    } else {
      console.log('Working')
      fetch(`/rides/nearby?latitude=${latitude}&longitude=${longitude}`)
        .then((response) => response.json())
        .then((data) => {
          // Process the nearby rides data as needed
          data.forEach((marker) => {
            const popup = new mapboxgl.Popup().setHTML(marker.info_window_html) // Add this
            new mapboxgl.Marker()
              .setLngLat([ marker.lng, marker.lat ])
              .setPopup(popup) // Add this
              .addTo(this.map)
          })
          const bounds = new mapboxgl.LngLatBounds()
          data.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
          this.map.fitBounds(bounds, { padding: 70, zoom: 9.212, duration: 1 })
        })
        .catch((error) => {
          // Handle the error
          console.error(error);
        });

    }
  }
}
