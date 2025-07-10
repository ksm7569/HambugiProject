package com.hamproject.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PurchaseDAO {

    // ✅ 결제 내역 저장용
	public void insertPurchases(List<PurchaseDTO> purchases) throws SQLException {
	    String sql = "INSERT INTO purchase (user_id, item_name, price, quantity, total_price, purchase_time) " +
	                 "VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        for (PurchaseDTO item : purchases) {
	            pstmt.setString(1, item.getUserId());
	            pstmt.setString(2, item.getItemName());
	            pstmt.setInt(3, item.getPrice());
	            pstmt.setInt(4, item.getQuantity());
	            pstmt.setInt(5, item.getTotalPrice());
	            pstmt.addBatch();
	        }

	        pstmt.executeBatch();
	    }
	}

    // ✅ 사용자별 결제 이력 조회용
 
   
    public List<PurchaseDTO> getPurchasesByUser(String userId) throws SQLException {
        List<PurchaseDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM purchase WHERE user_id = ? ORDER BY purchase_time DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                PurchaseDTO dto = new PurchaseDTO(
                    rs.getString("user_id"),
                    rs.getString("item_name"),
                    rs.getInt("price"),
                    rs.getInt("quantity"),
                    rs.getInt("total_price"),
                    rs.getTimestamp("purchase_time").toString()
                );
                list.add(dto);
            }
        }

        return list;
    }
    
}
