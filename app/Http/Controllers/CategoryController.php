<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::latest()->get();

        return view('admin.categories.index', compact('categories'));
    }

    public function create()
    {
        $statusValues = $this->getStatusValues();

        return view('admin.categories.create', compact('statusValues'));
    }

    public function edit(Category $category)
    {

        $statusValues = $this->getStatusValues();

        return view('admin.categories.edit', compact('statusValues', 'category'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:255',
            'status' => 'required|in:active,inactive'
        ]);

         $slug = Str::slug($request->name, '-');

        Category::create([
            'name' => $request->name,
            'slug' => $slug,
            'status' => $request->status
        ]);

        return redirect()->route('categories.index')->with('success', 'Category created successfully!');
    }

    public function update(Request $request, Category $category)
    {
        $request->validate([
            'name' => 'required|max:255',
            'status' => 'required|in:active,inactive'
        ]);

        $slug = Str::slug($request->name, '-');

        $category->update([
            'name' => $request->name,
            'slug' => $slug,
            'status' => $request->status
        ]);

        return redirect()->route('categories.index')->with('success', 'Category updated successfully!');
    }


    public function destroy(Category $category)
    {
        $category->delete();

        return redirect()->route('categories.index')->with('success', 'Category deleted successfully!');
    }

    private function getStatusValues()
    {
        $enumValues = DB::select("SHOW COLUMNS FROM categories WHERE Field = 'status'");
        $enumValues = $enumValues[0]->Type;
        preg_match('/\((.*?)\)/', $enumValues, $matches);
        $statusValues = explode(',', $matches[1]);

        return array_map(function($value) {
            return trim($value, "'");
        }, $statusValues);
    }

}
