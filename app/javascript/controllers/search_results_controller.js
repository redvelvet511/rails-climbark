import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-results"
export default class extends Controller {
  static targets = ["areasTab", "linesTab"]

  connect() {
    this.areaResults = document.getElementById("area-results")
    this.lineResults = document.getElementById("line-results")
  }

  displayAreas() {
    this.linesTabTarget.classList.remove("selected-tab")
    this.lineResults.classList.add("d-none")
    this.areasTabTarget.classList.add("selected-tab")
    this.areaResults.classList.remove("d-none")
  }

  displayLines() {
    this.areasTabTarget.classList.remove("selected-tab")
    this.areaResults.classList.add("d-none")
    this.linesTabTarget.classList.add("selected-tab")
    this.lineResults.classList.remove("d-none")
  }
}
