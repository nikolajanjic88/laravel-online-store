<div class="product-info">
    <h1>{{ $product->name }}</h1>
    <p class="price">${{ number_format($product->price, 2) }}</p>
    <p class="description">{{ $product->description }}</p>
    <form action="{{ route('cart.store') }}" method="POST">
        @csrf
        <input type="hidden" name="product_id" value="{{ $product->id }}">

        <div class="quantity-container">
            <button type="button" class="quantity-btn" onclick="decreaseQuantity()">-</button>
            <input type="number" id="quantity" name="quantity" value="1" min="1" max="99">
            <button type="button" class="quantity-btn" onclick="increaseQuantity()">+</button>
        </div>
        <button class="btn">Add to Cart</button>
    </form>
</div>
