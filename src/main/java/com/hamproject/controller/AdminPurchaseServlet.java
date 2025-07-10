package com.hamproject.controller;

import com.hamproject.model.PurchaseDAO;
import com.hamproject.model.PurchaseDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/purchaseList")
public class AdminPurchaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 관리자 권한 확인
        String role = (String) request.getSession().getAttribute("role");
        if (!"admin".equals(role)) {
            response.sendRedirect("../Mainpage.jsp");
            return;
        }

        // 전체 결제 내역 조회
        PurchaseDAO dao = new PurchaseDAO();
        List<PurchaseDTO> purchases = dao.getAllPurchases();

        request.setAttribute("purchases", purchases);
        request.getRequestDispatcher("/views/adminPurchaseList.jsp").forward(request, response);
    }
}