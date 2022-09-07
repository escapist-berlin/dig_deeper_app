import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-tag"
export default class extends Controller {
  static targets = ["tag"]

  connect() {
    // console.log("Hello from TAG!")
  }

  update(event) {
    event.preventDefault()
    console.log("Updating the TAG!")

    const url = `${window.location.origin}${event.target.getAttribute("action")}`

    fetch(url, {
      method: "PATCH",
      // Passing manually a token manually / noirmally happens automaticly if we have a form for updating
      headers: {
        "Accept": "text/plain",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
    },
      body: {}
    })
      .then(response => response.text())
      .then((data) => {
        this.tagTarget.outerHTML = data;
      })
  }
}
