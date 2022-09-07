import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-tracklist"
export default class extends Controller {
  static targets = ["tracklist"]

  connect() {
    // console.log(this.tracklistTarget.action)
    // console.log(this.tracklistTarget)
  }

  update(event) {
    event.preventDefault()

    // retrieving the url with track id

    const url = `${window.location.origin}${event.target.parentElement.getAttribute("href")}`

    fetch(url, {
      method: "PATCH",
      // Passing manually a token manually / noirmally happens automaticly if we have a form for updating
      headers: { "Accept": "text/plain",
                 "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: {}
    })
      .then(response => response.text())
      .then((data) => {
        this.tracklistTarget.outerHTML = data;
      })
 }
}
