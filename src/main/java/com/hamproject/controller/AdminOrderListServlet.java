package com.hamproject.controller;

import com.hamproject.model.OrderDAO;
import com.hamproject.model.OrderDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manageOrders")
public class AdminOrderListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ 서블릿 호출 확인용 로그
        System.out.println("🧩 AdminOrderListServlet 실행됨");

        // 관리자 권한 확인
        String role = (String) request.getSession().getAttribute("role");
        if (!"admin".equals(role)) {
            response.sendRedirect("../Mainpage.jsp");
            return;
        }

        // 주문 내역 조회
        OrderDAO dao = new OrderDAO();
        List<OrderDTO> orders = dao.getAllOrders();

        // JSP에 넘김
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/views/admin/manageOrders.jsp").forward(request, response);
    }
}
