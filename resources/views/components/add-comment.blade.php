<div class="add-comment">
    <h2>Add a Comment</h2>
    @auth
    <form action="{{ route('comments.store', $product->id) }}" method="POST">
        @csrf
        <textarea name="content" placeholder="Write your comment..."></textarea>
        @error('content')
            <div class="error-message">{{ $message }}</div>
        @enderror
        <button type="submit" class="btn">Submit</button>
    </form>
    @else
        <p>Please <a href="{{ route('login') }}">login</a> to add a comment.</p>
    @endauth
</div>
