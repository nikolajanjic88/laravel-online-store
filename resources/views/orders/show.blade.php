@extends('layouts.app')

@section('content')
<div class="order-page container">

    <x-order.header :order="$order" />

    <div class="order-content">

        <div class="order-items">
            @foreach ($order->orderItems as $item)
                <a href="{{ route('products.show', $item->product->slug) }}">
                    <x-order.item :item="$item" />
                </a>
            @endforeach
        </div>

        <x-order.summary :order="$order" />

    </div>
</div>
@endsection
