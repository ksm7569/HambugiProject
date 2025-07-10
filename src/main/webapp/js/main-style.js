const cart = [];
const cartList = document.getElementById('cart-items');
const totalPriceEl = document.getElementById('total-price');

document.querySelectorAll('.add-to-cart').forEach(button => {
  button.addEventListener('click', () => {
    const name = button.getAttribute('data-name');
    const price = parseInt(button.getAttribute('data-price'));

    // 이미 있는 항목인지 확인
    const existing = cart.find(item => item.name === name);
    if (existing) {
      existing.qty += 1;
    } else {
      cart.push({ name, price, qty: 1 });
    }

    renderCart();
  });
});

function renderCart() {
  cartList.innerHTML = '';
  let total = 0;

  cart.forEach(item => {
    total += item.price * item.qty;
    const li = document.createElement('li');
    li.className = 'list-group-item d-flex justify-content-between align-items-center';
    li.innerHTML = `
      ${item.name} x ${item.qty}
      <span>₩${item.price * item.qty}</span>
    `;
    cartList.appendChild(li);
  });

  totalPriceEl.textContent = `₩${total}`;
}