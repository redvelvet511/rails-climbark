import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="icon-color"
export default class extends Controller {
  connect() {
    switch (window.location.pathname) {
      case "/home":
        document.getElementById("footer-home").style.color = 'white'
        break
      case "/map":
        document.getElementById("footer-map").style.color = 'white'
        break
      case "/search":
        document.getElementById("footer-search").style.color = 'white'
        break
      case "/profile":
        document.getElementById("footer-profile").style.color = 'white'
        break
    }
  }
}
