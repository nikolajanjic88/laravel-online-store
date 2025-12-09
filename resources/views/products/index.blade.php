@extends('layouts.app')

@section('content')

<section class="product-page">
    <div class="container">
        <x-product-categories
            :categories="$categories"
            :selectedCategory="$selectedCategory"
        />
        <div class="product-cards" id="product-cards">
            @foreach($products as $product)
                <x-product-card :product="$product" />
            @endforeach
        </div>
        <div id="pagination-container">
            {!! $products->links('vendor.pagination.custom') !!}
        </div>
    </div>
</section>

<script>
    window.LaravelData = {
        searchRoute: "{{ route('products.search') }}",
        searchRouteBase: "{{ route('products.search', '') }}",
        paginationHtml: @json($products->links('vendor.pagination.custom')->render()),
        assetStorage: "{{ asset('storage') }}",
        cartStoreRoute: "{{ route('cart.store') }}"
    };
</script>

<script src="{{ asset('js/product-search.js') }}"></script>

@endsection
