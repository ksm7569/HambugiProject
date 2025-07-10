<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/main-style.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/includes/header.jsp" />

<div class="container d-flex justify-content-center align-items-center" style="height: 90vh;">
  <div class="w-100" style="max-width: 400px;">
    <h4 class="text-center mb-4 fw-bold">햄부기 <span class="text-primary">회원가입</span></h4>

    <!-- 🔻 에러 메시지 -->
    <%
      String error = request.getParameter("error");
      if ("id".equals(error)) {
    %>
      <div class="alert alert-danger text-center">❗ 이미 사용 중인 아이디입니다.</div>
    <%
      } else if ("email".equals(error)) {
    %>
      <div class="alert alert-danger text-center">❗ 이미 등록된 이메일입니다.</div>
    <%
      } else if ("fail".equals(error)) {
    %>
      <div class="alert alert-danger text-center">❗ 회원가입에 실패했습니다. 다시 시도해주세요.</div>
    <%
      } else if ("idLength".equals(error)) {
    %>
      <div class="alert alert-danger text-center">❗ 아이디는 6자 이상이며, 한글 또는 영문을 포함해야 합니다.</div>
    <%
      } else if ("pwLength".equals(error)) {
    %>
      <div class="alert alert-danger text-center">❗ 비밀번호는 8자 이상이며, 한글 또는 영문을 포함해야 합니다.</div>
    <%
      }
    %>

    <!-- 🔻 회원가입 폼 -->
    <form action="${pageContext.request.contextPath}/register.do" method="post">
      <div class="form-floating mb-3">
        <input type="text" name="id" class="form-control" id="id" placeholder="아이디 입력" required>
        <label for="id">아이디</label>
      </div>
      <div class="form-floating mb-3">
        <input type="password" name="password" class="form-control" id="password" placeholder="비밀번호 입력" required>
        <label for="password">비밀번호</label>
      </div>
      <div class="form-floating mb-3">
        <input type="text" name="name" class="form-control" id="name" placeholder="이름 입력" required>
        <label for="name">이름</label>
      </div>
      <div class="form-floating mb-3">
        <input type="email" name="email" class="form-control" id="email" placeholder="이메일 입력" required>
        <label for="email">이메일</label>
      </div>

      <button type="submit" class="btn btn-primary w-100 fw-bold">회원가입</button>
    </form>

    <div class="text-center mt-3">
      <a href="login.jsp" class="btn btn-outline-secondary w-100">로그인으로 돌아가기</a>
    </div>
  </div>
</div>

</body>
</html>
