<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>맥도날드 매장 검색</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

  <!-- CSS (context path 자동 포함) -->
  <link href="${pageContext.request.contextPath}/css/main-style.css" rel="stylesheet" />

  <style>
    body {
      font-family: Arial, sans-serif;
      margin-bottom: 100px;
    }
    #map {
      width: 100%;
      height: 400px;
      margin: 40px 0;
    }
    td {
      border: 1px solid red;
      background-color: #fff8dc;
      color: black;
    }
  </style>
</head>
<body>

<jsp:include page="/includes/header.jsp" />

<div class="container text-center mt-5 pb-5">
  <h1 class="fw-bold mb-4">맥도날드 매장 검색</h1>

  <div class="input-group mb-3" style="max-width: 500px; margin: 0 auto;">
    <input type="text" id="searchInput" class="form-control" placeholder="지역명 입력 (예: 강남)" />
    <button id="searchBtn" class="btn btn-warning">
      <i class="bi bi-search"></i> 검색
    </button>
  </div>

  <!-- 지도 표시 영역 -->
  <div id="map"></div>

  <!-- 매장 리스트 테이블 -->
  <table class="table table-striped" style="max-width: 700px; margin: 0 auto;">
    <thead>
      <tr>
        <th>매장명 / 주소</th>
      </tr>
    </thead>
    <tbody id="storeList" class="text-start">
      <tr><td>📍 여기 매장 정보가 표시됩니다.</td></tr>
    </tbody>
  </table>
</div>

<!-- JavaScript (context path 기반 경로 설정) -->
<script src="${pageContext.request.contextPath}/js/semihead.js"></script>
<script src="${pageContext.request.contextPath}/js/store.js"></script>

</body>
</html>
