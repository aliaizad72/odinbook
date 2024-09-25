import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="post"
export default class extends Controller {
  static targets = ["photo", "showlink", "hidelink"];

  connect() {}

  showfield() {
    this.photoTarget.classList.remove("hidden");
    this.showlinkTarget.classList.add("hidden");
    this.hidelinkTarget.classList.remove("hidden");
  }

  hidefield() {
    this.photoTarget.classList.add("hidden");
    this.showlinkTarget.classList.remove("hidden");
    this.hidelinkTarget.classList.add("hidden");
  }
}
