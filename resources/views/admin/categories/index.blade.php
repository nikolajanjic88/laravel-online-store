@extends('admin.layouts.admin')

@section('content')
    <x-admin.header>
        Categories
    </x-admin.header>
    <div class="categories-list">
        @foreach($categories as $category)
            <div class="category-card">
                <h3>
                    <a href="{{route('categories.edit', $category->slug)  }}" class="category-link">{{ $category->name }}</a>
                    @if ($category->status == 'inactive')
                        <span>({{ $category->status }})</span>
                    @endif
                </h3>
                <form action="{{ route('categories.destroy', $category->id) }}" method="POST" style="display:inline;">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="delete-button" onclick="return confirm('Are you sure you want to delete this category?');">Delete</button>
                </form>
            </div>
        @endforeach
        <div class="add-category-button">
            <a href="{{ route('categories.create') }}" class="insert-button">
                Insert New Category
            </a>
        </div>
    </div>
@endsection
