import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="faltpickr"
export default class extends Controller {
  connect() {
    flatpickr(".start-date", {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    })
  }
}
