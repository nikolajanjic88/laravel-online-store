<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class AdminOrderController extends Controller
{
    public function index(Request $request)
    {
        $sortOrder = $request->get('sort', 'asc');

        $orders = Order::orderBy('id', $sortOrder)->paginate(10);

        return view('admin.orders.index', compact('orders', 'sortOrder'));
    }

    public function show(Order $order)
    {
        return view('admin.orders.show', compact('order'));
    }

    public function update(Request $request, Order $order)
    {
        $request->validate([
            'status' => 'required|in:pending,completed,shipped',
            'payment_status' => 'required|in:unpaid,success'
        ]);

        $order->update([
            'status' => $request->status,
            'payment_status' => $request->payment_status
        ]);

        return redirect()->route('admin.orders.index')->with('success', 'Order updated successfully!');
    }
}
