<tr class="cart-item" data-cart-item-id="{{ $cartItem->id }}">
    <td>
        <div class="cart-products">
            <img src="{{ asset('storage/' . $cartItem->product->mainImage->path ) }}"
                 alt="{{ $cartItem->product->name }}" class="product-image"/>
            <span>{{ $cartItem->product->name }}</span>
        </div>
    </td>
    <td class="product-price">${{ $cartItem->product->price * $cartItem->quantity }}</td>
    <td>
        <input type="number" value="{{ $cartItem->quantity }}" class="product-quantity"/>
    </td>
    <td>
        <form action="{{ route('cart.remove', $cartItem->id) }}" method="POST">
            @csrf
            @method('DELETE')
            <button class="remove-btn">X</button>
        </form>
    </td>
</tr>
