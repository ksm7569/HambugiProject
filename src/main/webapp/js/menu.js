document.addEventListener("DOMContentLoaded", () => {
  // ✅ 메뉴 이미지 클릭 시 장바구니/취소 버튼 토글
  const menuImages = document.querySelectorAll(".menu-img");

  menuImages.forEach(img => {
    img.addEventListener("click", () => {
      const card = img.closest(".menu-card") || img.closest(".card"); // 일반/사이드 메뉴 모두 대응
      const actions = card.querySelector(".menu-actions");
      if (actions) {
        actions.style.display = actions.style.display === "block" ? "none" : "block";
      }
    });
  });

  // ✅ 메뉴에 있는 "장바구니 담기" 버튼 처리
  const addCartButtons = document.querySelectorAll(".btn-add-cart");

  if (!addCartButtons.length) return;

  addCartButtons.forEach((btn) => {
    btn.addEventListener("click", (e) => {
      e.preventDefault();

      if (!isLoggedIn || isLoggedIn === "false") {
        alert("로그인이 필요한 서비스입니다.");
        location.href = contextPath + "/views/login.jsp";
        return;
      }

      const card = btn.closest(".menu-card") || btn.closest(".card");
      const name = card.querySelector(".menu-name").innerText.trim();
      const priceText = card.querySelector(".menu-price").innerText.replace(/[₩,원]/g, "").trim();
      const price = parseInt(priceText, 10);

      let cartItems = JSON.parse(localStorage.getItem("cartItems") || "[]");

      const existingItem = cartItems.find(item => item.name === name);

      if (existingItem) {
        existingItem.quantity += 1;
      } else {
        cartItems.push({ name, price, quantity: 1 });
      }

      localStorage.setItem("cartItems", JSON.stringify(cartItems));
      alert(`${name} 장바구니에 담겼습니다.`);
    });
  });
});
