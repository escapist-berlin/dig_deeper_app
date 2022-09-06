import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-tracklist"
export default class extends Controller {
  static targets = ["tracklist"]

  connect() {
    // console.log(this.element)
    // console.log(this.tracklistTarget)
  }

  update(event) {
    event.preventDefault()

    console.log("UPDATING THE TRACKLIST!")

    fetch(this.tracklistTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.tracklistTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
