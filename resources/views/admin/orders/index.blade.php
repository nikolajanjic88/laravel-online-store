@extends('admin.layouts.admin')

@section('content')
    <x-admin.header>
        Orders
    </x-admin.header>
    <section class="orders-section">
            <div class="orders-header">
                <h3>All Orders</h3>
            </div>
            <table class="orders-table">
                <thead>
                    <tr>
                        <th>
                            <a href="{{ route('admin.orders.index', ['sort' => $sortOrder == 'asc' ? 'desc' : 'asc']) }}" class="order-id-header">
                                Order ID
                                @if($sortOrder == 'asc')
                                    <span>🔼</span>
                                @else
                                    <span>🔽</span>
                                @endif
                            </a>
                        </th>
                        <th>User ID</th>
                        <th>Status</th>
                        <th>Payment Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($orders as $order)
                        <tr>
                        <td>{{ $order->id }}</td>
                        <td>{{ $order->user_id }}</td>
                        <td class="{{ $order->status == 'pending' ? 'status-pending' : ($order->status == 'completed' ? 'status-completed' : 'status-shipped') }}">
                            {{ ucfirst($order->status) }}
                        </td>
                        <td class="{{ $order->payment_status == 'unpaid' ? 'payment-pending' : 'payment-success'}}">
                            {{ $order->payment_status }}
                        </td>
                        <td><a href="{{ route('admin.orders.show', $order->id) }}" class="edit-btn">Edit</a></td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="pagination-container" id="pagination-container">
                {{ $orders->links('vendor.pagination.custom') }}
            </div>
        </section>
@endsection
