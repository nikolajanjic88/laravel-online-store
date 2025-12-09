@extends('admin.layouts.admin')

@section('content')
    <x-admin.header>
        Product Details
    </x-admin.header>

    <div class="product-detail-container">
        <div class="product-detail-left">
            <div class="product-thumbnails">
                <x-image-gallery :product="$product" class="thumbnail"/>
            </div>
            <div class="product-detail-image">
                <x-product-image :mainImage="$mainImage" :product="$product" />
            </div>
            <div class="upload-section">
                <h2>Upload New Image</h2>
                <form action="{{ route('admin.products.addImages', $product->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="file" name="images" accept="image/*" class="upload-input" />
                    @error('images')
                        <div class="error-message">
                            {{ $message }}
                        </div>
                    @enderror
                    <button type="submit" class="btn-upload">Upload Image</button>
                </form>
            </div>
        </div>
        <div class="product-detail-info">
            <h1>{{ $product->name }}</h1>
            <p class="product-description">{{ $product->description }}</p>
            <span class="product-price">${{ number_format($product->price, 2) }}</span>
            <div class="product-actions">
                <a href="{{ route('admin.products.edit', $product->slug) }}" class="btn-edit">Edit</a>
                <form action="{{ route('admin.products.destroy', $product->id) }}" method="POST">
                    @csrf
                    @method('DELETE')
                    <button class="btn-delete" onclick="return confirm('Are you sure?')">Delete</button>
                </form>
            </div>
        </div>
    </div>
@endsection

<script src="{{ asset('js/gallery.js') }}"></script>
