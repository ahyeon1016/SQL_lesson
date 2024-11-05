--  DDL : 데이터베이스 생성하기(CREATE)
CREATE DATABASE shop_db;
USE shop_db;

-- DDL : 데이터베이스 조회하기(READ)
SHOW DATABASES;

-- DDL : 데이터이스 수정하기(UPDATE)
-- ALTER DATABASE shop_db RENAME TO shop_dd;
-- ALTER DATABASE shop_db DEFAULT ;

-- DDL : 데이터베이스 삭제하기(DELETE)
DROP DATABASE shop_db ;
 
-- DDL : 테이블 생성
CREATE TABLE member (
	member_id VARCHAR(8) NOT NULL PRIMARY KEY,
    member_name VARCHAR(5) NOT NULL,
    member_addr VARCHAR(20)
)DEFAULT CHARSET=UTF8;

-- DDL : 테이블 삭제
DROP TABLE member;

-- DDL : 테이블 읽어오기
DESC member;

-- DDL : 테이블 수정하기 

--


CREATE TABLE products(
	product_name VARCHAR(4) NOT NULL PRIMARY KEY,
    cost INT NOT NULL,
    make_date DATE,
    company VARCHAR(5),
    amount INT NOT NULL 
);

DROP TABLE products;
DESC products;

------------------------------------------------------------------------------------------------------------------
-- DML
INSERT INTO member VALUES('tess','나훈아','경기 부천시 중동');
INSERT INTO member VALUES('hero','임영웅','서울 은평구 증산동');
INSERT INTO member VALUES('iyou','아이유','인천 남구 주안동');
INSERT INTO member VALUES('jyp','박진영','경기 고양시 장항동');

SELECT * FROM member;
-- 특정 컬럼만 추출하여 전체 행을 출력함
SELECT member_name, member_addr FROM member;
-- 하나 또는 복수의 행을 검색할 떄(전체행은 아님)
SELECT * FROM member WHERE member_id='tess';

INSERT INTO products VALUES('바나나',1500,'2021-07-01','델몬트',17);
INSERT INTO products VALUES('카스',2500,'2022-03-01','OB',3);
INSERT INTO products VALUES('삼각김밥',800,'2023-09-01','CJ',22);

SELECT * FROM products;

-------------------------------------------------------------------------------------------------------
CREATE DATABASE market_db;
-- USE 명령어를 사용하면 테이블 이름만 명시해도 된다.
USE market_db;
SHOW DATABASES;
-- USE 명령어를 사용하지 않으면 테이블 이름만으로 검색 불가능하다.
USE market_db;
CREATE TABLE member -- 회원 테이블
( mem_id  		CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  mem_name    	VARCHAR(10) NOT NULL, -- 이름
  mem_number    INT NOT NULL,  -- 인원수
  addr	  		CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  phone1		CHAR(3), -- 연락처의 국번(02, 031, 055 등)
  phone2		CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 평균 키
  debut_date	DATE  -- 데뷔 일자
);

CREATE TABLE buy -- 구매 테이블
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   mem_id  	CHAR(8) NOT NULL, -- 아이디(FK)
   prod_name 	CHAR(6) NOT NULL, --  제품이름
   group_name 	CHAR(4)  , -- 분류
   price     	INT  NOT NULL, -- 가격
   amount    	SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

SELECT * FROM member;
SELECT * FROM buy;

SELECT mem_name FROM member;	
SELECT mem_name AS '볣' FROM member;

SELECT addr AS 주소, debut_date AS 데뷔일자 , mem_name AS 멤버이름 
	FROM member 
	WHERE height=162;

SELECT * 
	FROM member 
	WHERE mem_name='블랙핑크';

SELECT * 
	FROM member
	WHERE mem_number=4;
    
SELECT mem_name, height, mem_number 
	FROM member 
	WHERE height >= 165 AND mem_number > 6;

SELECT mem_name, height, mem_number
	FROM member
    WHERE height BETWEEN 163 AND 165;

SELECT mem_name, addr
	FROM member
    WHERE addr IN('경기', '전남', '경남');
    
SELECT mem_name, addr
	FROM member
    WHERE addr IN('경', '전', '경');
    
SELECT * 
	FROM member
    WHERE mem_name LIKE '__핑_';
    
SELECT mem_id, mem_name, debut_date
	FROM member
    ORDER BY debut_date;
    
SELECT mem_id, mem_name, debut_date
	FROM member
    ORDER BY debut_date DESC;
    
SELECT mem_id, mem_name, debut_date, height
	FROM member
    WHERE height >= 164
    ORDER BY height DESC;
    
SELECT mem_name, debut_date 
	FROM member
	ORDER BY debut_date
	LIMIT 3;
    
SELECT mem_name, height
	FROM member 
    ORDER BY height DESC
    LIMIT 1, 4;
    
SELECT addr FROM member ORDER BY addr ;
SELECT DISTINCT addr FROM member;