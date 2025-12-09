document.addEventListener('DOMContentLoaded', function() {
    const quantityInputs = document.querySelectorAll('.product-quantity');

    quantityInputs.forEach(input => {
        let debounceTimer;

        input.addEventListener('input', function() {
            let value = parseInt(input.value, 10);

            if (value > 10) {
                input.value = 10;
            } else if (value < 1 || !value) {
                input.value = 1;
            }

            clearTimeout(debounceTimer);

            debounceTimer = setTimeout(function() {
                updateCartQuantity(input);
            }, 500);
        });
    });

    function updateCartQuantity(input) {
        const cartItemId = input.closest('tr').dataset.cartItemId;
        const newQuantity = input.value;

        if (newQuantity < 1 || newQuantity > 10) {
            alert('Quantity must be between 1 and 10.');
            return;
        }

        fetch(`/cart/update/${cartItemId}`, {
            method: 'PATCH',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({ quantity: newQuantity })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                console.log('Updated price: ' + data.updatedPrice);
                console.log('Total price: ' + data.totalPrice);
                console.log('Cart count: ' + data.cartCount)

                const updatedPrice = data.updatedPrice;
                const totalPrice = data.totalPrice;
                const cartCount = data.cartCount;

                input.closest('tr').querySelector('.product-price').textContent = `$${updatedPrice}`;
                document.getElementById('total-price').textContent = `$${totalPrice}`;
                document.getElementById('cart-count').textContent = `${cartCount}`;
            } else {
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Something went wrong.');
        });
    }
});
