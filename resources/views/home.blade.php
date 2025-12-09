@extends('layouts.app')

@section('content')
    <x-hero />

    <section id="featured" class="featured-products">
        <div class="container">
            <h2 class="section-title">Featured Products</h2>
            <div class="product-cards">
                @foreach($products as $product)
                    <x-product-card :product="$product" />
                @endforeach
            </div>
        </div>
    </section>
@endsection
