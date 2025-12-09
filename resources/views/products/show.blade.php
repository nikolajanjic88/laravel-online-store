@extends('layouts.app')

@section('title', $product->name)

@section('content')
<section class="single-product-page">
    <div class="container">
        <div class="product-detail">
            <div class="product-image">
                <x-product-image :mainImage="$mainImage" :product="$product" />
                <x-image-gallery :product="$product" />
            </div>
            <x-product-info :product="$product" />
        </div>
        <x-comments :product="$product" />
        <x-add-comment :product="$product" />
    </div>
</section>

@endsection

<script src="{{ asset('js/gallery.js') }}"></script>
