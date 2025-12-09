function debounce(func, delay) {
    let timeout;
    return function (...args) {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, args), delay);
    };
}

document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.getElementById('search');
    const paginationContainer = document.getElementById('pagination-container');
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    const productsList = document.getElementById('product-cards');

    if (!searchInput) return;

    const originalProductsHtml = productsList.innerHTML;

    function showLoading() {
        productsList.innerHTML = `
            <div class="loading-spinner">
                <div class="spinner"></div>
            </div>
        `;
    }

    function performSearch(query) {
        if (query.length < 1) {
            productsList.innerHTML = originalProductsHtml;
            paginationContainer.innerHTML = window.LaravelData.paginationHtml;
            return;
        }

        paginationContainer.innerHTML = "";
        showLoading();

        let categorySlug = document.querySelector('.category-link.active')?.dataset.category;

        let url = categorySlug && categorySlug !== 'all'
            ? `${window.LaravelData.searchRouteBase}/${categorySlug}?query=${query}`
            : `${window.LaravelData.searchRoute}?query=${query}`;

        fetch(url)
            .then(res => res.json())
            .then(data => {
                productsList.innerHTML = "";

                if (!data.products.length) {
                    productsList.innerHTML = `<p>No products found</p>`;
                    return;
                }

                data.products.forEach(product => {
                    const productUrl = `/${product.slug}`;
                    const imagePath = product.main_image
                        ? `${window.LaravelData.assetStorage}/${product.main_image.path}`
                        : 'default-image.jpg';

                    productsList.innerHTML += `
                        <div class="product-card">
                            <img src="${imagePath}" alt="${product.name}">
                            <a href="${productUrl}">
                                <h3>${product.name}</h3>
                            </a>
                            <p class="price">$${product.price}</p>

                            <form action="${window.LaravelData.cartStoreRoute}" method="POST">
                                <input type="hidden" name="_token" value="${csrfToken}">
                                <input type="hidden" name="product_id" value="${product.id}">
                                <input type="hidden" name="quantity" value="1">
                                <button class="btn">Add to Cart</button>
                            </form>
                        </div>
                    `;
                });
            })
            .catch(err => console.error('Error loading products:', err));
    }

    const debouncedSearch = debounce(() => {
        let query = searchInput.value.trim();
        performSearch(query);
    }, 300);

    searchInput.addEventListener('input', debouncedSearch);
});
