document.addEventListener("turbo:load", () => {
  document.querySelectorAll('.delete-alertbox').forEach((form) => {
    form.addEventListener('submit', function(event) {
      event.preventDefault();
      const form = this;
      Swal.fire({
        title: 'Êtes-vous sûr ?',
        text: "Vous ne pourrez pas revenir en arrière !",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Oui, supprimer !',
        cancelButtonText: 'Annuler'
      }).then((result) => {
        if (result.isConfirmed) {
          form.submit();
        }
      });
    });
  });
});
