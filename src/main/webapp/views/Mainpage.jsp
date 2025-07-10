<%
    System.out.println("✅ header.jsp 정상 호출됨");
%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>맥도날드 클론</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Bootstrap CSS & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/main-style.css" rel="stylesheet" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/semihead-style.css">

</head>
<body>

  <%-- ✅ 상단 네비게이션 바 불러오기 --%>
	<jsp:include page="/includes/header.jsp" />
  <%@ include file="/includes/semihead.jsp" %>


  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <jsp:include page="/includes/footpage.jsp" />
</body>
</html>