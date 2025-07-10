package com.hamproject.model;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDAO {  // ✅ 클래스 선언 추가

    public List<OrderDTO> getAllOrders() {
        List<OrderDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM purchase ORDER BY purchase_time DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                OrderDTO dto = new OrderDTO();
                dto.setId(rs.getInt("ID"));  // ✅ 정확하게 일치
                dto.setUserId(rs.getString("USER_ID"));
                dto.setItemName(rs.getString("ITEM_NAME"));
                dto.setPrice(rs.getInt("PRICE"));
                dto.setQuantity(rs.getInt("QUANTITY"));
                dto.setTotalPrice(rs.getInt("TOTAL_PRICE"));
                dto.setPurchaseTime(rs.getTimestamp("PURCHASE_TIME")); // ✅ 정확하게 일치
                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
