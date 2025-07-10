<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <%-- state값을 UUID로 생성 후 세션에 저장 --%>
  <%
    String state = java.util.UUID.randomUUID().toString();
    session.setAttribute("state", state);
  %>

  <!-- Bootstrap 및 아이콘 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/main-style.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/includes/header.jsp" />

<div class="container d-flex justify-content-center align-items-center" style="height: 80vh;">
  <div class="w-100" style="max-width: 400px;">
    <h4 class="text-center mb-4 fw-bold">지금 로그인하고<br><span class="text-primary">햄버거</span> 받아보세요!</h4>

    <!-- 일반 로그인 -->
    <form action="${pageContext.request.contextPath}/login.do" method="post">
      <div class="form-floating mb-3">
        <input type="text" name="id" class="form-control" id="id" placeholder="아이디 입력">
        <label for="id">아이디</label>
      </div>
      <div class="form-floating mb-3">
        <input type="password" name="password" class="form-control" id="password" placeholder="비밀번호 입력">
        <label for="password">비밀번호</label>
      </div>

      <button type="submit" class="btn btn-info w-100 fw-bold text-white">로그인</button>
    </form>

    <hr class="my-4">

<%
    String error = request.getParameter("error");
    if ("fail".equals(error)) {
%>
    <div class="alert alert-danger text-center" role="alert" style="margin-top: 10px;">
        아이디 또는 비밀번호를 잘못 입력하였습니다.
    </div>
<%
    }
%>


    <!-- ✅ 네이버 로그인 버튼 -->
    <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=gW0TwpYVzU9smvzCHmII&redirect_uri=http://localhost:8081/Hambugi/Api/Member/Oauth2Callback&state=<%= state %>"
       class="btn btn-success w-100 fw-bold" style="background-color: #1EC800; color: white;">
      <i class="bi bi-naver"></i> 네이버 아이디로 로그인
    </a>

    <div class="text-center mt-3">
      <p>아직 회원이 아니신가요?</p>
      <a href="register.jsp" class="btn btn-outline-info w-100 fw-bold">회원가입</a>
    </div>
  </div>
</div>

</body>
</html>
