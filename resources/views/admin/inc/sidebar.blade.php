<div class="sidebar">
    <div class="logo">
        <h1>Admin Panel</h1>
    </div>
    <nav>
        <ul>
            <li><a href="{{ route('dashboard') }}" class="{{ request()->is('dashboard') ? 'active' : '' }}">Dashboard</a></li>
            <li><a href="{{ route('admin.users.index') }}" class="{{ request()->is('admin/users') ? 'active' : '' }}">Users</a></li>
            <li><a href="{{ route('admin.products.index') }}" class="{{ request()->is('admin/products*') ? 'active' : '' }}">Products</a></li>
            <li><a href="{{ route('categories.index') }}" class="{{ request()->is('categories*') ? 'active' : '' }}">Categories</a></li>
            <li><a href="{{ route('admin.orders.index') }}" class="{{ request()->is('admin/orders*') ? 'active' : '' }}">Orders</a></li>
            <li><a href="{{ route('home') }}">Back To Main Site</a></li>
        </ul>
    </nav>
</div>
