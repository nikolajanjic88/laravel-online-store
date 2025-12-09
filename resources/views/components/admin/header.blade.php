<header>
    <h2>{{ $slot }}</h2>
    <div class="header-icons">
        <form action="{{ route('logout') }}" method="POST">
            @csrf
            <button class="logout-button">Logout</button>
        </form>
    </div>
</header>
