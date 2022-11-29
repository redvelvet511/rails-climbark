import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="climb-photos"
export default class extends Controller {
  static targets = ["toggler", "details", "carousel", "innerCarousel"]

  connect() {
  }

  displayCarousel(event) {
    const index = event.target.dataset.index
    this.innerCarouselTarget.children[index].classList.add("active")
    this.detailsTarget.classList.add("d-none")
    this.carouselTarget.classList.remove("d-none")
    this.togglerTarget.classList.remove("d-none")
  }

  hideCarousel() {
    this.carouselTarget.classList.add("d-none")
    Array.from(this.innerCarouselTarget.children).forEach((image) => {
      image.classList.remove("active")
    })
    this.togglerTarget.classList.add("d-none")
    this.detailsTarget.classList.remove("d-none")
  }
}
