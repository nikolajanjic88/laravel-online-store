@extends('admin.layouts.admin')

@section('content')
    <x-admin.header>
        Edit Category
    </x-admin.header>
    <div class="form-container">
        <form action="{{ route('categories.update', $category->id ) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-group">
                <label for="name">Category Name</label>
                <input type="text" id="name" name="name" placeholder="Enter category name" value="{{ $category->name }}">
                @error('name')
                    <div class="error-message">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="form-group">
                <label for="status">Status</label>
                <select id="status" name="status" required>
                    @foreach($statusValues as $status)
                        <option value="{{ $status }}" {{ old('status') == $status ? 'selected' : '' }}>{{ ucfirst($status) }}</option>
                    @endforeach
                </select>
                @error('status')
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
            <a href="{{ route('categories.index') }}" class="back-button">Back</a>
        </div>
    </div>
@endsection
