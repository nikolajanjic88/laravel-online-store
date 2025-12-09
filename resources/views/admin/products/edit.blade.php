@extends('admin.layouts.admin')

@section('content')
    <x-admin.header>
        Edit Product
    </x-admin.header>
    <div class="form-container">
        <form action="{{ route('admin.products.update', $product->id) }}" method="POST" enctype="multipart/form-data" class="product-create">
            @csrf
            @method('PUT')
            <div class="form-group">
                <label for="name">Product Name:</label>
                <input type="text" name="name" id="name" value="{{ old('name', $product->name) }}">
                @error('name')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <label for="slug">Slug (optional):</label>
                <input type="text" name="slug" id="slug" value="{{ old('slug', $product->slug) }}"">
                @error('slug')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea name="description" id="description">{{ old('name', $product->description) }}</textarea>
                @error('description')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
             <div class="checkbox-group">
                <input type="checkbox" name="is_featured" id="is_featured" {{ $product->is_featured ? 'checked' : '' }}>
                <label for="is_featured">Featured</label>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" name="price" id="price" step="0.01" value="{{ old('price', $product->price) }}">
                @error('price')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <label for="categories">Kategorije</label>
                <select name="categories[]" id="categories" class="form-control" multiple>
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}"
                            {{ $product->categories->contains($category->id) ? 'selected' : '' }}>
                            {{ $category->name }}
                        </option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <div class="file-upload-wrapper">
                    <label for="images">Upload Main Product Image:</label>
                    <input type="file" name="image" multiple>
                    @if ($product->mainImage)
                        <img src="{{ Storage::url($product->mainImage->path) }}" alt="Main Image" width="100">
                    @endif
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
            <a href="{{ route('admin.products.show', $product->slug) }}" class="back-button">Back</a>
        </div>
    </div>
@endsection
