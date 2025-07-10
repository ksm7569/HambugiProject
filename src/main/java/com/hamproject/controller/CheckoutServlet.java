package com.hamproject.controller;

import com.hamproject.model.PurchaseDAO;
import com.hamproject.model.PurchaseDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.println("🚀 CheckoutServlet 실행됨");  // ✅ 여기!
    	
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");

        if (userId == null) {
            response.sendRedirect("views/login.jsp");
            return;
        }

        String[] itemNames = request.getParameterValues("itemName");
        String[] prices = request.getParameterValues("price");
        String[] quantities = request.getParameterValues("quantity");
        String[] totals = request.getParameterValues("total");
        
        if (itemNames == null || prices == null || quantities == null || totals == null) {
            System.out.println("❌ 필수 값 누락! itemNames: " + itemNames + ", prices: " + prices + ", quantities: " + quantities + ", totals: " + totals);
            response.sendRedirect(request.getContextPath() + "/views/cart.jsp?error=dataMissing");
            return;
        }

        List<PurchaseDTO> purchaseList = new ArrayList<>();

        for (int i = 0; i < itemNames.length; i++) {
            String priceStr = prices[i] != null ? prices[i].replaceAll("[^0-9]", "").trim() : "";
            String quantityStr = quantities[i] != null ? quantities[i].trim() : "";
            String totalStr = totals[i] != null ? totals[i].replaceAll("[^0-9]", "").trim() : "";

            if (priceStr.isEmpty() || quantityStr.isEmpty() || totalStr.isEmpty()) {
                continue;
            }

            try {
                PurchaseDTO dto = new PurchaseDTO(
                        userId,
                        itemNames[i],
                        Integer.parseInt(priceStr),
                        Integer.parseInt(quantityStr),
                        Integer.parseInt(totalStr),
                        null  // 🔥 시간은 null → DB에서 자동 CURRENT_TIMESTAMP
                );
                purchaseList.add(dto);
            } catch (NumberFormatException e) {
                System.err.println("🚨 잘못된 숫자 형식: " + e.getMessage());
            }
        }

        try {
            System.out.println("🔥 insertPurchases 호출 전 - 리스트 크기: " + purchaseList.size());

            new PurchaseDAO().insertPurchases(purchaseList);

            System.out.println("✅ insertPurchases 호출 완료");
        } catch (Exception e) {
            System.err.println("❌ DB 오류 발생: " + e.getMessage());
            throw new ServletException("DB 오류: " + e.getMessage());
        }

        // 장바구니 초기화 후 완료 페이지 이동
        session.removeAttribute("cartItems");
        response.sendRedirect("views/checkout.jsp");
    }
}
