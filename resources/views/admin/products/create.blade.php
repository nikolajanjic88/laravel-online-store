@extends('admin.layouts.admin')

@section('content')
    <x-admin.header>
        Insert New Product
    </x-admin.header>
    <div class="form-container">
        <form action="{{ route('admin.products.store') }}" method="POST" enctype="multipart/form-data" class="product-create">
            @csrf
            <div class="form-group">
                <label for="name">Product Name:</label>
                <input type="text" name="name" id="name" value="{{ old('name') }}">
                @error('name')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <label for="slug">Slug (optional):</label>
                <input type="text" name="slug" id="slug" value="{{ old('slug') }}">
                @error('slug')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea name="description" id="description">{{ old('description') }}</textarea>
                @error('description')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" name="price" id="price" step="0.01" value="{{ old('price') }}">
                @error('price')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <label for="categories">Categories (one or multiple):</label>
                <select name="categories[]" id="categories" class="form-control" multiple>
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}">
                            {{ $category->name }}
                        </option>
                    @endforeach
                </select>
                @error('categories')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <div class="file-upload-wrapper">
                    <label for="images">Upload Main Product Image:</label>
                    <input type="file" name="image" multiple>
                </div>
                @error('image')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <button type="submit" class="submit-button">Submit</button>
            </div>
        </form>
        <div class="form-group">
            <a href="{{ route('admin.products.index') }}" class="back-button">Back</a>
        </div>
    </div>
@endsection
