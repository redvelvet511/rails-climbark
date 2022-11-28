import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="list-lines"
export default class extends Controller {
  static targets = ["allTab", "recommendedTab", "list"]
  static values = { areaId: Number }

  connect() {
  }

  displayAll() {
    this.allTabTarget.classList.add("selected-tab")
    this.recommendedTabTarget.classList.remove("selected-tab")

    const url = `/areas/${this.areaIdValue}/lines`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data
      })
  }

  displayRecommended() {
    this.recommendedTabTarget.classList.add("selected-tab")
    this.allTabTarget.classList.remove("selected-tab")

    const url = `/areas/${this.areaIdValue}/suggested_lines`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data
      })
  }
}
