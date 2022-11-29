import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="icon-color"
export default class extends Controller {
  connect() {
  }

  const btn = document.getElementById('btn');

  btn.addEventListener('click', function onClick() {
    btn.style.color = 'white';
  });
}
