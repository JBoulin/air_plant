document.addEventListener("turbo:load", () => {
  document.querySelectorAll('form').forEach((form) => {
    form.addEventListener('submit', function(event) {
      event.preventDefault();
      const form = this;
      Swal.fire({
        title: 'Êtes-vous sûr ?',
        text: "Voulez-vous vraiment continuer ?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Oui, je confirme !',
        cancelButtonText: 'Retour'
      }).then((result) => {
        if (result.isConfirmed) {
          form.submit();
        }
      });
    });
  });
});
