@extends('layouts.app')

@section('content')
<div class="orders-page">
    <div class="order-header">
        <h1>Your Orders</h1>
    </div>

    @if($orders->isEmpty())
        <p class="no-orders">You have no orders yet.</p>
    @else
        @foreach($orders as $order)
            <div class="orders-container">
                <div class="order-info">
                    <span class="order-id">Order #{{ $order->id }}</span>
                    <span class="order-date">{{ $order->created_at->format('d M Y') }}</span>
                </div>
                <div class="order-container">
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
        @endforeach
    @endif
</div>
<div class="pagination-container" id="pagination-container">
    {{ $orders->links('vendor.pagination.custom') }}
</div>
@endsection
