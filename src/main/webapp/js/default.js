document.addEventListener('DOMContentLoaded', () => {
    const map = document.getElementById('hokkaido-map');
    const shopList = document.getElementById('shop-list');
    const shopItems = document.getElementById('shop-items');

    // 테스트 샘플 가게 데이터
    // const shops = [
    //     {name: "가게 1", address: "홋카이도 시내"},
    //     {name: "가게 2", address: "삿포로 근처"},
    //     {name: "가게 3", address: "하코다테"},
    // ];

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

    // 가게 리스트 업데이트 테스트
    // function updateShopList(shops, shopItems) {
    //     shopItems.innerHTML = ""; // 기존 리스트 초기화
    //     shops.forEach((shop) => {
    //         const listItem = document.createElement('li');
    //         listItem.textContent = `${shop.name} - ${shop.address}`;
    //         shopItems.appendChild(listItem);
    //     });
    // }
});

document.querySelectorAll('.map-pointer').forEach(pointer => {
    pointer.addEventListener('click', function () {
        const region = this.dataset.region;

        // 서버에서 데이터 가져오기
        fetch(`/ShopSimpleC?addrtype=${region}`)
            .then(response => response.json())
            .then(data => {
                // 가게 리스트 업데이트
                const shopListContainer = document.getElementById('shop-list');
                shopListContainer.innerHTML = ''; // 기존 내용 초기화

                data.forEach(shop => {
                    const shopElement = document.createElement('div');
                    shopElement.className = 'simpleList';
                    shopElement.onclick = () => location.href = `ShopSimpleC?addrtype='${shop.shop_addrtype}'`;
                    shopElement.innerHTML = `
                        <ul style="list-style: none;">
                            <li style="display: none;"><span>${shop.shop_no}</span></li>
                            <li style="list-style: none;">
                                <span style="font-size: 20pt; font-weight: bold;">${shop.shop_name}</span><br>
                            </li>
                            <li style="list-style: none;"><span>${shop.shop_tel}</span></li>
                            <li style="list-style: none;"><span>${shop.shop_opentime}</span></li>
                        </ul>
                    `;
                    shopListContainer.appendChild(shopElement);
                });
            })
            .catch(error => console.error('Error fetching shop data:', error));
    });
});

