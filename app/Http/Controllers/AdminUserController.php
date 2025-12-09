<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AdminUserController extends Controller
{
    public function index()
    {
        $users = User::withSum(['orders as spent' => function ($q) {
            $q->where('payment_status', 'success');
        }], 'total')
                ->orderByDesc('spent')
                ->paginate(10);

        return view('admin.users.index', compact('users'));
    }
}
