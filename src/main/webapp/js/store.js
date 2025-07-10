let map;
let markers = [];
let currentPage = 1;
const itemsPerPage = 7;
let filteredStores = [];

function initMap() {
  const container = document.getElementById('map');
  const options = {
    center: new kakao.maps.LatLng(37.5665, 126.9780),
    level: 4
  };
  map = new kakao.maps.Map(container, options);
}

function clearMarkers() {
  markers.forEach(marker => marker.setMap(null));
  markers = [];
}

function displayPage(page) {
  const start = (page - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  const paginatedStores = filteredStores.slice(start, end);

  const storeList = document.getElementById('storeList');
  storeList.innerHTML = '';

  paginatedStores.forEach((store) => {
    const tr = document.createElement('tr');
    const td = document.createElement('td');
    td.innerHTML = `<strong style="color: blue">${store.name}</strong><br><small>${store.address}</small>`;
    td.style.cursor = 'pointer';
    td.onclick = () => {
      map.setCenter(new kakao.maps.LatLng(store.lat, store.lng));
    };
    tr.appendChild(td);
    storeList.appendChild(tr);
  });

  renderPagination();
}

function renderPagination() {
  const totalPages = Math.ceil(filteredStores.length / itemsPerPage);
  const storeList = document.getElementById('storeList');

  const paginationRow = document.createElement('tr');
  const paginationTd = document.createElement('td');
  paginationTd.colSpan = 1;
  paginationTd.className = 'text-center pt-2';

  for (let i = 1; i <= totalPages; i++) {
    const btn = document.createElement('button');
    btn.innerText = i;
    btn.className = 'btn btn-sm btn-outline-primary mx-1';
    if (i === currentPage) btn.classList.add('fw-bold');
    btn.onclick = () => {
      currentPage = i;
      displayPage(currentPage);
    };
    paginationTd.appendChild(btn);
  }

  paginationRow.appendChild(paginationTd);
  storeList.appendChild(paginationRow);
}

function searchStore() {
  const keyword = document.getElementById('searchInput').value.trim();
  const storeList = document.getElementById('storeList');
  storeList.innerHTML = '';

  if (!keyword) {
    alert("검색어를 입력하세요.");
    return;
  }

  // ✅ Tomcat context root가 /Hambugi일 경우 절대경로 fetch
  fetch("/Hambugi/js/store.json")
    .then(res => res.json())
    .then(data => {
      filteredStores = data.filter(store =>
        store.name.includes(keyword) || store.address.includes(keyword)
      );

      if (filteredStores.length === 0) {
        storeList.innerHTML = '<tr><td>검색 결과가 없습니다</td></tr>';
        return;
      }

      clearMarkers();
      filteredStores.forEach(store => {
        const marker = new kakao.maps.Marker({
          map: map,
          position: new kakao.maps.LatLng(store.lat, store.lng),
          title: store.name
        });
        markers.push(marker);
      });

      currentPage = 1;
      displayPage(currentPage);
    })
    .catch(error => {
      console.error("store.json 로딩 실패:", error);
      alert("매장 데이터를 불러올 수 없습니다.");
    });
}

window.addEventListener("DOMContentLoaded", () => {
  const script = document.createElement("script");
  script.src = "https://dapi.kakao.com/v2/maps/sdk.js?appkey=50257c31e1fa32a61bc2d8ccd9f23793&autoload=false";
  script.onload = function () {
    kakao.maps.load(() => {
      initMap();
      document.getElementById("searchBtn").addEventListener("click", searchStore);
    });
  };
  document.head.appendChild(script);
});
