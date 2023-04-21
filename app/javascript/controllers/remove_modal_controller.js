import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.appController.closeModal();    
  }

  get appController() {
    return this.application.getControllerForElementAndIdentifier(document.getElementById("app"), "app");
  }
}
