import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["buttonSubmit", "buttonReset"];

  submitStart(event) {
    this.handleButton(true);
  }

  submitEnd(event) {
    if (event.detail.success) {
      this.handleButton(true);
    } else {
      this.handleButton(false);
    }
  }

  reset() {
    this.element.reset();
    document.getElementById("import_draft").innerHTML = "";
    this.handleButton(false);
  }

  handleButton(isOff) {
    this.buttonSubmitTarget.disabled = isOff;
    this.buttonResetTarget.disabled = !isOff;
  }
}
