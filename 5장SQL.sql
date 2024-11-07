CREATE DATABASE naver_db;
USE naver_db;
CREATE TABLE member (
	mem_id VARCHAR(3) PRIMARY KEY,
    mem_name VARCHAR(10) NOT NULL,
    mem_num INT NOT NULL,
    addr VARCHAR(5) NOT NULL,
    phone1 VARCHAR(3),
    phone2 CHAR(8),
    height INT UNSIGNED,
	debu_date DATE
);

CREATE TABLE buy (
	num INT AUTO_INCREMENT PRIMARY KEY,
    mem_id VARCHAR(3) NOT NULL,
    prod_name VARCHAR(6) NOT NULL,
    group_name VARCHAR(4),
    price INT UNSIGNED NOT NULL,
    amount INT UNSIGNED NOT NULL ,
    FOREIGN KEY(mem_id) REFERENCES member(mem_id) 
);

DROP TABLE member;

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


SELECT *
	FROM member;

SELECT *
	FROM buy;

-- PRIMARY KEY

DROP TABLE member;
CREATE TABLE member(
	mem_id VARCHAR(8) PRIMARY KEY,
    mem_name VARCHAR(8) NOT NULL,
    height INT
);

CREATE TABLE member(
	mem_id VARCHAR(8),
    mem_name VARCHAR(8) NOT NULL,
    height INT,
    PRIMARY KEY(mem_id)
);

CREATE TABLE member(
	mem_id VARCHAR(8),
    mem_name VARCHAR(8) NOT NULL,
    height INT
);

ALTER TABLE member 
	add CONSTRAINT
	PRIMARY KEY(mem_id); 
    
CREATE TABLE member(
	mem_id VARCHAR(8),
    mem_name VARCHAR(8) NOT NULL,
    height INT,
    CONSTRAINT PRIMARY KEY PK_member_mem_id(mem_id)
);

DESC member;
SELECT * FROM member;

-- FOREIGN KEY
DROP TABLE member;
DROP TABLE buy;
SELECT * FROM member;
SELECT * FROM buy;
CREATE TABLE member(
	mem_id VARCHAR(8) PRIMARY KEY,
    mem_name VARCHAR(8) NOT NULL,
    height INT
);

CREATE TABLE buy(
	num INT AUTO_INCREMENT PRIMARY KEY,
    mem_id VARCHAR(8) NOT NULL,
    prod_name VARCHAR(6) NOT NULL,
    FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

CREATE TABLE buy(
	num INT AUTO_INCREMENT PRIMARY KEY,
    mem_id VARCHAR(8) NOT NULL,
    prod_name VARCHAR(6) NOT NULL
);
ALTER TABLE buy
	ADD CONSTRAINT
	FOREIGN KEY(mem_id)
	REFERENCES member(mem_id);
    
INSERT INTO member VALUES('BLK', '블랙핑크', 164);
INSERT INTO buy VALUES(NULL, 'BLK', '지갑');
INSERT INTO buy VALUES(NULL, 'BLK', '맥북');

SELECT M.mem_id, M.mem_name, B.prod_name
	FROM buy B
		INNER JOIN member M
		ON B.mem_id = M.mem_id;
        
ALTER TABLE buy
	ADD CONSTRAINT
	FOREIGN KEY(mem_id) REFERENCES member(mem_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
    
UPDATE member SET mem_id='PINK' WHERE mem_id='BLK'; 
DELETE FROM member WHERE mem_id='PINK';

DESC buy;

CREATE TABLE member(
	mem_id VARCHAR(8) PRIMARY KEY,
    mem_name VARCHAR(8) NOT NULL,
    height INT,
    email VARCHAR(30) NULL UNIQUE
);

INSERT INTO member VALUES('BLK', '블랙핑크', 110, '010','pink@gamil.com');
INSERT INTO member VALUES('TWC', '트와이스', 167, NULL);
INSERT INTO member VALUES('APN', '에이핑크', 164, 'pink@gamil.com'); -- 이메일 중복

CREATE TABLE member(
	mem_id VARCHAR(8) PRIMARY KEY,
    mem_name VARCHAR(8) NOT NULL,
    height INT CHECK(height>=100),
    phone VARCHAR(3) NULL,
    email VARCHAR(30) NULL UNIQUE
);

ALTER TABLE member
	ADD CONSTRAINT
	CHECK(phone IN('02', '010'));

CREATE TABLE member(
	mem_id VARCHAR(8) PRIMARY KEY,
    mem_name VARCHAR(8) NOT NULL,
    height INT UNSIGNED NULL DEFAULT 100
);

DROP TABLE member;
INSERT INTO member(mem_id, mem_name) VALUES('BLe', 'dd');

ALTER TABLE member
ALTER COLUMN
mem_name SET DEFAULT '벫';

SELECT * FROM member;     

