<header class="navbar">
    <div class="container">
        <div class="logo">
            <h1>PumpaJ</h1>
        </div>
        <nav>
            <ul>
                <li><a href="{{ route('home') }}" class="{{ request()->is('/') ? 'active' : '' }}">Home</a></li>
                <li><a href="{{ route('products.index') }}" class="{{ request()->is('products*') ? 'active' : '' }}">Shop</a></li>
                @guest
                    <li><a href="{{ route('login') }}" class="{{ request()->is('login') ? 'active' : '' }}">Log in</a></li>
                    <li><a href="{{ route('register') }}" class="{{ request()->is('register') ? 'active' : '' }}">Register</a></li>
                @endguest
                @auth
                    <li><a href="{{ route('orders.index') }}" class="{{ request()->is('orders') ? 'active' : '' }}">My  Orders</a></li>
                    <li>
                        <a href="{{ route('cart.index') }}" class="cart-link {{ request()->is('cart') ? 'active' : '' }}">
                            <i class="fas fa-shopping-cart cart-icon"></i>
                            <span id="cart-count" class="cart-count">{{ auth()->user()->cart ? auth()->user()->cart->itemCount() : 0 }}</span>
                        </a>
                    </li>
                     @if(auth()->user()->is_admin)
                        <li><a href="{{ route('dashboard') }}">Dashboard</a></li>
                    @endif
                    <li>
                        <form action="{{ route('logout') }}" method="POST">
                            @csrf
                            <button>Logout</button>
                        </form>
                    </li>
                @endauth
            </ul>
        </nav>
    </div>
</header>
