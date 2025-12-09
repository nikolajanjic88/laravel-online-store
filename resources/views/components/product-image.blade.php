@if($mainImage)
    <img id="main-image" src="{{ asset('storage/' . $mainImage->path) }}" alt="{{ $product->name }}">
@else
    <p>No main image available.</p>
@endif
