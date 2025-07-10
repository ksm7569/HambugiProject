<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hamproject.model.PurchaseDTO" %>
<%
  List<PurchaseDTO> purchases = (List<PurchaseDTO>) request.getAttribute("purchaseList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>주문 이력</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .container { margin-top: 50px; max-width: 800px; }
    .table th { background-color: #f1f1f1; }
  </style>
</head>
<body>
  <div class="container">
    <h3 class="mb-4 text-center fw-bold"> 결제 이력</h3>
    <table class="table table-bordered text-center align-middle">
      <thead>
        <tr>
          <th>메뉴</th>
          <th>가격</th>
          <th>수량</th>
          <th>총합</th>
          <th>시간</th>
        </tr>
      </thead>
      <tbody>
        <%
          if (purchases == null || purchases.isEmpty()) {
        %>
        <tr><td colspan="5">결제 내역이 없습니다.</td></tr>
        <%
          } else {
            for (PurchaseDTO item : purchases) {
        %>
        <tr>
          <td><%= item.getItemName() %></td>
          <td>₩<%= String.format("%,d", item.getPrice()) %></td>
          <td><%= item.getQuantity() %></td>
          <td>₩<%= String.format("%,d", item.getTotalPrice()) %></td>
          <td><%= item.getPurchaseTime() %></td>
        </tr>
        <%
            }
          }
        %>
      </tbody>
    </table>
    <div class="text-center mt-3">
      <a href="views/Mainpage.jsp" class="btn btn-secondary">메인으로</a>
    </div>
  </div>
</body>
</html>
