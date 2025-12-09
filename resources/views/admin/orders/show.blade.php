@extends('admin.layouts.admin')

@section('content')
    <x-admin.header>
        Orders
    </x-admin.header>

    <section class="order-detail-section">
        <div class="order-detail-header">
            <h3>Order #{{ $order->id }}</h3>
        </div>
        <div class="order-detail-container">
            <div class="order-detail-left">
                <h4>Order Information</h4>
                <p><strong>Order ID:</strong> {{ $order->id }}</p>
                <p><strong>User ID:</strong> {{ $order->user_id }}</p>
                <p><strong>Created At:</strong> {{ $order->created_at }}</p>
            </div>
            <div class="order-detail-right">
                <h4>Status Update</h4>
                <form action="{{ route('admin.orders.update', $order->id) }}" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label for="status">Order Status</label>
                        <select id="status" name="status" class="status-select">
                            <option value="pending" @selected($order->status == 'pending')>Pending</option>
                            <option value="completed" @selected($order->status == 'completed')>Completed</option>
                            <option value="shipped" @selected($order->status == 'shipped')>Shipped</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="payment_status">Payment Status</label>
                        <select id="payment_status" name="payment_status" class="status-select">
                            <option value="unpaid" @selected($order->payment_status == 'unpaid')>Unpaid</option>
                            <option value="success" @selected($order->payment_status == 'success')>Success</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="submit-button">Update Order</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
@endsection
