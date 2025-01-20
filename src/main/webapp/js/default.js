document.addEventListener('DOMContentLoaded', () => {
    const map = document.getElementById('hokkaido-map');
    const shopList = document.getElementById('shop-list');
    const shopItems = document.getElementById('shop-items');

    // 샘플 가게 데이터
    const shops = [
        {name: "가게 1", address: "홋카이도 시내"},
        {name: "가게 2", address: "삿포로 근처"},
        {name: "가게 3", address: "하코다테"},
    ];

    // 상태 관리
    let isListVisible = false;

    // 지도 클릭 이벤트
    map.addEventListener('click', () => {
        isListVisible = !isListVisible;

        if (isListVisible) {
            map.classList.add('reduced');
            shopList.classList.add('visible');
            updateShopList(shops, shopItems);
        } else {
            map.classList.remove('reduced');
            shopList.classList.remove('visible');
            shopItems.innerHTML = ""; // 리스트 초기화
        }
    });

    // 가게 리스트 업데이트
    function updateShopList(shops, shopItems) {
        shopItems.innerHTML = ""; // 기존 리스트 초기화
        shops.forEach((shop) => {
            const listItem = document.createElement('li');
            listItem.textContent = `${shop.name} - ${shop.address}`;
            shopItems.appendChild(listItem);
        });
    }
});



