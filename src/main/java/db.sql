
INSERT INTO USER_ACCOUNT(
    USER_EMAIL,
    USER_PW,
    USER_NAME,
    USER_BIRTH,
    USER_ADDR,
    USER_TEL,
    USER_GEN,
    USER_NICKNAME,
    USER_GRADE,
    USER_PICTURE
) VALUES (
             'user2@example.com', -- USER_EMAIL
             'user2',       -- USER_PW
             '조수진',          -- USER_NAME
             '1997-11-29',        -- USER_BIRTH
             '서울특별시 마포구 상암동', -- USER_ADDR
             '010-1234-5678',     -- USER_TEL
             'f',                 -- USER_GEN (male)
             '죠죠',           -- USER_NICKNAME
             'Gold',              -- USER_GRADE
             'profile1.jpg'       -- USER_PICTURE
         );

select * from USER_ACCOUNT;


insert into RESERVATION_INFO
values
    ('1','1','user2@example.com','조수진',
     '010-3385-6138','2025-03-02','4');

insert into RESERVATION_INFO
values
    ('2','2','user2@example.com','조수진',
     '010-3385-6138','2025-03-03','2');

insert into RESERVATION_INFO
values
    ('4','5','user2@example.com','조수진',
     '010-3385-6138','2025-03-07','4');
insert into RESERVATION_INFO
values
    ('6','7','user2@example.com','조수진',
     '010-3385-6138','2025-03-02','4');


select * from RESERVATION_INFO;

select * from SCRAP_SHOP;

INSERT INTO SCRAP_SHOP (SCRAP_NO, SCRAP_EMAIL, SCRAP_SHOP, SCRAP_DATE)
VALUES (1, 'user2@example.com', 1, TO_DATE('2025-03-10', 'YYYY-MM-DD'));

insert into OWNER_ACCOUNT values ('nakamiri@test.com','nakamiri','なかみりあずか','1999-03-03','031-418-6138','nakazzang','nakazzangdesu.','naka.jpg');
INSERT INTO OWNER_ACCOUNT VALUES('tanakayo@test.com', 'tanakayo', '田中洋子', '1988-07-15', '010-5212-6578', 'tanakayo', 'yokotanaka123.', 'yoko.jpg');
insert into OWNER_ACCOUNT values ('yamadako@test.com', 'yamadako', '山田康子', '1995-10-20', '011-3333-4444', 'yamako', 'yamako_dreams.', 'yamako.jpg');
insert into OWNER_ACCOUNT values ('suzukike@test.com', 'suzukike', '鈴木恵', '1992-01-05', '012-4556-7890', 'suzukei', 'kei_lovesushi.', 'kei.jpg');
insert into OWNER_ACCOUNT values ('uchidayu@test.com', 'uchidayu', '内田優', '1985-11-25', '042-123-9876', 'yuchida', 'uchiworld.', 'uchida.jpg');

insert into SHOP_INFO values ('1','nakamiri@test.com','회전초밥 네무로 하나마루 (回転寿司 根室花まる)',' 〒087-0045 北海道根室市花園町9丁目35','0153-24-1444','네무로에서 시작된 회전초밥 체인점으로 신선한 해산물을 사용한 다양한 초밥을 제공합니다 ','11:00-21:00','일본어');
-- 동구리 오도리점
INSERT INTO SHOP_INFO VALUES (
                                 '2',
                                 'tanakayo@test.com',
                                 '동구리 오도리점 (どんぐり大通店)',
                                 '〒060-0042 北海道札幌市中央区大通西1丁目13 ル・トロワ1階',
                                 '011-210-5252',
                                 '삿포로 시내를 거점으로 여러 매장을 운영하는 베이커리로, 홋카이도 특산물인 치쿠와빵의 발상지로 유명합니다.',
                                 '10:00~21:00',
                                 '일본어'
                             );

-- 아시안 바 라마이 삿포로 중앙점
INSERT INTO SHOP_INFO VALUES (                                 '7',
                                 'yamadako@test.com',
                                 '아시안 바 라마이 삿포로 중앙점 (アジアンバー ラマイ札幌中央店)',
                                 '〒064-0804 北海道札幌市中央区南4条西10丁目1005-4 コンフォモール札幌 1階',
                                 '011-211-0697',
                                 '수프카레로 유명한 체인점으로, 인도네시아 발리섬의 분위기를 느낄 수 있는 인테리어가 특징입니다.',
                                 '11:30~23:00',
                                 '일본어'
                             );

-- 카레숍 인디언 마치나카점
INSERT INTO SHOP_INFO VALUES (
                                 '4',
                                 'suzukike@test.com',
                                 '카레숍 인디언 마치나카점 (カレーショップ インデアン まちなか店)',
                                 '〒080-0012 北海道帯広市西2条南10丁目7-1',
                                 '0155-23-5164',
                                 '오비히로 등 도카치 지방에서 인기 있는 카레 체인점으로, 가정적인 맛의 카레를 제공합니다. 특히 인디언 카레가 대표 메뉴입니다.',
                                 '11:00~20:00',
                                 '일본어'
                             );

-- 우미에 미나미3조점
INSERT INTO SHOP_INFO VALUES (
                                 '5',
                                 'uchidayu@test.com',
                                 '우미에 미나미3조점 (海へ 南3条店)',
                                 '〒060-0063 北海道札幌市中央区南3条西3丁目3 Gダイニング札幌ビル 1F',
                                 '011-222-8080',
                                 '제철 생선을 사용한 다양한 해산물 요리를 맛볼 수 있는 가게로, 사시미, 스시, 해산물 덮밥 등을 제공합니다. 차분한 분위기에서 식사를 즐길 수 있습니다.',
                                 '17:00~24:00',
                                 '일본어'
                             );

-- 하세가와 스토어 베이 와이점
INSERT INTO SHOP_INFO VALUES (
                                 '6',
                                 'nakamiri@test.com',
                                 '하세가와 스토어 베이 와이점 (ハセガワストア ベイエリア店)',
                                 '〒040-0053 北海道函館市末広町23-5',
                                 '0138-24-0024',
                                 '하코다테 지역의 편의점으로, 명물인 야키토리 벤토를 판매합니다. 1978년 출시 이후 변함없는 인기를 자랑하는 도시락 메뉴입니다.',
                                 '24시간 영업',
                                 '일본어'
                             );
select * from SHOP_INFO;
INSERT INTO REVIEW_INFO (REVIEW_NO, REVIEW_SHOP, REVIEW_CONTENT, REVIEW_DATE, REVIEW_NICKNAME, REVIEW_STAR)
VALUES (6, 5, '역 근처라서 접근성도 좋고 맛도 넘 좋아용!', TO_DATE('2025-01-12', 'YYYY-MM-DD'), '조조', 5);

<-- delete from review_info where REVIEW_NO=6;-->

select * from REVIEW_INFO;
INSERT INTO SHOP_IMAGE values (1, 'mise1.img','main');
INSERT INTO SHOP_IMAGE values (2, 'mise2.img','main');
INSERT INTO SHOP_IMAGE values (3, 'mise3.img','main');



select * from RESERVATION_INFO;

SELECT review_shop, review_content, review_date, review_nickname, shop_name
FROM review_info_sjsj r, shop_info_sj s
WHERE
r.REVIEW_SHOP = s.SHOP_NO and
r.review_nickname = '조조';

select ri.reservation_date, ri.reservation_people, si.shop_name, sim.shop_image
FROM reservation_info_sj ri, SHOP_INFO_sj si, shop_image_sj sim
WHERE ri.reservation_email = 'user2@example.com'
  AND ri.reservation_shop = si.shop_no
  AND si.shop_no = sim.shop_no;

select * from RESERVATION_INFO_sj;
select * from shop_image_sj;
select * from SHOP_INFO_sj;



SELECT review_shop, review_content, review_date, review_nickname, shop_name FROM review_info_sjsj r, shop_info_sj s
                    WHERE
                    r.REVIEW_SHOP = s.SHOP_NO and
                    r.review_nickname = '조조';
SELECT review_shop, review_content, review_date, review_nickname, shop_name
   FROM review_info_sjsj r, shop_info_sj s WHERE r.REVIEW_SHOP = s.SHOP_NO and r.review_nickname = '조조';
select * from USER_ACCOUNT_SJ;
SELECT shop_name, scrap_date, shop_image, scrap_email, shop_addr, shop_tel, shop_content, shop_opentime FROM scrap_shop_sj, shop_info sj, shop_image_sj WHERE scrap_email = 'user2@example.com';

select * from COMMENT_INFO;
select * from USER_ACCOUNT;

select * from user_account_sj where user_email='user2@example.com';