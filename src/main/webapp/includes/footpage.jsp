<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- footpage.jsp -->
<div style="display: flex; justify-content: space-between; padding: 40px; background-color: #f9f9f9;">
  
  <!-- 예약 폼 -->
  <div style="flex: 1; margin-right: 40px;">
    <h2 style="font-family: cursive;">비회원 예약하기</h2>
    <form method="post" action="ReserveServlet">
      <input type="text" name="name" placeholder="Your Name" style="width: 100%; margin: 10px 0; padding: 10px;" required />
      <input type="text" name="phone" placeholder="Phone Number" style="width: 100%; margin: 10px 0; padding: 10px;" required />
      <input type="email" name="email" placeholder="Your Email" style="width: 100%; margin: 10px 0; padding: 10px;" required />
      <input type="number" name="people" placeholder="How many people?" style="width: 100%; margin: 10px 0; padding: 10px;" required />
      <input type="date" name="date" style="width: 100%; margin: 10px 0; padding: 10px;" required />
      <button type="submit" style="background-color: #ffc107; border: none; padding: 10px 20px; color: white; font-weight: bold;">CHECK AVAILABILITY</button>
    </form>
  </div>

  <!-- 지도 -->
  <div style="flex: 1;">
    <iframe 
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1119.8440330371288!2d127.14796227748371!3d37.45134179788326!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca8c9cae7f319%3A0x2b72c3954c493e5b!2z66el64-E64Kg65OcIOyEseuCqOyLoO2dpURU7KCQ!5e0!3m2!1sko!2sit!4v1750340467152!5m2!1sko!2sit"
      width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
    </iframe>
  </div>
</div>