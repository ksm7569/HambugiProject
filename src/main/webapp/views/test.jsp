<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.hamproject.model.DBConnect" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>DB 연결 테스트</title>
</head>
<body>
<%
    try {
        Connection conn = DBConnect.getConnection();
        if (conn != null) {
            out.println("✅ DB 연결 성공!");
            conn.close();
        } else {
            out.println("❌ DB 연결 실패! (conn이 null)");
        }
    } catch (Exception e) {
        out.println("<p>❌ 예외 발생: " + e.getMessage() + "</p>");
        e.printStackTrace(new PrintWriter(out)); // JSP 페이지에 예외 상세 출력
    }
%>
</body>
</html>
