toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-bottom-center",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "3000",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "slideDown",
    "hideMethod": "slideUp"
}

function showPassword(element) {
    element.querySelector('.icon-open').classList.remove('d-none');
    element.querySelector('.icon-close').classList.remove('d-none');

    if (element.parentElement.querySelector('input').type == 'password') {
        element.parentElement.querySelector('input').type = 'text';
        element.querySelector('.icon-open').classList.add('d-none');
    } else {
        element.parentElement.querySelector('input').type = 'password';
        element.querySelector('.icon-close').classList.add('d-none');
    }
}