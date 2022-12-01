import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    markers: Array,
    mymarker: Object,
    apiKey: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/redvelvet511/clb2o2j12001e14nulkioz1sn"
    });

    this.#addMyMarkerToMap()
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.backgroundRepeat = "no-repeat"
      customMarker.style.width = "55px"
      customMarker.style.height = "55px"

      new mapboxgl.Marker(customMarker)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)
    })
  }

  #addMyMarkerToMap() {
    const marker = this.mymarkerValue
    const customMarker = document.createElement("div")
    customMarker.className = "marker"
    customMarker.style.backgroundImage = `url('${marker.image_url}')`
    customMarker.style.backgroundSize = "contain"
    customMarker.style.backgroundRepeat = "no-repeat"
    customMarker.style.width = "55px"
    customMarker.style.height = "55px"

    new mapboxgl.Marker(customMarker)
      .setLngLat([ marker.lng, marker.lat ])
      // .setPopup(popup)
      .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds =  new mapboxgl.LngLatBounds()
    this.markersValue.forEach((marker) => {
      bounds.extend([ marker.lng, marker.lat ])
    })
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 500 })
  }
}
