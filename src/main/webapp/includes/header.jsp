<%@ page contentType="text/html; charset=UTF-8" language="java" session="true" %>
<%
    String name = (String) session.getAttribute("name");
    String role = (String) session.getAttribute("role"); // ✅ role 변수 선언
%>

<% if ("admin".equals(role)) { %>
  <a href="adminpage.jsp" class="btn btn-warning ms-2">관리자 메뉴</a>
<% } %>

<nav class="navbar navbar-expand-lg navbar-light bg-light px-4 py-2">
  <div class="container-fluid d-flex justify-content-between align-items-center">

    <!-- 좌측 로고 -->
    <a class="navbar-brand" href="Mainpage.jsp">
      <img src="https://www.mcdonalds.co.kr/kor/images/common/logo.png" width="40" alt="로고">
    </a>

    <!-- 중간 메뉴 -->
    <div class="d-flex justify-content-center flex-grow-1">
      <a href="menu.jsp" class="nav-link wide-spacing">Menu</a>
      <a href="store.jsp" class="nav-link wide-spacing">Store</a>
      <a href="${pageContext.request.contextPath}/purchaseList" class="nav-link wide-spacing">Payment history</a>
      <a href="adminpage.jsp" class="nav-link wide-spacing" id="admin-link">AdminPage</a>
    </div>

    <!-- 우측 버튼 -->
    <div class="d-flex align-items-center">
      <a href="cart.jsp" class="btn btn-dark me-2">
        <i class="bi bi-cart"></i>
      </a>
      <% if (name != null) { %>
        <span class="me-2 fw-bold"><%= name %>님 환영합니다!</span>
        <a href="${pageContext.request.contextPath}/logout.do" class="btn btn-outline-danger">
          <i class="bi bi-box-arrow-right"></i> Logout
        </a>
      <% } else { %>
        <a href="login.jsp" class="btn btn-danger">
          <i class="bi bi-person-circle"></i> Login
        </a>
      <% } %>
    </div>
  </div>
</nav>

<script>
  window.contextPath = "<%= request.getContextPath() %>";
  window.isLoggedIn = "<%= session.getAttribute("id") != null ? "true" : "false" %>";
  window.userRole = "<%= session.getAttribute("role") != null ? session.getAttribute("role") : "" %>";
</script>

<script>
document.addEventListener("DOMContentLoaded", () => {
  const adminLink = document.getElementById("admin-link");
  if (adminLink) {
    adminLink.addEventListener("click", function (e) {
      if (window.userRole !== "admin") {
        e.preventDefault();
        alert("관리자만 입장 가능합니다!");
      }
    });
  }

  const cartButton = document.querySelector(".btn-dark.me-2");
  if (cartButton) {
    cartButton.addEventListener("click", (e) => {
      if (window.isLoggedIn !== "true") {
        e.preventDefault();
        alert("로그인이 필요한 서비스입니다.");
        location.href = contextPath + "/views/login.jsp";
      }
    });
  }
});
</script>
