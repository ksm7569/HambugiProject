<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원가입 완료</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/main-style.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/includes/header.jsp" />

<div class="container d-flex justify-content-center align-items-center" style="height: 90vh;">
  <div class="text-center">
    <h2 class="fw-bold mb-4 text-success">회원가입이 완료되었습니다!</h2>
    <a href="login.jsp" class="btn btn-primary btn-lg fw-bold">
      <i class="bi bi-box-arrow-in-right me-2"></i> 로그인하기
    </a>
  </div>
</div>

</body>
</html>
