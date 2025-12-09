@extends('admin.layouts.admin')

@section('title', 'Admin Dashboard')

@section('content')
    <x-admin.header>
        Dashboard
    </x-admin.header>
    <!-- Dashboard Stats -->
    <div class="dashboard-stats">
        <x-admin.stat-card title="Total Users" :value="$userCount" />
        <x-admin.stat-card title="Orders Pending" :value="$orderCount" />
        <x-admin.stat-card title="Total Products" :value="$productCount" />
        <x-admin.stat-card title="Total Comments" :value="$commentCount" />
    </div>

    <!-- Recent Activities -->
    <x-admin.recent-activities :latestOrder="$latestOrder" :latestUser="$latestUser" :latestProduct="$latestProduct" />

    <!-- Performance Graph -->
    <section class="performance-graph">
        <h3>Sales Performance (Last 30 Days)</h3>
        <div class="graph-container">
            <canvas id="salesChart"></canvas>
        </div>
    </section>

    <!-- Last Login Info -->
    <section class="last-login">
        <h3>Last Login</h3>
        <p><strong>Admin</strong> logged in at <strong>{{ date('d.m.Y - H:i:s', strtotime($lastLogIn)) }}</strong></p>
    </section>
@endsection
