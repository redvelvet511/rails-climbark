import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="climb-photos"
export default class extends Controller {
  static targets = ["toggler", "details", "carousel", "innerCarousel"]

  connect() {
  }

  displayCarousel(event) {
    const index = Array.from(event.target.parentElement.children).indexOf(event.target)
    this.innerCarouselTarget.children[index].classList.add("active")
    this.detailsTarget.classList.add("d-none")
    this.carouselTarget.classList.remove("d-none")
    this.togglerTarget.classList.remove("d-none")
  }

  hideCarousel() {
    this.carouselTarget.classList.add("d-none")
    this.togglerTarget.classList.add("d-none")
    this.detailsTarget.classList.remove("d-none")
  }
}
