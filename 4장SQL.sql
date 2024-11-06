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