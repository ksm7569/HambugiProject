<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>

    <!-- ✅ Bootstrap 스타일 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

    <!-- ✅ 내부 스타일 시트 (경로 중요!) -->
    <link href="${pageContext.request.contextPath}/css/main-style.css" rel="stylesheet">
</head>
<body>

<%
    // ✅ header.jsp에서 이미 role을 가져오므로, 중복 선언하면 안 됨!
    String sessionRole = (String) session.getAttribute("role");
    if (!"admin".equals(sessionRole)) {
        response.sendRedirect("Mainpage.jsp");
        return;
    }
%>

<div class="container mt-5">
    <h1 class="mb-4"> 관리자 페이지</h1>
    <p>여기에 관리자만 볼 수 있는 내용을 추가하세요.</p>
    <a href="${pageContext.request.contextPath}/admin/manageOrders" class="btn btn-primary">
        전체 주문 내역 조회  
	</a>
    <a href="${pageContext.request.contextPath}/admin/manageOrders" class="btn btn-primary">
        회원별 구매 내역 조회  
	</a>
    <a href="${pageContext.request.contextPath}/admin/manageOrders" class="btn btn-primary">
        비회원 예약 내역  
	</a>
</div>

</body>
</html>
