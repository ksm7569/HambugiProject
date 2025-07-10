package com.hamproject.admin;

import com.hamproject.model.OrderDAO;
import com.hamproject.model.OrderDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO dao = new OrderDAO();
        List<OrderDTO> orderList = dao.getAllOrders();
        request.setAttribute("orderList", orderList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/manageOrders.jsp");
        dispatcher.forward(request, response);
    }
}
