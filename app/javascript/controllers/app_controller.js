import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modalCustom"];

  openModal() {
    this.modalCustomController.openModal();
  }

  closeModal() {
    this.modalCustomController.closeModal();
  }

  get modalCustomController() {
    return this.application.getControllerForElementAndIdentifier(this.modalCustomTarget, "modal-custom");
  }
}
