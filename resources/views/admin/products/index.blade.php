@extends('admin.layouts.admin')

@section('content')
    <x-admin.header>
        Products
    </x-admin.header>

    <div class="product-search">
        <form action="{{ route('admin.products.index') }}" method="GET">
            @csrf
            <input type="text" name="search" placeholder="Search Products..." class="search-input" value="{{ request('search') }}">
            <button>Search</button>
        </form>
        <a href="{{ route('admin.products.create') }}" class="insert-button">
            Insert New Product
        </a>
    </div>
    <div class="product-list">
        @foreach($products as $product)
            <div class="product-card">
                @if($product->mainImage)
                    <img src="{{ asset('storage/' . optional($product->mainImage)->path ?? 'default-product.png') }}"
                         alt="{{ $product->name }}" class="product-image">
                @endif
                <h3>{{ $product->name }}</h3>
                <span class="product-price">${{ number_format($product->price, 2) }}</span>
                <a href="{{ route('admin.products.show', $product->slug) }}" class="product-link">View Details</a>
            </div>
        @endforeach
    </div>
    <x-pagination :products="$products" />
@endsection
