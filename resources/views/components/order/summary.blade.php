@props(['order'])

<div class="order-summary">
    <h2>Order Summary</h2>

    <div class="summary-item">
        <span>Total Amount:</span>
        ${{ number_format($order->total, 2) }}
    </div>

    <div class="summary-item">
        <span>Status:</span>
        {{ ucfirst($order->status) }}
    </div>

    <div class="summary-item">
        <span>Payment:</span>
        {{ ucfirst($order->payment_status) }}
    </div>

</div>
