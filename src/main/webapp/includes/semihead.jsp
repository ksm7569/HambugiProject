<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 🍔 자동 슬라이드 배너 영역 -->
<div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">

 <!-- 슬라이드 1 -->
    <div class="carousel-item active">
      <img src="https://st4.depositphotos.com/20204904/31212/v/1600/depositphotos_312125196-stock-illustration-delicious-hamburger-banner-ads.jpg" class="d-block w-100" alt="슬라이드1">
    </div>

    <!-- 슬라이드 2 -->
    <div class="carousel-item">
      <img src="https://blog.kakaocdn.net/dn/0TzYb/btqEd7UogaP/RB1Aa4pgDplIwzvJApKeM1/img.png" class="d-block w-100" alt="슬라이드2">
    </div>

    <!-- 슬라이드 3 -->
    <div class="carousel-item">
      <img src="https://blog.kakaocdn.net/dn/2c2tk/btspmLL9Ob0/UOEQyLGsGIdMMWLRwov8cK/img.png" class="d-block w-100" alt="슬라이드3">
    </div>


  <!-- 좌우 컨트롤 버튼 -->
  <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<!-- ✅ 자동 전환을 위한 JS (Bootstrap 객체 사용) -->
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const carousel = new bootstrap.Carousel(document.querySelector('#mainCarousel'), {
      interval: 3000,  // 3초
      ride: 'carousel'
    });
  });
</script>