<script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<script>
    alertify.set('notifier', 'position', 'top-center');
    alertify.set('notifier', 'delay', 5);
    alertify.set('theme', 'bootstrap');
</script>

@if(session('success'))
    <script>
        alertify.success('{{ session('success') }}');
    </script>
@endif

@if(session('error'))
    <script>
        alertify.error('{{ session('error') }}');
    </script>
@endif
