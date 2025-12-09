<div class="categories">
    <a href="{{ route('products.index') }}"
       class="category-link {{ is_null($selectedCategory) ? 'active' : '' }}"
       data-category="all">
       All
    </a>

    @foreach ($categories as $category)
        <a href="{{ route('products.index', ['category' => $category->slug, 'sort' => request('sort')]) }}"
           class="category-link {{ $selectedCategory && $selectedCategory->id === $category->id ? 'active' : '' }}"
           data-category="{{ $category->slug }}">
            {{ $category->name }}
        </a>
    @endforeach

    <input type="text" id="search" class="form-control" placeholder="Search product..." />
    <form action="{{ route('products.index', ['category' => $selectedCategory ? $selectedCategory->slug : null]) }}" method="GET">
        <div class="form-group">
            <select name="sort" class="form-control nav-select" onchange="this.form.submit()">
                <option value="low_high" {{ request('sort') == 'low_high' ? 'selected' : '' }}>
                    Sort by Price: Low to High
                </option>
                <option value="high_low" {{ request('sort') == 'high_low' ? 'selected' : '' }}>
                    Sort by Price: High to Low
                </option>
            </select>
        </div>
    </form>
</div>
