<div class="image-gallery">
    @foreach($product->images as $image)
        <img
            class="thumbnail"
            src="{{ asset('storage/' . $image->path) }}"
            alt="{{ $product->name }}"
            data-large="{{ asset('storage/' . $image->path) }}"
            onclick="changeMainImage(this)"
        >
    @endforeach
</div>
