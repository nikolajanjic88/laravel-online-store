@if($product->comments->count() > 0)
    <div class="comments-section">
        <h2>Comments ({{ $product->comments->count() }})</h2>
        <ul class="comments-list">
            @foreach($product->comments as $comment)
                <li class="comment">
                    <div class="comment-header">
                        <strong>{{ $comment->user->name }}</strong>
                        <span class="comment-date">{{ $comment->created_at->format('M d, Y') }}</span>
                    </div>
                    <p>{{ $comment->content }}</p>

                    <div class="comment-actions">
                        @if(Auth::check() && (Auth::user()->id == $comment->user_id || Auth::user()->is_admin))
                            <form action="{{ route('comments.destroy', $comment->id) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="delete-button">Delete</button>
                            </form>
                        @endif
                    </div>
                </li>
            @endforeach
        </ul>
    </div>
@endif
