@extends('layouts.app')

@section('content')

<div class="cart-page">
    <div class="cart-header">
        <h1>Your Cart</h1>
    </div>

    <x-cart-items :cartItems="$cartItems" />

    <x-cart-summary :cartItems="$cartItems" :total="$total" />
</div>

@endsection

<script src="{{ asset('js/cart.js') }}"></script>
