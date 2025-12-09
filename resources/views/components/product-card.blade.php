@props(['product'])

<div class="product-card">
    @if($product->mainImage)
        <img src="{{ asset('storage/' . $product->mainImage->path) }}" alt="{{ $product->name }}">
    @endif

    <a href="{{ route('products.show', $product->slug) }}">
        <h3>{{ $product->name }}</h3>
    </a>
    <p class="price">${{ $product->price }}</p>

    <form action="{{ route('cart.store') }}" method="POST">
        @csrf
        <input type="hidden" name="product_id" value="{{ $product->id }}">
        <input type="hidden" id="quantity" name="quantity" value="1">
        <button class="btn">Add to Cart</button>
    </form>
</div>
