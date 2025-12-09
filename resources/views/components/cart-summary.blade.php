<div class="cart-summary">
    <div class="summary-item">
        <label>Total Price:</label>
        <span id="total-price">${{ number_format($total, 2) }}</span>
    </div>
    @if($cartItems->isNotEmpty())
    <div class="summary-item">
        <form action="{{ route('order.store') }}" method="POST">
            @csrf
             <button class="btn checkout-btn">Place Order</button>
        </form>
    </div>
    @endif
</div>
