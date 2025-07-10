package com.hamproject.controller;

import com.hamproject.model.MemberDAO;
import com.hamproject.model.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        MemberDAO dao = new MemberDAO();
        MemberDTO user = dao.login(id, password);

        if (user != null) {
            // 로그인 성공: 세션에 정보 저장
            HttpSession session = request.getSession();
            session.setAttribute("id", user.getId());
            session.setAttribute("name", user.getName());
            session.setAttribute("role", user.getRole());
            response.sendRedirect("views/Mainpage.jsp");
        	
        	System.out.println("🧪 로그인한 사용자 role: " + user.getRole());
        } else {
            // 로그인 실패
        	response.sendRedirect("views/login.jsp?error=fail");
        	

        }
    }
}
