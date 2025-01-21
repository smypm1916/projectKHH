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

create table RESERVATION_INFO_sj(
    RESERVATION_NO NUMBER(3) primary key,
        RESERVATION_SHOP NUMBER(3) not null,
    RESERVATION_EMAIL VARCHAR2(20 char) not null,
    RESERVATION_NAME VARCHAR2(20 char) not null,
    RESERVATION_TEL VARCHAR2(20 char) not null,
    RESERVATION_DATE VARCHAR2(20 char) not null,
    RESERVATION_PEOPLE NUMBER(3)
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
             1,
             101,
             'example@email.com',
             'John Doe',
             '010-1234-5678',
             '2025-01-20',
             4
         );




create table SCRAP_SHOP_sj (
    SCRAP_NO NUMBER(3) primary key ,
    SCRAP_EMAIL varchar2(20 char) not null,
    SCRAP_SHOP NUMBER(3) not null,
    SCRAP_DATE DATE not null
);

INSERT INTO SCRAP_SHOP_sj (SCRAP_NO, SCRAP_EMAIL, SCRAP_SHOP, SCRAP_DATE)
VALUES (1, 'user@example.com', 101, TO_DATE('2025-01-16', 'YYYY-MM-DD'));



create table REVIEW_INFO_sjsj (
    REVIEW_NO NUMBER(3) PRIMARY KEY ,
    REVIEW_SHOP NUMBER(3) not null,
    REVIEW_CONTENT VARCHAR2(1000 CHAR) not null ,
    REVIEW_DATE DATE not null,
    REVIEW_NICKNAME VARCHAR2(20 CHAR) not null,
    REVIEW_STAR NUMBER(3) not null
);
INSERT INTO REVIEW_INFO_sjsj (REVIEW_NO, REVIEW_SHOP, REVIEW_CONTENT, REVIEW_DATE, REVIEW_NICKNAME, REVIEW_STAR)
VALUES (1, 101, 'Great shop!', TO_DATE('2025-01-16', 'YYYY-MM-DD'), 'John123', 5);

insert into REVIEW_INFO_sjsj values ('2','2','존맛탱 홍게집','2025-03-03','조조','4');
insert into REVIEW_INFO_sjsj values ('3','3','존맛탱 고구마집','2025-03-05','조망망','2');

INSERT INTO SHOP_IMAGE values (3, 'aa.img','main');

update RESERVATION_INFO_sj set RESERVATION_SHOP = 3 where reservation_no = 1;



SELECT
    ri.reservation_date,
    ri.reservation_people,
    si.shop_name,
    si_img.shop_image
FROM
    reservation_info_sj ri,
    shop_info si,
    shop_image si_img
WHERE
    ri.reservation_email = 'example@email.com'
  AND ri.reservation_shop = si.shop_no
  AND si.shop_no = si_img.shop_no;

select * from RESERVATION_INFO_SJ;
select * from SCRAP_SHOP_SJ;
select * from REVIEW_INFO_sjsj;

select * from USER_ACCOUNT_SJ;

select * from review_info_sjsj where review_nickname='John123';