<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;

class OrderController extends Controller
{
    public function index()
    {
        $orders = auth()->user()->orders()->latest()->paginate(2);
        return view('orders.index', compact('orders'));
    }

    public function show(Order $order)
    {
        $order->load('orderItems.product');

        return view('orders.show', compact('order'));
    }

    public function store()
    {
        $cart = Cart::where('user_id', auth()->id())
                    ->with('cartItems.product')
                    ->first();

        if (!$cart || $cart->cartItems->isEmpty()) {
            return back()->with('error', 'Your cart is empty.');
        }

        $total = 0;
        foreach ($cart->cartItems as $item) {
            $total += $item->product->price * $item->quantity;
        }

        $order = Order::create([
            'user_id' => auth()->id(),
            'total' => $total,
            'status' => 'pending',
            'payment_status' => 'unpaid',
        ]);

        foreach ($cart->cartItems as $item) {
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $item->product_id,
                'quantity' => $item->quantity,
                'price' => $item->product->price,
            ]);
        }

        $cart->cartItems()->delete();

        $cart->delete();

        return redirect()->route('order', $order->id)
                         ->with('success', 'Order placed successfully!');
    }

}
