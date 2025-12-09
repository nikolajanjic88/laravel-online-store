@props(['item'])

<div class="order-card">
    <img
        src="{{ $item->product->mainImage
            ? asset('storage/' . $item->product->mainImage->path)
            : asset('images/no-image.png') }}"
        alt="{{ $item->product->name }}"
    >
    <div class="order-info">
        <h3>{{ $item->product->name }}</h3>
        <p>Quantity: <strong>{{ $item->quantity }}</strong></p>
        <p>Price: <span>${{ number_format($item->price, 2) }}</span></p>
        <p>Total: <span>${{ number_format($item->price * $item->quantity, 2) }}</span></p>
    </div>
</div>
