// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"


document.addEventListener('turbo:load', function() {
    flatpickr(".start_date", {
      enableTime: false,
      dateFormat: "Y-m-d",
    });
  });
  
