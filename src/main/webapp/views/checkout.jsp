<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>결제 완료</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    .container {
      max-width: 600px;
      margin-top: 100px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2 class="text-success fw-bold mb-4"> 결제가 완료되었습니다!</h2>
    <p class="mb-4">결제 내역은 <strong>마이페이지 → 주문 이력</strong>에서 확인하실 수 있습니다.</p>
    <a href="${pageContext.request.contextPath}/views/Mainpage.jsp" class="btn btn-primary">메뉴로 돌아가기</a>
  </div>
  
  <script>
  // 결제 완료 시 localStorage에서 장바구니 항목 삭제
  localStorage.removeItem("cartItems");
</script>


</body>
</html>
