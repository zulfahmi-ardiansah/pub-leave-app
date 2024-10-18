<script src="{{ asset('/assets/libs/toastr/toastr.min.js') }}"></script>
<script src="{{ asset('/assets/js/tabler.min.js') }}"></script>
<script src="{{ asset('/assets/js/script.js') }}"></script>

@if(session()->has('error'))
    <script>
        toastr["error"]("{{ session()->get('error') }}", "Kesalahan")
    </script>
@endif
@if(session()->has('success'))
    <script>
        toastr["success"]("{{ session()->get('success') }}", "Pemberitahuan")
    </script>
@endif