<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\CartItem;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index()
    {
        $user = auth()->user();

        $cart = Cart::where('user_id', $user->id)->first();

        $cartItems = $cart ?
                     $cart->cartItems()->with('product.mainImage')->get() :
                     collect();

        $total = $cartItems->sum(function ($cartItem) {
                 return $cartItem->product->price * $cartItem->quantity;
        });

        return view('cart', compact('cartItems', 'total'));
    }

    public function store(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1|max:10',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'You can have a maximum of 10 units of this product in your cart.');
        }

        $user = auth()->user();

        $cart = $user->cart()->firstOrCreate([]);

        $uniqueProductCount = $cart->cartItems()->distinct('product_id')->count();

        if ($uniqueProductCount >= 8) {
            return redirect()->back()->with('error', 'You can only have a maximum of 8 different products in your cart.');
        }

        $existingCartItem = $cart->cartItems()->where('product_id', $request->product_id)->first();

        if ($existingCartItem) {
            $newQuantity = $existingCartItem->quantity + $request->quantity;

            if ($newQuantity > 10) {
                return redirect()->back()->with('error', 'You can have a maximum of 10 units of this product in your cart.');
            }

            $existingCartItem->update(['quantity' => $newQuantity]);
        } else {
            $cart->cartItems()->create([
                'product_id' => $request->product_id,
                'quantity' => $request->quantity,
            ]);
        }

        return redirect()->back()->with('success', 'Item added to your cart!');
    }


    public function update(Request $request, CartItem $cartItem)
    {
        $user = auth()->user();

        if ($cartItem->cart->user_id !== $user->id) {
            return response()->json(['success' => false, 'message' => 'Unauthorized action.']);
        }

        $request->validate([
            'quantity' => 'required|integer|min:1|max:10'
        ]);

        $cartItem->update(['quantity' => $request->quantity]);

        $updatedPrice = $cartItem->product->price * $cartItem->quantity;
        $total = $cartItem->cart->cartItems->sum(function ($item) {
            return $item->product->price * $item->quantity;
        });
        $cartCount = auth()->user()->cart->itemCount();

        return response()->json([
            'success' => true,
            'updatedPrice' => number_format($updatedPrice, 2),
            'totalPrice' => number_format($total, 2),
            'cartCount' => $cartCount
        ]);
    }


    public function destroy(CartItem $cartItem)
    {
        $user = auth()->user();

        if ($cartItem->cart->user_id !== $user->id) {
            return redirect()->route('cart')->with('error', 'Unauthorized action');
        }

        $cartItem->delete();

        return redirect()->back()
                         ->with('success', 'Cart Item deleted successfully.');
    }
}
