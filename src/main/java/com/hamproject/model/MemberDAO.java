package com.hamproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

    // 회원가입 처리
    public boolean insertMember(String id, String pw, String name, String email) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnect.getConnection();
            String sql = "INSERT INTO member (id, password, name, email, role) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            pstmt.setString(5, "user"); // 기본 회원가입은 일반 사용자
            
            int rows = pstmt.executeUpdate();
            if (rows > 0) success = true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }

        return success;
    }

    // 아이디 중복 확인
    public boolean isIdDuplicate(String id) {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM member WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                exists = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }

    // 이메일 중복 확인
    public boolean isEmailDuplicate(String email) {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM member WHERE email = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                exists = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }

    // 로그인 처리
    public MemberDTO login(String id, String password) {
        MemberDTO user = null;
        String sql = "SELECT id, name, role FROM member WHERE id = ? AND password = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new MemberDTO();
                    user.setId(rs.getString("id"));
                    user.setName(rs.getString("name"));
                    user.setRole(rs.getString("role"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
