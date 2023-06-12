// import { Controller } from "@hotwired/stimulus";
// import MapboxDirections from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions";

// export default class extends Controller {
//   static values = {
//     apiKey: String,
//     markers: Array
//   };

//   connect() {
//     mapboxgl.accessToken = this.apiKeyValue;
//     let directions = new MapboxDirections({
//       accessToken: mapboxgl.accessToken,
//       unit: "metric",
//       profile: "mapbox/driving",
//       controls: { instructions: false }
//     });

//     this.map = new mapboxgl.Map({
//       container: this.element,
//       style: "mapbox://styles/mapbox/streets-v10",
//       center: [57.5522, -20.3000],
//       zoom: 9.212
//     });

//     this.map.addControl(directions, "top-left");

//     this.map.addControl(
//       new mapboxgl.GeolocateControl({
//         positionOptions: {
//           enableHighAccuracy: true
//         },
//         trackUserLocation: true,
//         showUserHeading: true,
//         showUserLocation: true,
//         fitBoundsOptions: { maxZoom: 15 }
//       })
//     );

//     this.addMarkersToMap(directions);
//     this.fitMapToMarkers();
//   }

//   addMarkersToMap(directions) {
//     this.markersValue.forEach((marker) => {
//       new mapboxgl.Marker()
//         .setLngLat([marker.lng, marker.lat])
//         .addTo(this.map);
//     });

//     navigator.geolocation.getCurrentPosition((position) => {
//       const { latitude, longitude } = position.coords;

//       if (this.map.loaded()) {
//         const origin = [longitude, latitude];
//         const destination = [
//           this.markersValue[0].lng,
//           this.markersValue[0].lat
//         ];
//         directions.setOrigin(origin);
//         directions.setDestination(destination);
//       } else {
//         this.map.on("load", () => {
//           const origin = [longitude, latitude];
//           const destination = [
//             this.markersValue[0].lng,
//             this.markersValue[0].lat
//           ];
//           directions.setOrigin(origin);
//           directions.setDestination(destination);
//         });
//       }

//       this.updateLiveLocation(directions, destination);
//     });
//   }

//   updateLiveLocation(directions, destination) {
//     navigator.geolocation.watchPosition((position) => {
//       const { latitude, longitude } = position.coords;
//       const driverLocation = [longitude, latitude];

//       const origin = driverLocation;
//       directions.setOrigin(origin);
//       directions.setDestination(destination);

//     });
//   }

//   fitMapToMarkers() {
//     const bounds = new mapboxgl.LngLatBounds();
//     this.markersValue.forEach((marker) =>
//       bounds.extend([marker.lng, marker.lat])
//     );
//     this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//   }
// }




// import { Controller } from "@hotwired/stimulus";
// import MapboxDirections from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions";

// export default class extends Controller {
//   static values = {
//     apiKey: String,
//     markers: Array
//   };

//   connect() {
//     mapboxgl.accessToken = this.apiKeyValue;
//     let directions = new MapboxDirections({
//       accessToken: mapboxgl.accessToken,
//       unit: "metric",
//       profile: "mapbox/driving",
//       controls: { instructions: false }
//     });

//     this.map = new mapboxgl.Map({
//       container: this.element,
//       style: "mapbox://styles/mapbox/streets-v10",
//       center: [57.5522, -20.3000],
//       zoom: 9.212
//     });

//     this.map.addControl(directions, "top-left");

//     this.map.addControl(
//       new mapboxgl.GeolocateControl({
//         positionOptions: {
//           enableHighAccuracy: true
//         },
//         trackUserLocation: true,
//         showUserHeading: true,
//         showUserLocation: true,
//         fitBoundsOptions: { maxZoom: 15 }
//       })
//     );

//     this.addMarkersToMap(directions);
//     this.fitMapToMarkers();
//   }

//   addMarkersToMap(directions) {
//     this.markersValue.forEach((marker) => {
//       new mapboxgl.Marker()
//         .setLngLat([marker.lng, marker.lat])
//         .addTo(this.map);
//     });

//     let liveLocationCircle;

//     navigator.geolocation.getCurrentPosition((position) => {
//       const { latitude, longitude } = position.coords;

//       if (this.map.loaded()) {
//         const origin = [longitude, latitude];
//         const destination = [
//           this.markersValue[0].lng,
//           this.markersValue[0].lat
//         ];
//         directions.setOrigin(origin);
//         directions.setDestination(destination);

//         liveLocationCircle = this.createLiveLocationCircle(origin);
//       } else {
//         this.map.on("load", () => {
//           const origin = [longitude, latitude];
//           const destination = [
//             this.markersValue[0].lng,
//             this.markersValue[0].lat
//           ];
//           directions.setOrigin(origin);
//           directions.setDestination(destination);

//           liveLocationCircle = this.createLiveLocationCircle(origin);
//         });
//       }

//       this.updateLiveLocation(directions, destination, liveLocationCircle);
//     });
//   }

//   createLiveLocationCircle(center) {
//     const radius = 50000; // Radius in meters

//     return new mapboxgl.Circle({
//       center,
//       radius,
//       fillColor: "#0074D9",
//       fillOpacity: 0.3,
//       strokeColor: "#0074D9",
//       strokeOpacity: 0.8,
//       strokeWidth: 2
//     }).addTo(this.map);
//   }

//   updateLiveLocation(directions, destination, liveLocationCircle) {
//     navigator.geolocation.watchPosition((position) => {
//       const { latitude, longitude } = position.coords;
//       const driverLocation = [longitude, latitude];

//       const origin = driverLocation;
//       directions.setOrigin(origin);
//       directions.setDestination(destination);

//       liveLocationCircle.setCenter(driverLocation);

//     });
//   }

//   fitMapToMarkers() {
//     const bounds = new mapboxgl.LngLatBounds();
//     this.markersValue.forEach((marker) =>
//       bounds.extend([marker.lng, marker.lat])
//     );
//     this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//   }
// }



import { Controller } from "@hotwired/stimulus";
import MapboxDirections from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    let directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken,
      unit: "metric",
      profile: "mapbox/driving",
      controls: { instructions: false }
    });

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [57.5522, -20.3000],
      zoom: 9.212
    });

    this.map.addControl(directions, "top-left");

    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true,
        showUserLocation: true,
        fitBoundsOptions: { maxZoom: 15 }
      })
    );

    this.addMarkersToMap(directions);
    this.fitMapToMarkers();
  }

  addMarkersToMap(directions) {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });

    let liveLocationMarker;
    let liveLocationCircle;

    navigator.geolocation.getCurrentPosition((position) => {
      const { latitude, longitude } = position.coords;

      if (this.map.loaded()) {
        const origin = [longitude, latitude];
        const destination = [
          this.markersValue[0].lng,
          this.markersValue[0].lat
        ];
        directions.setOrigin(origin);
        directions.setDestination(destination);

        liveLocationMarker = this.createLiveLocationMarker(origin);
        liveLocationCircle = this.createLiveLocationCircle(origin);
      } else {
        this.map.on("load", () => {
          const origin = [longitude, latitude];
          const destination = [
            this.markersValue[0].lng,
            this.markersValue[0].lat
          ];
          directions.setOrigin(origin);
          directions.setDestination(destination);

          liveLocationMarker = this.createLiveLocationMarker(origin);
          liveLocationCircle = this.createLiveLocationCircle(origin);
        });
      }

      this.updateLiveLocation(directions, destination, liveLocationMarker, liveLocationCircle);
    });
  }

  createLiveLocationMarker(location) {
    return new mapboxgl.Marker()
      .setLngLat(location)
      .addTo(this.map);
  }

  createLiveLocationCircle(center) {
    const radius = 1000; // Radius in meters

    return new mapboxgl.Circle({
      center,
      radius,
      fillColor: "#0074D9",
      fillOpacity: 0.3,
      strokeColor: "#0074D9",
      strokeOpacity: 0.8,
      strokeWidth: 2
    }).addTo(this.map);
  }

  updateLiveLocation(directions, destination, liveLocationMarker, liveLocationCircle) {
    navigator.geolocation.watchPosition((position) => {
      const { latitude, longitude } = position.coords;
      const driverLocation = [longitude, latitude];

      const origin = driverLocation;
      directions.setOrigin(origin);
      directions.setDestination(destination);

      liveLocationMarker.setLngLat(driverLocation);
      liveLocationCircle.setCenter(driverLocation);
    });
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) =>
      bounds.extend([marker.lng, marker.lat])
    );
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}




// import { Controller } from "@hotwired/stimulus";
// import MapboxDirections from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions";
// import mapboxgl from "mapbox-gl";
// import MapboxDraw from "@mapbox/mapbox-gl-draw";
// import turfCircle from "@turf/circle";

// export default class extends Controller {
//   static values = {
//     apiKey: String,
//     markers: Array
//   };

//   connect() {
//     mapboxgl.accessToken = this.apiKeyValue;
//     let directions = new MapboxDirections({
//       accessToken: mapboxgl.accessToken,
//       unit: "metric",
//       profile: "mapbox/driving",
//       controls: { instructions: false }
//     });

//     this.map = new mapboxgl.Map({
//       container: this.element,
//       style: "mapbox://styles/mapbox/streets-v10",
//       center: [57.5522, -20.3000],
//       zoom: 9.212
//     });

//     this.map.addControl(directions, "top-left");

//     this.map.addControl(
//       new mapboxgl.GeolocateControl({
//         positionOptions: {
//           enableHighAccuracy: true
//         },
//         trackUserLocation: true,
//         showUserHeading: true,
//         showUserLocation: true,
//         fitBoundsOptions: { maxZoom: 15 }
//       })
//     );

//     this.addMarkersToMap(directions);
//     this.fitMapToMarkers();
//   }

//   addMarkersToMap(directions) {
//     this.markersValue.forEach((marker) => {
//       new mapboxgl.Marker()
//         .setLngLat([marker.lng, marker.lat])
//         .addTo(this.map);
//     });

//     let liveLocationMarker;
//     let liveLocationCircle;

//     navigator.geolocation.getCurrentPosition((position) => {
//       const { latitude, longitude } = position.coords;

//       if (this.map.loaded()) {
//         const origin = [longitude, latitude];
//         const destination = [
//           this.markersValue[0].lng,
//           this.markersValue[0].lat
//         ];
//         directions.setOrigin(origin);
//         directions.setDestination(destination);

//         liveLocationMarker = this.createLiveLocationMarker(origin);
//         liveLocationCircle = this.createLiveLocationCircle(origin);
//       } else {
//         this.map.on("load", () => {
//           const origin = [longitude, latitude];
//           const destination = [
//             this.markersValue[0].lng,
//             this.markersValue[0].lat
//           ];
//           directions.setOrigin(origin);
//           directions.setDestination(destination);

//           liveLocationMarker = this.createLiveLocationMarker(origin);
//           liveLocationCircle = this.createLiveLocationCircle(origin);
//         });
//       }

//       this.updateLiveLocation(directions, destination, liveLocationMarker, liveLocationCircle);
//     });
//   }

//   createLiveLocationMarker(location) {
//     return new mapboxgl.Marker()
//       .setLngLat(location)
//       .addTo(this.map);
//   }

//   createLiveLocationCircle(center) {
//     const radius = 50000; // Radius in meters

//     const circle = turfCircle(center, radius, {
//       steps: 64,
//       units: "meters"
//     });

//     const circleLayer = {
//       id: "liveLocationCircle",
//       type: "fill",
//       source: {
//         type: "geojson",
//         data: circle
//       },
//       paint: {
//         "fill-color": "#0074D9",
//         "fill-opacity": 0.3
//       }
//     };

//     this.map.addLayer(circleLayer);

//     return circle;
//   }

//   updateLiveLocation(directions, destination, liveLocationMarker, liveLocationCircle) {
//     navigator.geolocation.watchPosition((position) => {
//       const { latitude, longitude } = position.coords;
//       const driverLocation = [longitude, latitude];

//       const origin = driverLocation;
//       directions.setOrigin(origin);
//       directions.setDestination(destination);

//       liveLocationMarker.setLngLat(driverLocation);

//       const updatedCircle = turfCircle(driverLocation, liveLocationCircle.properties.radius, {
//         steps: 64,
//         units: "meters"
//       });
//       this.map.getSource("liveLocationCircle").setData(updatedCircle);

//     });
//   }

//   fitMapToMarkers() {
//     const bounds = new mapboxgl.LngLatBounds();
//     this.markersValue.forEach((marker) =>
//       bounds.extend([marker.lng, marker.lat])
//     );
//     this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//   }
// }
