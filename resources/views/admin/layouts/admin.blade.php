<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="{{ asset('css/admin.css') }}">
    <!-- AlertifyJS CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css">
    <!-- AlertifyJS Default Theme -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>

    @include('admin.inc.sidebar')

    <div class="main-content">
        @yield('content')
    </div>

    <!-- AlertifyJS JS -->
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="script.js"></script>
    <script>
    // Script for Sales Performance Graph
    const ctx = document.getElementById('salesChart').getContext('2d');
    const salesChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6', 'Day 7'],
            datasets: [{
                label: 'Sales Performance',
                data: [1200, 1500, 2000, 1800, 1600, 1900, 2200],
                borderColor: '#ff6f61',
                backgroundColor: 'rgba(255, 111, 97, 0.2)',
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    </script>
</body>
</html>
