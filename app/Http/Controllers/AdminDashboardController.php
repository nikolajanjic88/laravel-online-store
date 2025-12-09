<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\User;
use App\Models\Order;
use App\Models\Product;

class AdminDashboardController extends Controller
{
    public function index()
    {
        $userCount = User::where('is_admin', false)->count();

        $orderCount = Order::where('status', 'pending')->count();

        $productCount = Product::count();

        $commentCount = Comment::count();

        $admin = User::where('is_admin', 1)->first();

        $lastLogIn = $admin?->last_login_at;

        $latestUser = User::where('is_admin', false)->latest()->first();

        $latestProduct = Product::latest('updated_at')->first();

        $latestOrder = Order::where('status', 'pending')->latest()->first() ?? null;

        return view('admin.dashboard', compact('userCount', 'orderCount',
                                                            'productCount', 'lastLogIn', 'latestUser',
                                                            'latestProduct', 'latestOrder', 'commentCount'
                                                        ));
    }
}
