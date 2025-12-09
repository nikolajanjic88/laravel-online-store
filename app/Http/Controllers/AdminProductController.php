<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\ProductImages;
use Illuminate\Support\Facades\Storage;

class AdminProductController extends Controller
{
    public function index(Request $request)
    {
        $query = Product::with('mainImage')->latest();

        if ($request->has('search') && $request->search != '') {
            $search = $request->search;
            $query->where('name', 'like', "%{$search}%");
        }

        $products = $query->paginate(16)->appends($request->all());

        return view('admin.products.index', compact('products'));
    }


    public function show(Product $product)
    {
        $mainImage = $product->mainImage;

        $images = $product->images()->where('is_main', false)->get();

        return view('admin.products.show', compact('product', 'mainImage', 'images'));
    }

    public function create()
    {
        $categories = Category::all();
        return view('admin.products.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string|max:255|unique:products,slug',
            'description' => 'required|string',
            'price' => 'required|numeric|min:0',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'categories' => 'required|array',
            'categories.*' => 'exists:categories,id'
        ]);

        $slug = Str::slug($request->name);

        $originalSlug = $slug;
        $counter = 1;
        while (Product::where('slug', $slug)->exists()) {
            $slug = $originalSlug . '-' . $counter;
            $counter++;
        }

        $product = Product::create([
            'name' => $request->name,
            'slug' => $slug,
            'description' => $request->description,
            'price' => $request->price,
        ]);

        $product->categories()->sync($request->categories);

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('products', 'public');
            $product->images()->create([
                'path' => $imagePath,
                'is_main' => true,
            ]);
        }

        return redirect()->route('admin.products.index')->with('success', 'Product created successfully!');
    }

    public function edit(Product $product)
    {
        $categories = Category::all();
        return view('admin.products.edit', compact('product', 'categories'));
    }

    public function update(Request $request, Product $product)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string|max:255|unique:products,slug,' . $product->id . '|regex:/^[a-z0-9-]+$/',
            'description' => 'required|string',
            'price' => 'required|numeric|min:0',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'categories' => 'required|array',
            'categories.*' => 'exists:categories,id',
        ]);

        $product->update([
            'name' => $request->name,
            'slug' => $request->slug ?: Str::slug($request->name),
            'description' => $request->description,
            'price' => $request->price,
            'is_featured' => $request->has('is_featured') ? true : false,
        ]);

        $product->categories()->sync($request->categories);

        if ($request->hasFile('image')) {
            $mainImage = $product->mainImage()->first();

            if ($mainImage) {
                if (Storage::disk('public')->exists($mainImage->path)) {
                    Storage::disk('public')->delete($mainImage->path);
                }

                $imagePath = $request->file('image')->store('products', 'public');
                $mainImage->update([
                    'path' => $imagePath
                ]);
            } else {
                $imagePath = $request->file('image')->store('products', 'public');
                $product->images()->create([
                    'path' => $imagePath,
                    'is_main' => true
                ]);
            }
        }

        return redirect()->route('admin.products.show', $product->slug)->with('success', 'Product updated successfully!');
    }


    public function destroy(Product $product)
    {
        foreach ($product->images as $image) {
            if (Storage::disk('public')->exists($image->path)) {
                Storage::disk('public')->delete($image->path);
            }
        }

        $product->delete();

        return redirect()->route('admin.products.index')
                         ->with('success', 'Product deleted successfully.');
    }

    public function addImages(Request $request, Product $product)
    {
        $request->validate([
            'images' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($request->hasFile('images')) {
                $imagePath = $request->images->store('products', 'public');
                ProductImages::create([
                    'product_id' => $product->id,
                    'path' => $imagePath,
                    'is_main' => false,
                ]);

        }

        return redirect()->back()->with('success', 'Slike su uspešno dodate!');
    }

}
