<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    public function index(?Category $category = null)
    {
        $categories = Category::where('status', 'active')->get();

        $sort = request()->get('sort', 'low_high');

        if ($category) {
            $selectedCategory = $category;

            if ($sort == 'low_high') {
                $products = $category->products()
                    ->with('mainImage')
                    ->orderBy('price', 'asc')
                    ->paginate(6);
            } elseif ($sort == 'high_low') {
                $products = $category->products()
                    ->with('mainImage')
                    ->orderBy('price', 'desc')
                    ->paginate(6);
            } else {
                $products = $category->products()
                    ->with('mainImage')
                    ->paginate(6);
            }
        } else {
            $selectedCategory = null;

            if ($sort == 'low_high') {
                $products = Product::with('mainImage')
                    ->orderBy('price', 'asc')
                    ->paginate(6);
            } elseif ($sort == 'high_low') {
                $products = Product::with('mainImage')
                    ->orderBy('price', 'desc')
                    ->paginate(6);
            } else {
                $products = Product::with('mainImage')
                    ->paginate(6);
            }
        }

        return view('products.index', compact('products', 'categories', 'selectedCategory', 'sort'));
    }


    public function show(Product $product)
    {
        $mainImage = $product->mainImage;

        $images = $product->images()->where('is_main', false)->get();

        return view('products.show', compact('product', 'mainImage', 'images'));
    }

    public function storeComment(Request $request, Product $product)
    {
        $request->validate([
            'content' => 'required|string|max:500',
        ]);

        $comment = new Comment();
        $comment->content = $request->content;
        $comment->user_id = Auth::id();
        $comment->product_id = $product->id;
        $comment->save();

        return redirect()->route('products.show', $product->slug)
                         ->with('success', 'Your comment has been added!');

    }

    public function destroyComment(Comment $comment)
    {
        $comment->delete();
        return redirect()->back()
                         ->with('success', 'Comment deleted successfully.');
    }

    public function search(Request $request, $categorySlug = null)
    {
        $query = $request->input('query');

        if (empty($query)) {
            if ($categorySlug) {
                $category = Category::where('slug', $categorySlug)->firstOrFail();
                $products = $category->products()
                    ->with('mainImage')
                    ->orderBy('price', 'asc')
                    ->paginate(6);
            } else {
                $products = Product::with('mainImage')
                    ->orderBy('price', 'asc')
                    ->paginate(6);
            }

            return response()->json([
                'products' => $products->items(),
                'current_page' => $products->currentPage(),
                'last_page' => $products->lastPage(),
                'total' => $products->total(),
                'per_page' => $products->perPage(),
            ]);
        }

        if ($categorySlug) {
            $category = Category::where('slug', $categorySlug)->firstOrFail();
            $products = $category->products()
                ->where('name', 'like', '%' . $query . '%')
                ->with('mainImage')
                ->orderBy('price', 'asc')
                ->get();
        } else {
            $products = Product::where('name', 'like', '%' . $query . '%')
                ->with('mainImage')
                ->orderBy('price', 'asc')
                ->get();
        }

        return response()->json([
            'products' => $products,
        ]);
    }

}
