<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\AdminUserController;
use App\Http\Controllers\AdminOrderController;
use App\Http\Controllers\AdminProductController;
use App\Http\Controllers\AdminDashboardController;

Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/dashboard', [AdminDashboardController::class, 'index'])
    ->middleware(['auth', 'admin'])
    ->name('dashboard');

Route::get('/admin/users', [AdminUserController::class, 'index'])->middleware(['auth', 'admin'])->name('admin.users.index');

Route::controller(AdminOrderController::class)->group(function() {
    Route::get('/admin/orders', 'index')->middleware(['admin', 'auth'])->name('admin.orders.index');
    Route::get('/admin/orders/{order}', 'show')->middleware(['admin', 'auth'])->name('admin.orders.show');
    Route::put('/admin/orders/{order}', 'update')->middleware(['admin', 'auth'])->name('admin.orders.update');
});

Route::controller(AdminProductController::class)->group(function() {
    Route::get('/admin/products', 'index')->middleware(['admin', 'auth'])->name('admin.products.index');
    Route::get('/admin/products/create', 'create')->middleware(['admin', 'auth'])->name('admin.products.create');
    Route::post('/admin/products', 'store')->middleware(['admin', 'auth'])->name('admin.products.store');
    Route::get('/admin/products/{product:slug}', 'show')->middleware(['admin', 'auth'])->name('admin.products.show');
    Route::get('/admin/products/{product:slug}/edit', 'edit')->middleware(['admin', 'auth'])->name('admin.products.edit');
    Route::put('/admin/products/{product}', 'update')->middleware(['admin', 'auth'])->name('admin.products.update');
    Route::delete('/admin/products/{product}', 'destroy')->middleware(['admin', 'auth'])->name('admin.products.destroy');
    Route::post('/admin/products/{product}/add-images', 'addImages')->middleware(['admin', 'auth'])->name('admin.products.addImages');
});

Route::controller(CategoryController::class)->group(function() {
    Route::get('/categories', 'index')->middleware(['auth', 'admin'])->name('categories.index');
    Route::get('/categories/create', 'create')->middleware(['auth', 'admin'])->name('categories.create');
    Route::post('/categories', 'store')->middleware(['auth', 'admin'])->name('categories.store');
    Route::get('/categories/{category:slug?}', 'edit')->name('categories.edit');
    Route::put('/categories/{category}', 'update')->name('categories.update');
    Route::delete('/categories/{category}', 'destroy')->name('categories.destroy');
});

Route::controller(AuthController::class)->group(function () {
    Route::get('/register', 'showRegisterForm')->middleware('guest')->name('register');
    Route::post('/register', 'register')->middleware('guest');
    Route::get('/login', 'showLoginForm')->middleware('guest')->name('login');
    Route::post('/login', 'login')->middleware('guest');
    Route::post('/logout', 'logout')->middleware('auth')->name('logout');
});

Route::controller(OrderController::class)->group(function() {
    Route::get('/orders', 'index')->middleware('auth')->name('orders.index');
    Route::get('/orders/{order}', 'show')->name('order')->middleware('auth')->can('view', 'order');;
    Route::post('/orders', 'store')->name('order.store')->middleware('auth');
});

Route::controller(CartController::class)->group(function () {
    Route::get('/cart', 'index')->middleware('auth')->name('cart.index');
    Route::post('/cart', 'store')->middleware('auth')->name('cart.store');
    Route::patch('/cart/update/{cartItem}', 'update')->middleware('auth')->name('cart.update');
    Route::delete('/cart/{cartItem}', 'destroy')->middleware('auth')->name('cart.remove');
});

Route::controller(ProductController::class)->group(function () {
    Route::get('/products/search/{categorySlug?}', 'search')->name('products.search');
    Route::get('/products/{category:slug?}', 'index')->name('products.index');
    Route::get('/{product:slug}', 'show')->name('products.show');
    Route::post('/comments/{product}', 'storeComment')->middleware('auth')->name('comments.store');
    Route::delete('/comments/{comment}', 'destroyComment')->middleware('auth')
                                                           ->can('delete', 'comment')
                                                           ->name('comments.destroy');
});

