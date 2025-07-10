package com.hamproject.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // 1. 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 2. 접속 정보 설정
            String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1"
            		
            		; // orcl일 수도 있음
            String user = "hr"; // 실제 오라클 계정
            String password = "hr"; // 실제 오라클 비번

            // 3. 연결 시도
            conn = DriverManager.getConnection(url, user, password);

        } catch (Exception e) {
            e.printStackTrace(); // 콘솔에 에러 출력
        }
        return conn;
    }
}