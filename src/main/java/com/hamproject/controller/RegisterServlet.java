package com.hamproject.controller;

import com.hamproject.model.MemberDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register.do")  // 💥 여기만 추가하면 web.xml 필요 없음!
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String pw = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // 🔒 입력 유효성 검사
        if (id.length() < 6 || !id.matches(".*[a-zA-Z가-힣].*")) {
            response.sendRedirect("views/register.jsp?error=idLength");
            return;
        }
        if (pw.length() < 8 || !pw.matches(".*[a-zA-Z가-힣].*")) {
            response.sendRedirect("views/register.jsp?error=pwLength");
            return;
        }

        MemberDAO dao = new MemberDAO();

        // 🔐 중복 검사
        if (dao.isIdDuplicate(id)) {
            response.sendRedirect("views/register.jsp?error=id");
            return;
        }
        if (dao.isEmailDuplicate(email)) {
            response.sendRedirect("views/register.jsp?error=email");
            return;
        }

        // ✅ 회원가입 처리
        boolean result = dao.insertMember(id, pw, name, email);
        if (result) {
            response.sendRedirect("views/register-success.jsp");
        } else {
            response.sendRedirect("views/register.jsp?error=fail");
        }
    }
}
