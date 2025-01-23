create table USER_ACCOUNT_sj
(
    USER_EMAIL    VARCHAR2(20 char) primary key,
    USER_PW       VARCHAR2(20 char) not null,
    USER_NAME     VARCHAR2(20 char) not null,
    USER_BIRTH    VARCHAR2(20 char) not null,
    USER_ADDR     VARCHAR2(50 char) not null,
    USER_TEL      VARCHAR2(20 char) not null,
    USER_GEN      VARCHAR2(10 char) not null
        constraint CHECK_USER_GEN_sj
            check (user_gen IN ('m', 'f')),
    USER_NICKNAME VARCHAR2(20 char) not null
        constraint UNIQUE_USER_NICKNAME_sj
            unique,
    USER_GRADE    VARCHAR2(20 char) not null,
    USER_PICTURE  VARCHAR2(200 char)
);

INSERT INTO USER_ACCOUNT_sj (
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
             'user1@example.com', -- USER_EMAIL
             'password123',       -- USER_PW
             'John Doe',          -- USER_NAME
             '1990-01-01',        -- USER_BIRTH
             '123 Main St, City', -- USER_ADDR
             '010-1234-5678',     -- USER_TEL
             'm',                 -- USER_GEN (male)
             'John123',           -- USER_NICKNAME
             'Gold',              -- USER_GRADE
             'profile1.jpg'       -- USER_PICTURE
         );

INSERT INTO USER_ACCOUNT_sj (
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
             'password123',       -- USER_PW
             '조조',          -- USER_NAME
             '1990-01-01',        -- USER_BIRTH
             '123 Main St, City', -- USER_ADDR
             '010-1234-5678',     -- USER_TEL
             'm',                 -- USER_GEN (male)
             '조조',           -- USER_NICKNAME
             'Gold',              -- USER_GRADE
             'profile1.jpg'       -- USER_PICTURE
         );

create table RESERVATION_INFO_sj(
    RESERVATION_NO NUMBER(3) primary key,
        RESERVATION_SHOP NUMBER(3) not null,
    RESERVATION_EMAIL VARCHAR2(20 char) not null,
    RESERVATION_NAME VARCHAR2(20 char) not null,
    RESERVATION_TEL VARCHAR2(20 char) not null,
    RESERVATION_DATE VARCHAR2(20 char) not null,
    RESERVATION_PEOPLE NUMBER(3)
);
insert into RESERVATION_INFO_sj values ('5','100','user2@example.com','조조','310100','2025-01-01','4');

insert into RESERVATION_INFO_sj values ('5','100','user2@example.com','조조','310100','2025-01-01','4');
select * from RESERVATION_INFO_sj;
INSERT INTO RESERVATION_INFO_sj (
    RESERVATION_NO,
    RESERVATION_SHOP,
    RESERVATION_EMAIL,
    RESERVATION_NAME,
    RESERVATION_TEL,
    RESERVATION_DATE,
    RESERVATION_PEOPLE
) VALUES (
             1,
             101,
             'example@email.com',
             'John Doe',
             '010-1234-5678',
             '2025-01-20',
             4
         );


INSERT INTO RESERVATION_INFO_sj (
    RESERVATION_NO,
    RESERVATION_SHOP,
    RESERVATION_EMAIL,
    RESERVATION_NAME,
    RESERVATION_TEL,
    RESERVATION_DATE,
    RESERVATION_PEOPLE
) VALUES (
             6,
             101,
             'user2@example.com',
             '조조',
             '010-1234-5678',
             '2025-01-20',
             4
         );
INSERT INTO RESERVATION_INFO_sj (
    RESERVATION_NO,
    RESERVATION_SHOP,
    RESERVATION_EMAIL,
    RESERVATION_NAME,
    RESERVATION_TEL,
    RESERVATION_DATE,
    RESERVATION_PEOPLE
) VALUES (
             3,
             100,
             'user2@email.com',
             '조조',
             '010-1234-5678',
             '2025-01-20',
             2
         );



create table SCRAP_SHOP_sj (
    SCRAP_NO NUMBER(3) primary key ,
    SCRAP_EMAIL varchar2(20 char) not null,
    SCRAP_SHOP NUMBER(3) not null,
    SCRAP_DATE DATE not null
);

INSERT INTO SCRAP_SHOP_sj (SCRAP_NO, SCRAP_EMAIL, SCRAP_SHOP, SCRAP_DATE)
VALUES (1, 'user@example.com', 101, TO_DATE('2025-01-16', 'YYYY-MM-DD'));

INSERT INTO SCRAP_SHOP_sj (SCRAP_NO, SCRAP_EMAIL, SCRAP_SHOP, SCRAP_DATE)
VALUES (2, 'user2@example.com', 102, TO_DATE('2025-01-16', 'YYYY-MM-DD'));

INSERT INTO SCRAP_SHOP_sj (SCRAP_NO, SCRAP_EMAIL, SCRAP_SHOP, SCRAP_DATE)
VALUES (3, 'user2@example.com', 100, TO_DATE('2025-01-16', 'YYYY-MM-DD'));


create table REVIEW_INFO_sjsj (
    REVIEW_NO NUMBER(3) PRIMARY KEY ,
    REVIEW_SHOP NUMBER(3) not null,
    REVIEW_CONTENT VARCHAR2(1000 CHAR) not null ,
    REVIEW_DATE DATE not null,
    REVIEW_NICKNAME VARCHAR2(20 CHAR) not null,
    REVIEW_STAR NUMBER(3) not null
);

create table SHOP_INFO_sj (
    SHOP_NO number(3) primary key,
    SHOP_OWNER Varchar2(20 char) not null,
    SHOP_NAME varchar2(20 char) not null,
    SHOP_ADDR varchar2(20 char) not null,
    SHOP_TEL varchar2(20 char) not null,
    SHOP_CONTENT varchar2(1000 char) not null,
    SHOP_OPENTIME varchar2(20 char) not null,
    SHOP_ADDRTYPE varchar2(20 char) not null);

insert into SHOP_INFO_sj values ('101','백종원','백종원의 골목식당','서울특별시 종로구','031-418-6138','골목에 숨어있는 찐맛집 ','19:00','한글');
insert into SHOP_INFO_sj values ('100','백종탁','골목식당','서울특별시 종로구','031-218-6138','회맛집 ','19:00','한글');
insert into SHOP_INFO_sj values ('102','백승원','골목식당23','서울특별시 종로구','031-118-6138','곱창 찐맛집 ','19:00','한글');


SELECT review_shop, review_content, review_date, review_nickname, shop_name FROM review_info_sjsj, shop_info sj WHERE review_nickname = '조조';

select * from SHOP_INFO_sj;
INSERT INTO REVIEW_INFO_sjsj (REVIEW_NO, REVIEW_SHOP, REVIEW_CONTENT, REVIEW_DATE, REVIEW_NICKNAME, REVIEW_STAR)
VALUES (3, 101, 'Great shop!', TO_DATE('2025-01-16', 'YYYY-MM-DD'), '조조', 5);

insert into REVIEW_INFO_sjsj values ('2','2','존맛탱 홍게집','2025-03-03','조조','4');
insert into REVIEW_INFO_sjsj values ('3','3','존맛탱 고구마집','2025-03-05','조망망','2');
insert into REVIEW_INFO_sjsj values ('4','3','존맛탱 고구마집','2025-03-05','조조','2');
insert into REVIEW_INFO_sjsj values ('5','3','존맛탱 회집','2025-03-05','조조','2');
insert into REVIEW_INFO_sjsj values ('6','3','존맛탱 치킨집','2025-03-05','조조','2');


create table shop_image_sj (
    SHOP_NO number(3) primary key ,
    SHOP_IMAGE varchar2(20 char) not null,
    IMAGE_TYPE varchar2(20 char) not null
);
INSERT INTO SHOP_IMAGE_sj values (101, 'aa.img','main');
INSERT INTO SHOP_IMAGE_sj values (100, 'aa.img','main');
update RESERVATION_INFO_sj set RESERVATION_SHOP = 3 where reservation_no = 1;
INSERT INTO SHOP_IMAGE_sj values (102, 'aa.img','main');

SELECT shop_name, scrap_date, shop_image, scrap_email FROM scrap_shop_sj, shop_info sj, shop_image_sj WHERE scrap_email = 'user@example.com';



select * from RESERVATION_INFO_SJ;
select * from SCRAP_SHOP_SJ;
select * from REVIEW_INFO_sjsj;

select * from USER_ACCOUNT_SJ;

select * from review_info_sjsj where review_nickname='John123';

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


select *
from REVIEW_INFO ri, REVIEW_IMAGE rimg where ri.review_no = rimg.REVIEW_NO and ri.review_shop = 5;
select * from REVIEW_IMAGE;
select  * from REVIEW_Info;


SELECT review_shop, review_content, review_date, review_nickname, shop_name FROM review_info_sjsj r, shop_info_sj s
                    WHERE
                    r.REVIEW_SHOP = s.SHOP_NO and
                    r.review_nickname = '조조';
SELECT review_shop, review_content, review_date, review_nickname, shop_name
   FROM review_info_sjsj r, shop_info_sj s WHERE r.REVIEW_SHOP = s.SHOP_NO and r.review_nickname = '조조';
select * from USER_ACCOUNT_SJ;
SELECT shop_name, scrap_date, shop_image, scrap_email, shop_addr, shop_tel, shop_content, shop_opentime FROM scrap_shop_sj, shop_info sj, shop_image_sj WHERE scrap_email = 'user2@example.com';

select * from MENU_INFO;

select * from user_account_sj where user_email='user2@example.com';

select * from SHOP_INFO;
insert into shop_info values ('8','jj@naver.com','지원이네', '홋카이도삿포로', '02-1111-1111', '홋카이도', '연중무휴/10/10', '도오');
insert into SHOP_IMAGE values('8', 'mise8.jpg', 'main');

insert into SHOP_IMAGE values('3', 'img1.jpg','main');
insert into SHOP_IMAGE values('3', 'img1-1.jpg','sub');
insert into SHOP_IMAGE values('3', 'img1-2.jpg','sub');
insert into SHOP_IMAGE values('3', 'img1-3.jpg','sub');
select *from SHOP_IMAGE where shop_no = 3 order by image_type;
select *from SHOP_INFO;
select *from SHOP_IMAGE;
insert into SHOP_IMAGE values ('21','suzuki.jpg','main');
insert into SHOP_IMAGE values ('22','eye_catch_ramen.jpg','main');
insert into SHOP_IMAGE values ('23','eye_catch_ramen.jpg','main');
insert into SHOP_IMAGE values ('24','eye_catch_ramen.jpg','main');
insert into SHOP_IMAGE values ('25','eye_catch_ramen.jpg','main');
insert into SHOP_IMAGE values ('28','Shoyu_ramen.jpg','main');
insert into SHOP_IMAGE values ('7','asianbar.jpg','main');
insert into SHOP_IMAGE values ('26','testimage.jpg','main');
insert into SHOP_IMAGE values ('27','testimage.jpg','main');


select *from REVIEW_IMAGE;
select *from REVIEW_INFO;
insert into REVIEW_IMAGE values ('8', 'Shoyu_ramen.jpg');

select si.*, simg.* from shop_info si, SHOP_IMAGE simg where si.shop_no = simg.shop_no and si.shop_no=5;



SELECT si.shop_no, si.shop_owner, si.shop_name, si.shop_addr, si.shop_tel, si.shop_content, si.shop_opentime, si.shop_addrtype,
                          si2.shop_image AS main_image, si3.shop_image AS sub_image
                    FROM shop_info si
                    LEFT JOIN shop_image si2 ON si.shop_no = si2.shop_no AND si2.image_type = 'main'
                LEFT JOIN shop_image si3 ON si.shop_no = si3.shop_no AND si3.image_type = 'sub';


