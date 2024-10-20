window.confirmStatus = false;

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

function userSelectorModal(element) {
    $(".preloader").fadeIn(300);

    $.ajax({
        url: window.baseUrl + '/ajax/user',
        success: function (response) {
            $('#modal-user-selector .modal-inner').html(response);
            $('#modal-user-selector').modal('show');
            $('#modal-user-selector').attr('data-user-selector-target-name', $(element).attr('data-user-selector-target-name'));
            $('#modal-user-selector').attr('data-user-selector-target-value', $(element).attr('data-user-selector-target-value'));
            $(".preloader").delay(500).fadeOut(300);
        },
        failed: function () {
            $(".preloader").delay(500).fadeOut(300);
        }
    });
}

function confirmationModal(element, type = 'primary') {
    window.confirmStatus = false;
    window.confirmElement = element;

    $('#modal-confirmation .modal-status').attr('class', 'modal-status bg-' + type);
    $('#modal-confirmation .modal-body svg').attr('class', 'icon mb-2 icon-lg text-' + type);
    $('#modal-confirmation [data-confirmation]').attr('class', 'btn w-100 btn-' + type);

    $('#modal-confirmation').modal('show');
}

$('#modal-confirmation [data-confirmation]').click(function () {
    window.confirmStatus = true;
    window.confirmElement.click();
});

$('form.validate').validate({
    submitHandler : function(form) {
        if (window.confirmStatus) {
            form.submit();
        } else {
            confirmationModal(form.querySelector('[type="submit"]'));
        }
    },
    errorPlacement: function (error, element) {
        if (element.parent().hasClass('input-group')) {
            error.insertAfter(element.parent());
        } else{
            error.insertAfter(element);
        }
    }
});

$('form.validate-delete').validate({
    submitHandler : function(form) {
        if (window.confirmStatus) {
            form.submit();
        } else {
            confirmationModal(form.querySelector('[type="submit"]'), 'danger');
        }
    }
});