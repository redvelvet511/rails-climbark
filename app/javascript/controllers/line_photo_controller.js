import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="line-photo"
export default class extends Controller {
  static targets = ["details", "toggler"]

  connect() {
    this.noPhotoMessage = document.getElementById("no-photo-message")
  }

  displayPhoto() {
    this.detailsTarget.classList.add("d-none")
    this.togglerTarget.classList.remove("d-none")
    if (this.noPhotoMessage) {
      this.noPhotoMessage.classList.remove("d-none")
    }
  }

  hidePhoto() {
    this.togglerTarget.classList.add("d-none")
    this.detailsTarget.classList.remove("d-none")
    if (this.noPhotoMessage) {
      this.noPhotoMessage.classList.add("d-none")
    }
  }
}
