package com.hamproject.auth;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.net.*;

public class Oauth2Callback extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 네이버에서 전달된 code 받기
        String code = request.getParameter("code");

        // 코드가 없다면 로그인 페이지로 리다이렉트
        if (code == null) {
            System.out.println("Received code: null"); // 코드가 없을 경우 로그 출력
            response.sendRedirect("/Hambugi/views/login.jsp"); 
            return;
        }

        // 네이버 API로부터 액세스 토큰을 요청하는 부분
        String clientId = "gW0TwpYVzU9smvzCHmII"; // 네이버 개발자 센터에서 받은 클라이언트 ID
        String clientSecret = "KoFu5Z6nZV"; // 네이버 개발자 센터에서 받은 클라이언트 Secret
        String redirectURI = "http://localhost:8081/Hambugi/Api/Member/Oauth2Callback"; // 설정한 Redirect URI

        // 액세스 토큰 요청 URL
        String tokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=" + clientId
                + "&client_secret=" + clientSecret + "&code=" + code + "&redirect_uri=" + URLEncoder.encode(redirectURI, "UTF-8");

        try {
            // 액세스 토큰을 받기 위한 HTTP 요청
            URL url = new URL(tokenUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            // JSON 응답에서 액세스 토큰 파싱
            String responseJson = sb.toString();
            String accessToken = extractAccessToken(responseJson);

            System.out.println("Access Token: " + accessToken); // 액세스 토큰 로그 출력

            // 액세스 토큰을 이용해 사용자 정보 요청
            String userInfoUrl = "https://openapi.naver.com/v1/nid/me";
            String userInfoResponse = getUserInfo(userInfoUrl, accessToken);

            // 사용자 정보를 세션에 저장 (세션을 통해 로그인 상태 유지)
            HttpSession session = request.getSession();
            session.setAttribute("userInfo", userInfoResponse);

            // ✅ 추가: name, id 파싱해서 세션에 저장
            int nameStart = userInfoResponse.indexOf("\"name\":\"") + 8;
            int nameEnd = userInfoResponse.indexOf("\"", nameStart);
            String name = userInfoResponse.substring(nameStart, nameEnd);

            int idStart = userInfoResponse.indexOf("\"id\":\"") + 6;
            int idEnd = userInfoResponse.indexOf("\"", idStart);
            String id = userInfoResponse.substring(idStart, idEnd);

            session.setAttribute("name", name);
            session.setAttribute("id", id);

            // 로그인 성공 후, 메인 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/views/Mainpage.jsp");

        } catch (IOException e) {
            // 오류 처리: 액세스 토큰 요청 실패 시
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "네이버 인증 과정에서 오류가 발생했습니다.");
        }
    }

    // 액세스 토큰 추출 메서드
    private String extractAccessToken(String responseJson) {
        int start = responseJson.indexOf("access_token\":\"") + 15;
        int end = responseJson.indexOf("\"", start);
        return responseJson.substring(start, end);
    }

    // 사용자 정보 요청
    private String getUserInfo(String apiUrl, String accessToken) throws IOException {
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
        return sb.toString(); // 사용자 정보를 JSON 형태로 반환
    }
}
