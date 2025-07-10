<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if (session.getAttribute("id") != null) { %>
<script>
  sessionStorage.setItem("userLogin", "true");
</script>
<% } %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>메뉴 소개</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/main-style.css" rel="stylesheet" />
  <style>
    .menu-card {
      border: 1px solid #ddd;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
      background-color: #fff;
      transition: transform 0.2s;
    }
    .menu-card:hover {
      transform: scale(1.02);
    }
    .menu-img {
      width: 100%;
      height: 180px;
      object-fit: contain;
      max-height: 180px;
    }
    .menu-info {
      padding: 15px;
      text-align: center;
    }
    .menu-name {
      font-weight: bold;
      font-size: 1rem;
    }
    .menu-subtitle {
      color: #888;
      font-size: 0.9rem;
    }
    .badge-new {
      position: absolute;
      top: 10px;
      left: 10px;
      background-color: red;
      color: white;
      font-size: 0.7rem;
      padding: 4px 8px;
      border-radius: 5px;
    }
    .tab-btn {
      font-weight: bold;
      cursor: pointer;
      margin-right: 20px;
    }
    .tab-btn.active {
      color: red;
      border-bottom: 2px solid red;
    }
    .menu-section {
      margin-bottom: 50px;
    }
  </style>
</head>
<body>

<jsp:include page="/includes/header.jsp" />


<div class="container mt-5">
  <h3 class="fw-bold mb-4">🍔 메뉴 소개</h3>

  <div class="mb-4 text-center">
    <span id="tab-single" class="tab-btn active">단품메뉴</span>
    <span id="tab-set" class="tab-btn">세트메뉴</span>
  </div>

  <!-- 단품메뉴 영역 -->
  <div id="single-area" class="menu-section">
    <h4 class="fw-bold mb-3 border-bottom pb-2">🍔 단품메뉴</h4>
    <div class="row row-cols-1 row-cols-md-4 g-4">
   <div class="col">
  <div class="menu-card">
    <img src="https://i.namu.wiki/i/VFARG8z2GzgH6pcQ2dpWAqvjV1XLUpwXfnRg1czTgo8uGQ4G4n6-Hspuf0k9P_9bC8HJQOFirNXwQXCPBISGkjTD_1_XRUCczXnHvWyzJ2lAC2XwavPBYIvpElSxd_4IP2N8C6Y8XvQ-9WdVDtY0KQ.webp" class="menu-img" alt="버거">
    
    <div class="menu-info">
      <div class="menu-name">더블쿼터파운더 치즈버거</div>
      <div class="menu-price text-danger fw-bold">7,400원</div>

      <!-- 장바구니 담기/취소 버튼 -->
      <div class="menu-actions mt-2" style="display: none;">
      <button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      </div>
    </div>
  </div>
</div>

      <div class="col">
      	<div class="menu-card">
      		<img src="https://i.namu.wiki/i/M0AJXeT-p5MdkGgq0Rjm-Y73msgt_1S0s-lxRlzpzqoAGw5tw7JNO5MjFQgRg3N8OVw3qhF1FV8AIy8Mhia09Z1eUes8XzEY1PKkTHEQeYncpZg_spf0e5w95HJXKXT_TuVOtoqbwl_Ca_o-BcxQkw.webp" class="menu-img" alt="버거">
      			<div class="menu-info">
     				 <div class="menu-name">맥스파이시® 상하이 버거</div>
      					<div class="menu-price text-danger fw-bold">5,500원</div>
      	<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
     		 </div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://i.namu.wiki/i/EN7AztZGuSGetPtWcXhD2XlEw3koB8xfcVBwh7xXpJJ_j2hVHPUsOZN-t9hg2bqu9vmr0vew9-NM8AU7acfVg4s_hJpM7eYiP9wM8oGT4dsTRk6LYd1R8o1foPtb9COwLhkWS4HA6VxWrBwtI16QBg.webp" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">싸이버거</div>
      			<div class="menu-price text-danger fw-bold">4,900원</div>
      	<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      			<img src="https://i.namu.wiki/i/D11BHPh-lipxO0eP_WsiHAyeYnJ3VDmxn6YxAiX4s0TM6Endx14hEbTnR5JktQs6kmQ7jHtTWutSmbyzkjoIvh5UdZMgiQSaCL5NC5MdDpdeZlfxySW-zDiLJGnhsI0YNYzGzHCf2XVKAi7Zh3PO0A.webp" class="menu-img" alt="버거">
      				<div class="menu-info">
      					<div class="menu-name">1955버거</div>
      						<div class="menu-price text-danger fw-bold">6,400원</div>
      	<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://i.namu.wiki/i/PGgO60j3kBcEpghAVCI1jSs1Ea04RFxKoiKVzbXFJr0sATKyK8ZrscRSKLe79ragWRNJeXqWu_x93U2hhQrWS1FdAuIl0JookDn2JsjLz8l7hcJGE5_gliCQUEeWzZf_HQ5VUcSVmypWv4KrHpwTdA.webp" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">와퍼</div>
      					<div class="menu-price text-danger fw-bold">7,100원</div>
      		<div class="menu-actions mt-2" style="display: none;">
      		<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        	<button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://i.namu.wiki/i/sUOFFqFFnukJWuw66rrbprffvCtE49tRdpPaNEqz9SyVW3VYL94jajluBSKI-aDO1wcLTUyluntqE0eWKWhgmq10sqgiR1vbM2u0rPUgGy_wFFcsskNWU2roXifJflYkMmpsx6tygdBtz9GT9XQ47g.webp" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">콰트로치즈와퍼</div>
      					<div class="menu-price text-danger fw-bold">7,900원</div>
      					<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://i.namu.wiki/i/ioIhbFZukrHO6d2KBkwGMWNZU7QDrS8ytGdMUFhaMY1E6Aq4DgJicqVyNsbOboZzDYThYFR6U6MbZdsdsQI_5muSFpLCKqHPPkaYiyXQJD8NfG85XFG0XwQXNIQ52DWkYiRUDZK7CDheaQGuevlztQ.webp" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">빅맥</div>
      					<div class="menu-price text-danger fw-bold">5,500원</div>
      					<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card"> 
      		<img src="https://i.namu.wiki/i/5D7RtXlDMY8Do520AQU4_QZiVNmdA2e1CdcnHJzl9EsD8YLLaKf2hju6AN7V0fgFP5I7zenbnaAhKR9Lui8aW0Bv2Ce2-E4P2PCNM8W6UieT8oNAlRZ_Qf4XQhdAvmvAoU6Es5ln2H7rpX7ntJ6HLA.webp" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">T-REX</div>
      					<div class="menu-price text-danger fw-bold">5,000원</div>
      					<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
    </div>
  </div>

<div id="side-area" class="mt-5">
  <h4 class="fw-bold mb-3 border-bottom pb-2">🍟 사이드메뉴</h4>
  <div class="row row-cols-1 row-cols-md-4 g-4">
    
    <div class="col">
      <div class="card h-100 menu-card text-center border rounded shadow-sm">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuk0FWg3JPkRKRHtzBQXVyc4JcaqA8uR8Nmw&s" class="card-img-top menu-img" alt="감자튀김">
        <div class="card-body">
          <div class="menu-name fw-bold">감자튀김</div>
          <div class="menu-price text-danger fw-bold">2,200원</div>
        </div>
        <div class="menu-actions mb-3" style="display: none;">
          <button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
          <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card h-100 menu-card text-center border rounded shadow-sm">
        <img src="https://img.danawa.com/prod_img/500000/358/725/img/5725358_1.jpg?_v=20240429144744" class="card-img-top menu-img" alt="치즈스틱">
        <div class="card-body">
          <div class="menu-name fw-bold">치즈스틱</div>
          <div class="menu-price text-danger fw-bold">2,500원</div>
        </div>
        <div class="menu-actions mb-3" style="display: none;">
          <button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
          <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card h-100 menu-card text-center border rounded shadow-sm">
        <img src="https://sitem.ssgcdn.com/05/40/22/item/1000538224005_i1_750.jpg" class="card-img-top menu-img" alt="코카콜라">
        <div class="card-body">
          <div class="menu-name fw-bold">코카콜라</div>
          <div class="menu-price text-danger fw-bold">1,800원</div>
        </div>
        <div class="menu-actions mb-3" style="display: none;">
          <button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
          <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card h-100 menu-card text-center border rounded shadow-sm">
        <img src="https://image8.coupangcdn.com/image/retail/images/19957427065528-471840e6-7adf-458b-840e-b299e0d7f7c6.jpg" class="card-img-top menu-img" alt="사이다">
        <div class="card-body">
          <div class="menu-name fw-bold">사이다</div>
          <div class="menu-price text-danger fw-bold">1,800원</div>
        </div>
        <div class="menu-actions mb-3" style="display: none;">
          <button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
          <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
        </div>
      </div>
    </div>

  </div>
</div>

        

  <!-- 세트메뉴 영역 -->
  <div id="set-area" class="menu-section" style="display: none;">
    <h4 class="fw-bold mb-3 border-bottom pb-2">🍟 세트메뉴</h4>
    <div class="row row-cols-1 row-cols-md-4 g-4">
    
      <div class="col">
      	<div class="menu-card">
      		<img src="https://www.mcdonalds.co.kr/upload/product/pcfile/1723563759418.png" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">더블쿼터파운더 치즈버거 세트</div>
      					<div class="menu-price text-danger fw-bold">8,900원</div>
      						<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://www.mcdonalds.co.kr/upload/product/pcfile/1723562660091.png" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">맥스파이시® 상하이버거 세트</div>
      					<div class="menu-price text-danger fw-bold">7,000원</div>
      					<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://cdn.011st.com/11dims/resize/376x376/quality/75/11src/product/7678263999/B.jpg?180000000" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">싸이버거 세트</div>
      					<div class="menu-price text-danger fw-bold">6,400원</div>
      					<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://www.mcdonalds.co.kr/upload/product/pcfile/1723564262197.png" class="menu-img" alt="버거"><div class="menu-info">
      			<div class="menu-name">1955버거 세트</div>
      				<div class="menu-price text-danger fw-bold">7,900원</div>
      				<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://mob-prd.burgerking.co.kr/images/menu/web/main/2025/01/06/c8bd99f7-0ce8-457c-8824-4360d6b08d82.png" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">와퍼 세트</div>
      					<div class="menu-price text-danger fw-bold">8,600원</div>
      					<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://mob-prd.burgerking.co.kr/images/menu/web/main/2025/01/06/c8bd99f7-0ce8-457c-8824-4360d6b08d82.png" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">콰트로치즈와퍼 세트</div>
      					<div class="menu-price text-danger fw-bold">9,400원</div>
      					<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://www.mcdonalds.co.kr/upload/product/pcfile/1723564106957.png" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">빅맥 세트</div>
      					<div class="menu-price text-danger fw-bold">7,500원</div>
      					<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
      <div class="col">
      	<div class="menu-card">
      		<img src="https://cdn.011st.com/11dims/resize/1000x1000/quality/75/11src/product/5923720603/B.jpg?537000000" class="menu-img" alt="버거">
      			<div class="menu-info">
      				<div class="menu-name">T-REX 세트</div>
      					<div class="menu-price text-danger fw-bold">6,000원</div>
      					<div class="menu-actions mt-2" style="display: none;">
      	<button class="btn btn-primary btn-sm me-1 btn-add-cart">장바구니 담기</button>
        <button class="btn btn-outline-secondary btn-sm" onclick="event.stopPropagation(); this.parentElement.style.display='none';">취소</button>
      			</div>
      		</div>
      	</div>
      </div>
      
    </div>
  </div>
</div>



<script>
  const tabSingle = document.getElementById("tab-single");
  const tabSet = document.getElementById("tab-set");
  const areaSingle = document.getElementById("single-area");
  const areaSet = document.getElementById("set-area");
  const areaSide = document.getElementById("side-area"); // ✅ 사이드 메뉴 영역 추가

  tabSingle.addEventListener("click", () => {
    tabSingle.classList.add("active");
    tabSet.classList.remove("active");
    areaSingle.style.display = "block";
    areaSet.style.display = "none";        // ✅ 단품 외 세트는 숨김
    areaSide.style.display = "block"; // 단품일 때 보여주기
  });

  tabSet.addEventListener("click", () => {
    tabSet.classList.add("active");
    tabSingle.classList.remove("active");
    areaSingle.style.display = "none";
    areaSet.style.display = "block";       // ✅ 세트 보여줌 ← ★ 이거 추가!
    areaSide.style.display = "none"; // 세트일 때 숨기기
  });

</script>

  <script src="${pageContext.request.contextPath}/js/menu.js"></script>
  <script src="${pageContext.request.contextPath}/js/cart.js"></script>


</body>
</html>