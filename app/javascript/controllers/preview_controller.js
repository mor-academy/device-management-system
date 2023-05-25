import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["fileInput", "imgPreview"];

  connect() {
    this.fileInputTarget.addEventListener("change", (e) => {
      let listImage = [...e.target.files].reduce((result, file) => {
        let src = URL.createObjectURL(file);
        return [...result, `<img src="${src}" class="w-20 mt-6 mb-2" />`];
      }, []);
      this.imgPreviewTarget.innerHTML = listImage.join("");
    });
  }
}
