<div class="cart-items">
    @if($cartItems->isEmpty())
        <p>Your cart is empty.</p>
    @else
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($cartItems as $cartItem)
                    <x-cart-item :cartItem="$cartItem" />
                @endforeach
            </tbody>
        </table>
    @endif
</div>
