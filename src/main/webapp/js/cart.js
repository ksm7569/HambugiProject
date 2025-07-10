document.addEventListener("DOMContentLoaded", () => {
  const tbody = document.getElementById("cart-table-body");

  // 장바구니 페이지(cart.jsp)일 경우만 실행
  if (tbody) {
    loadCartItems(); // ✅ 장바구니 목록 렌더링 실행
  }
});

// --------------------- cart.jsp 전용 함수 -------------------------

function updateItemTotal(row) {
  const priceText = row.querySelector('.item-price').innerText.replace(/[₩,원,]/g, '');
  const price = parseInt(priceText, 10);
  const quantity = parseInt(row.querySelector('.item-quantity').innerText);
  const total = price * quantity;
  row.querySelector('.item-total').innerText = `₩${total.toLocaleString()}`;
}

function updateCartTotal() {
  let total = 0;
  document.querySelectorAll('.item-total').forEach(td => {
    const value = td.innerText.replace(/[₩,원]/g, '');
    total += parseInt(value, 10);
  });
  document.getElementById('total-price').innerText = `₩${total.toLocaleString()}`;
}

function updateCartStorage() {
  const rows = document.querySelectorAll('#cart-table-body tr');
  const updated = [];
  rows.forEach(row => {
    updated.push({
      name: row.querySelector('.item-name').innerText,
      price: parseInt(row.querySelector('.item-price').innerText.replace(/[₩,원]/g, '')),
      quantity: parseInt(row.querySelector('.item-quantity').innerText)
    });
  });
  localStorage.setItem("cartItems", JSON.stringify(updated));
}

function removeItemFromStorage(name) {
  let cartItems = JSON.parse(localStorage.getItem("cartItems") || "[]");
  cartItems = cartItems.filter(item => item.name !== name);
  localStorage.setItem("cartItems", JSON.stringify(cartItems));
}

function attachCartEventListeners() {
  document.querySelectorAll('.btn-minus').forEach(btn => {
    btn.addEventListener('click', () => {
      const row = btn.closest('tr');
      const qtyEl = row.querySelector('.item-quantity');
      let qty = parseInt(qtyEl.innerText);
      if (qty > 1) {
        qtyEl.innerText = --qty;
        updateItemTotal(row);
        updateCartTotal();
        updateCartStorage();
      }
    });
  });

  document.querySelectorAll('.btn-plus').forEach(btn => {
    btn.addEventListener('click', () => {
      const row = btn.closest('tr');
      const qtyEl = row.querySelector('.item-quantity');
      let qty = parseInt(qtyEl.innerText);
      qtyEl.innerText = ++qty;
      updateItemTotal(row);
      updateCartTotal();
      updateCartStorage();
    });
  });

  document.querySelectorAll('.btn-delete').forEach(btn => {
    btn.addEventListener('click', () => {
      const row = btn.closest('tr');
      const name = row.querySelector('.item-name').innerText;
      row.remove();
      updateCartTotal();
      removeItemFromStorage(name);
    });
  });
}

function loadCartItems() {
  const cartItems = JSON.parse(localStorage.getItem("cartItems") || "[]");
  const tbody = document.getElementById("cart-table-body");

console.log("📦 localStorage.cartItems =", cartItems);

cartItems.forEach(item => {
  console.log("🧩 item =", item); // 각각의 항목 구조 확인
  
  const price = parseInt(item.price, 10); // ✅ 숫자 변환

const row = document.createElement("tr");
row.innerHTML = `
  <td><span class="item-name">${item.name}</span></td>
  <td><span class="item-price">${item.price.toLocaleString()}원</span></td>
  <td>
    <button class="btn btn-sm btn-secondary btn-minus">-</button>
    <span class="item-quantity">${item.quantity}</span>
    <button class="btn btn-sm btn-secondary btn-plus">+</button>
  </td>
  <td><span class="item-total">₩${(item.price * item.quantity).toLocaleString()}</span></td>
  <td><button class="btn btn-sm btn-danger btn-delete">삭제</button></td>
`;

  tbody.appendChild(row);
});

  document.querySelectorAll('#cart-table-body tr').forEach(updateItemTotal);
  updateCartTotal();
  attachCartEventListeners();
}
