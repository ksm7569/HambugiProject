<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>장바구니</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/main-style.css" rel="stylesheet" />
  <style>
    body { font-family: 'Arial', sans-serif; background-color: #f8f9fa; }
    .cart-container { max-width: 900px; margin: 50px auto; background: white; padding: 30px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    .cart-title { font-weight: bold; font-size: 28px; color: #333; }
    .table th, .table td { vertical-align: middle; text-align: center; }
    .total-box { text-align: right; font-size: 18px; margin-top: 20px; }
    .btn-checkout { background-color: #ffc107; border: none; font-weight: bold; padding: 10px 30px; }
    .btn-checkout:hover { background-color: #e0a800; }
  </style>
</head>
<body>

<%@ include file="/includes/header.jsp" %>

<div class="container cart-container">
  <div class="text-center mb-4">
    <h2 class="cart-title">장바구니</h2>
    <p>담은 상품들을 확인하고 결제하세요.</p>
  </div>

  <table class="table table-bordered">
    <thead class="table-light">
      <tr>
        <th>상품명</th>
        <th>가격</th>
        <th>수량</th>
        <th>합계</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody id="cart-table-body"></tbody>
  </table>

  <div class="total-box">
    <strong>총 합계: <span id="total-price">₩0</span></strong>
  </div>

  <div class="text-end mt-3">
    <form id="checkout-form" action="<%= request.getContextPath() %>/checkout" method="post">
      <button type="submit" class="btn btn-checkout">결제하기</button>
    </form>
  </div>
</div>


<script>
  window.contextPath = "<%= request.getContextPath() %>";
  window.isLoggedIn = "<%= session.getAttribute("id") != null %>";
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>
<script>
  if (!isLoggedIn || isLoggedIn === "false") {
    localStorage.removeItem("cartItems");
  }

  document.addEventListener("DOMContentLoaded", function () {
    console.log("🔥 페이지 로딩 완료됨");

    const form = document.getElementById("checkout-form");
    const checkoutButton = form.querySelector("button[type=submit]");

    function appendHiddenInput(form, name, value) {
      const input = document.createElement("input");
      input.type = "hidden";
      input.name = name;
      input.value = value;
      form.appendChild(input);
    }

    function loadCartFromLocalStorage() {
      const cartItems = JSON.parse(localStorage.getItem("cartItems") || "[]");
      const tbody = document.getElementById("cart-table-body");
      tbody.innerHTML = "";

      let total = 0;

      cartItems.forEach((item, index) => {
        const itemTotal = item.price * item.quantity;
        total += itemTotal;

        const row = document.createElement("tr");
        row.innerHTML = `
          <td><span class="item-name">${item.name}</span></td>
          <td><span class="item-price">${item.price.toLocaleString()}원</span></td>
          <td><span class="item-quantity">${item.quantity}</span></td>
          <td><span class="item-total">${itemTotal.toLocaleString()}원</span></td>
          <td><button class="btn btn-danger btn-sm">삭제</button></td>
        `;
        tbody.appendChild(row);

        row.querySelector(".btn-danger").addEventListener("click", function () {
          let cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
          cartItems.splice(index, 1);
          localStorage.setItem("cartItems", JSON.stringify(cartItems));
          loadCartFromLocalStorage();
        });
      });

      document.getElementById("total-price").innerText = `₩${total.toLocaleString()}`;
    }


    checkoutButton.addEventListener("click", function (e) {
      e.preventDefault();
      
      const rows = document.querySelectorAll("#cart-table-body tr");
      
      console.log("🚀 결제 버튼 눌림");

      form.querySelectorAll("input[type=hidden]").forEach(input => input.remove());


      rows.forEach(row => {
    	  console.log("💬 row.innerHTML =", row.innerHTML);  // ✅ 이거 추가
        const name = row.querySelector(".item-name")?.innerText.trim() || "";
        const price = row.querySelector(".item-price")?.innerText.replace(/[₩,원]/g, '').trim() || "";
        const quantity = row.querySelector(".item-quantity")?.innerText.trim() || "";
        const total = row.querySelector(".item-total")?.innerText.replace(/[₩,원]/g, '').trim() || "";

        console.log("🧾 전송할 데이터", { name, price, quantity, total });

        appendHiddenInput(form, "itemName", name);
        appendHiddenInput(form, "price", price);
        appendHiddenInput(form, "quantity", quantity);
        appendHiddenInput(form, "total", total);
      });

      console.log("✅ hidden input 생성 완료, form submit 시작");

      setTimeout(() => {
        form.submit();
      }, 100);
    });
  });
</script>

</body>
</html>
