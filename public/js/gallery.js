function changeMainImage(element) {
    let mainImage = document.getElementById("main-image");
    mainImage.src = element.getAttribute("data-large");
}

function increaseQuantity() {
    let quantityInput = document.getElementById("quantity");
    if (parseInt(quantityInput.value) < parseInt(quantityInput.max)) {
        quantityInput.value = parseInt(quantityInput.value) + 1;
    }
}

function decreaseQuantity() {
    let quantityInput = document.getElementById("quantity");
    if (parseInt(quantityInput.value) > parseInt(quantityInput.min)) {
        quantityInput.value = parseInt(quantityInput.value) - 1;
    }
}
