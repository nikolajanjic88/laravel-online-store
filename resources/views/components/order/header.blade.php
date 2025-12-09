<div class="order-header">
    <h1>Order #{{ $order->id }}</h1>
    <p>
        Status: <strong>{{ ucfirst($order->status) }}</strong> |
        Payment: <strong>{{ ucfirst($order->payment_status) }}</strong>
    </p>
</div>
