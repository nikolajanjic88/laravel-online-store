<div class="auth-form {{ $type }}-form">
    <h2 class="auth-title">{{ ucfirst($type) }}</h2>

    <form action="{{ route($type) }}" method="POST">
        @csrf
        @if($type == 'register')
            <div class="input-group">
                <label for="register-name">Name</label>
                <input type="test" id="register-name" name="name" placeholder="Your Name" value="{{ old('name') }}">
                @error('name')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
        @endif

        <div class="input-group">
            <label for="{{ $type }}-email">Email</label>
            <input type="email" id="{{ $type }}-email" name="email" placeholder="Enter your email" value="{{ old('email') }}">
            @error('email')
                <div class="error-message">
                    {{ $message }}
                </div>
            @enderror
        </div>
        <div class="input-group">
            <label for="{{ $type }}-password">Password</label>
            <input type="password" id="{{ $type }}-password" name="password" placeholder="Enter your password">
            @error('password')
                <div class="error-message">
                    {{ $message }}
                </div>
            @enderror
        </div>

        @if($type == 'register')
            <div class="input-group">
                <label for="register-confirm-password">Confirm Password</label>
                <input type="password" id="register-confirm-password" name="password_confirmation" placeholder="Confirm your password">
            </div>
        @endif

        <button type="submit" class="btn">{{ ucfirst($type) }}</button>
        <p class="toggle-text">
            @if($type == 'login')
                Don't have an account? <a href="{{ route('register') }}">Register here</a>
            @else
                Already have an account? <a href="{{ route('login') }}">Login here</a>
            @endif
        </p>
    </form>
</div>
