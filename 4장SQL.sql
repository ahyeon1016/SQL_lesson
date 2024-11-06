USE market_db;

SET @myVar1 = 10;
SET @myVar2 = 4.25;
SET @myVar = null;

SELECT * FROM member;

SELECT @myVar1;
SELECT @myVar1+@myVar2;

SET @txt = '가수 이름=>';
SET @height = 166;

SELECT @txt, mem_name, height 
	FROM member
	WHERE height > @height;
    
SET @count=3;
PREPARE mySQL 
	FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';

EXECUTE mySQL 
	USING @count;
    
SELECT CONVERT(AVG(price), SIGNED) AS '평균 가격' 
	FROM buy; 

SELECT CAST(AVG(price) AS SIGNED) AS '평균 가격' 
	FROM buy;
    
SELECT CAST('2022%10%12' AS DATE) AS '날짜';
SELECT CAST('2022*12*12' AS DATE) AS '날짜';
SELECT CONVERT('2021/10/23', DATE) AS '날짜';
SELECT CONVERT('2010^12@04', DATE) AS '날짜';
SELECT CONVERT('2014!@#!!12$#12', DATE) AS '날짜';
SELECT CAST('2013!##3#@$@3' AS DATE) AS 'DATE';

SELECT num, CONCAT(CONVERT(price, CHAR), 'X', CAST(amount AS CHAR), '=')
	AS '가격X수량', price*amount AS '구매액'
    FROM buy;

SELECT '100' + '200';
SELECT CONCAT(100, '200');
SELECT '100' + 200;

SELECT * FROM member;

SELECT *
	FROM buy
		INNER JOIN member
		ON buy.mem_id = member.mem_id
	WHERE buy.mem_id IN('GRL', 'MMU'); 
    
SELECT buy.mem_id, mem_name, addr, CONCAT(phone1, phone2) AS '연락처'
	FROM buy
		INNER JOIN member
		ON buy.mem_id = member.mem_id;
        
SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, CONCAT(M.phone1, M.phone2) AS '연락처'
	FROM buy AS B
		INNER JOIN member AS M
		ON B.mem_id = M.mem_id
	ORDER BY M.mem_id;
    
---------------------------------
SELECT mem_id ,prod_name FROM buy;

SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
	FROM member M
		LEFT OUTER JOIN buy B
        ON M.mem_id = B.mem_id
	ORDER BY M.mem_id;

SELECT *
	FROM member M
		INNER JOIN buy B
        ON	M.mem_id = B.mem_id;

SELECT *	
	FROM member M
		LEFT JOIN buy B
        ON	M.mem_id = B.mem_id;
        
SELECT *
	FROM member M
		RIGHT JOIN buy B
        ON	M.mem_id = B.mem_id;
        
SELECT debut_date FROM member;

DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
	DECLARE debutDate DATE;
    DECLARE curDate DATE;
    DECLARE days INT;

	SELECT debut_date INTO debutDate
		FROM market_db.member
        WHERE mem_id = 'APN';
	
    SET curDate = CURRENT_DATE();
    SET days = DATEDIFF(curDate, debutDate);
    
    IF(days/365) >=5 THEN
		SELECT CONCAT('데뷔한 지', days, '일이나 지났습니다. 핑순이들 축하합니다!.') AS 'ㅇㅁㄴㅇ';
	ELSE 
		SELECT CONCAT('데뷔한지', days, '일 밖세 안되었네요. 핑순이들 화이팅!') AS 'sadasd';
	END IF;
END $$
DELIMITER ; 
CALL ifProc3();

SELECT mem_id, SUM(price*amount) AS '총 구매액'
	FROM buy
    GROUP BY mem_id;
    
SELECT mem_id, SUM(price*amount) AS '총 구매액'
	FROM buy
    GROUP BY mem_id
	ORDER BY SUM(price*amount) DESC;

SELECT B.mem_id, M.mem_name, SUM(price*amount) AS '총 구매액'
	FROM buy B
		INNER JOIN member M
        ON B.mem_id = M.mem_id
    GROUP BY B.mem_id
	ORDER BY SUM(price*amount) DESC;
    
SELECT M.mem_id, M.mem_name, SUM(price*amount) AS '총 구매액'
	FROM buy B
		RIGHT OUTER JOIN member M
        ON B.mem_id = M.mem_id
    GROUP BY M.mem_id
	ORDER BY SUM(price*amount) DESC;

SELECT M.mem_id, M.mem_name, SUM(price*amount) AS '총 구매액',
		CASE
			WHEN (SUM(price*amount) >= 1500) THEN '최우수 고객'
            WHEN (SUM(price*amount) >= 1000) THEN '우수 고객'
            WHEN (SUM(price*amount) >= 1) THEN '일반 고객'
            ELSE '유령 고객'
		END AS '회원 등급'
	FROM buy B
		RIGHT OUTER JOIN member M
        ON B.mem_id = M.mem_id
    GROUP BY M.mem_id
	ORDER BY SUM(price*amount) DESC;
    