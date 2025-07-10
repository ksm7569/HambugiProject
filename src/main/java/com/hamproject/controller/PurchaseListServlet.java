package com.hamproject.controller;

import com.hamproject.model.PurchaseDAO;
import com.hamproject.model.PurchaseDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/purchaseList")
public class PurchaseListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");
        if (userId == null) {
            response.sendRedirect("views/login.jsp");
            return;
        }

        try {
            List<PurchaseDTO> purchaseList = new PurchaseDAO().getPurchasesByUser(userId);
            request.setAttribute("purchaseList", purchaseList);
            RequestDispatcher rd = request.getRequestDispatcher("/views/purchaseList.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            throw new ServletException("결제 이력 조회 오류: " + e.getMessage());
        }
    }
}