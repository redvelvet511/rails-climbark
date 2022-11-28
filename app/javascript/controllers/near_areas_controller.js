import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="near-areas"
export default class extends Controller {
  connect() {
    // console.log("hello");
    navigator.geolocation.getCurrentPosition((loc) => {
      console.log(loc);
     })
    }
  }

  // dont need this anymore unless we use current location, then we make and AJAX request
