import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  openModal() {
    this.element.classList.remove("hidden");
    this.element.classList.add("block");
  }

  closeModal() {
    this.element.classList.add("hidden");
  }
}
