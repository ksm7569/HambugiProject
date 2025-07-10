<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.hamproject.model.OrderDTO" %>
<%@ page import="com.hamproject.model.OrderDAO" %>
<%@ include file="/includes/header.jsp" %>

<%
    if (!"admin".equals(role)) {
        response.sendRedirect("../Mainpage.jsp");
        return;
    }
    List<OrderDTO> orders = (List<OrderDTO>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문 내역 전체 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4"><i class="bi bi-box-seam"></i> 주문 내역 전체 조회</h2>

    <table class="table table-bordered text-center">
        <thead class="table-light">
            <tr>
                <th>주문번호</th>
                <th>회원ID</th>
                <th>상품명</th>
                <th>수량</th>
                <th>총 가격</th>
                <th>주문일시</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (orders == null || orders.isEmpty()) {
            %>
                <tr>
                    <td colspan="6">조회된 주문 내역이 없습니다.</td>
                </tr>
            <%
                } else {
                    for (OrderDTO order : orders) {
            %>
                <tr>
                    <td><%= order.getId() %></td>
                    <td><%= order.getUserId() %></td>
                    <td><%= order.getItemName() %></td>
                    <td><%= order.getQuantity() %></td>
                    <td><%= order.getTotalPrice() %></td>
                    <td><%= order.getPurchaseTime() %></td>
                </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>

    <a href="../Mainpage.jsp" class="btn btn-secondary mt-3">메인으로</a>
</div>
</body>
</html>
