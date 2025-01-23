$(document).ready(() => {
    const $map = $('#hokkaido-map');
    const $shopListContainer = $('#shop-list');
    const $mapPointers = $('.map-pointer');
    let isListVisible = false; // 상태 관리 변수
    let currentRegion = null; // 현재 선택된 지역

    // 지도 및 다른 영역 클릭 이벤트
    $(document).on('click', (event) => {
        const isClickInsideMap = $map.is(event.target) || $map.has(event.target).length > 0;
        const isClickInsideList = $shopListContainer.is(event.target) || $shopListContainer.has(event.target).length > 0;

        if (!isClickInsideMap && !isClickInsideList) {
            // 지도, 리스트 외 다른 영역 클릭 시 초기 상태로 복원
            resetToInitialState();
        }
    });

    // 포인터 클릭 이벤트
    $mapPointers.on('click', async function (event) {
        event.stopPropagation(); // 상위 클릭 이벤트로 전파 방지
        const region = $(this).data('region');

        if (!isListVisible) {
            // 최초로 포인터를 클릭하는 경우
            isListVisible = true;
            $map.addClass('reduced');
            $shopListContainer.addClass('visible');
        }

        if (currentRegion !== region) {
            // 다른 포인터를 클릭한 경우에만 리스트 업데이트
            currentRegion = region;
            await updateShopListByRegion(region, $shopListContainer);
        }
    });

    // 가게 리스트를 업데이트하는 함수
    async function updateShopListByRegion(region, $container) {
        try {
            const response = await fetch(`/ShopAddrTypeC?data-region=${region}`, {method: 'GET'});

            if (response.ok) {
                const shopList = await response.json();
                renderShopList(shopList, $container); // 리스트 렌더링
            } else {
                console.error('Failed to fetch shop data:', response.status);
            }
        } catch (error) {
            console.error('Error fetching shop data:', error);
        }
    }

    // 초기 상태로 복원하는 함수
    function resetToInitialState() {
        isListVisible = false;
        currentRegion = null;
        $map.removeClass('reduced');
        $shopListContainer.removeClass('visible').empty(); // 리스트 초기화
    }

    // 리스트를 화면에 렌더링하는 함수
    function renderShopList(shopList, $container) {
        $container.empty(); // 기존 데이터 초기화
        shopList.forEach(shop => {
            const shopElement = $(`
                <div class="simpleList" style="border-top: 1px solid black; border-bottom: 1px solid black; background-color: floralwhite;">
                    <ul style="list-style: none;">
                        <li style="display: none;"><span>${shop.shop_no}</span></li>
                        <li style="list-style: none;">
                            <span style="font-size: 20pt; font-weight: bold;">${shop.shop_name}</span><br>
                        </li>
                        <li style="list-style: none;"><span>${shop.shop_content}</span></li>
                        <li style="list-style: none;"><span>${shop.shop_tel}</span></li>
                        <li style="list-style: none;"><span>${shop.shop_opentime}</span></li>
                    </ul>
                </div>
            `);
            // shopElement.on('click', () => {
            //     location.href = `ShopAddrTypeC?no=${shop.shop_no}`;
            // });
            $container.append(shopElement);
        });
    }
});
