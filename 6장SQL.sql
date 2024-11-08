USE market_db;
CREATE TABLE table1 (
	col1 INT PRIMARY KEY,
    col2 INT,
    col3 INT
);

SHOW INDEX FROM table1;
CREATE TABLE member(
	mem_id VARCHAR(8),
    mem_name VARCHAR(10),
    mem_number INT,
    addr CHAR(2)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');

SELECT * FROM member ORDER BY mem_number DESC;

ALTER TABLE member
	ADD CONSTRAINT
	PRIMARY KEY(mem_id);
    
SELECT * FROM member;
SHOW INDEX FROM member;

SELECT * FROM member;
SHOW INDEX FROM member;
SHOW TABLE STATUS LIKE 'member';

DESC member;

CREATE INDEX idx_member_addr
	 ON member(addr);

SHOW INDEX FROM member;

ANALYZE TABLE member;

CREATE UNIQUE INDEX idx_member_mem_name
	ON member(mem_name); -- ERROR

INSERT INTO member VALUES('MOO', '마마무', 2, '태국', '001', '12341234', 15, '2020.10.10');

SELECT * FROM member;
SELECT mem_name FROM member WHERE mem_id = 'MMU';

CREATE INDEX idx_member_mem_number
	ON member(mem_number);

ANALYZE TABLE member;

SELECT mem_name, mem_number
	FROM member
	WHERE mem_number >= 1;