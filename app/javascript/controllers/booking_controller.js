import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["start_date", "end_date", "total_price", "info"];
  static values = { price: Number };

  connect() {
  }
  update() {
    const pricePerDay = parseInt(this.priceValue, 10);
    if (
      this.start_dateTarget.value !== "" &&
      this.end_dateTarget.value !== ""
    ) {
      const diffInMs =
        new Date(this.end_dateTarget.value) -
        new Date(this.start_dateTarget.value);
      const diffInDays = diffInMs / (1000 * 60 * 60 * 24);
        this.infoTarget.innerText = `${pricePerDay}€ x ${diffInDays} jours(s)`;
        this.total_priceTarget.innerHTML = `<span>€${(
          diffInDays * pricePerDay + 7
        ).toLocaleString()}</span> <small class='fw-light'>total</small> `;
    }
  }

}
