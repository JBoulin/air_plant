// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import Swal from 'sweetalert2'
import './form_confirmation_dialog';


Turbo.setConfirmMethod((message, element) => {
  return new Promise((resolve, reject) => {
    Swal.fire({
      title: "Attention!",
      text: message || "Êtes vous sur?",
      icon: 'warning',
      showCancelButton: true
    }).then((result) => {
      resolve(result.isConfirmed)
    }).catch(error => { reject(error) })
  })
})
