USE market_db;
DROP PROCEDURE IF EXISTS user_proc;
DELIMITER $$
CREATE PROCEDURE user_proc()
BEGIN
	SELECT * FROM member;
END $$
DELIMITER ;

CALL user_proc();
DROP PROCEDURE user_proc;

SELECT mem_name FROM member;
DELIMITER $$
CREATE PROCEDURE user_proc1(IN userName VARCHAR(20))
BEGIN
	SELECT * FROM member WHERE mem_name = userName;
END$$
DELIMITER ;

CALL user_proc1('잇지');

DELIMITER $$
CREATE PROCEDURE user_proc2(
	IN userNumber INT,
	IN userHeight INT)
BEGIN
	SELECT * FROM member
	WHERE mem_number > userNumber AND height > userHeight;
END $$
DELIMITER ;

CALL user_proc2(6, 165);

CREATE TABLE IF NOT EXISTS noTable(
	id INT AUTO_INCREMENT PRIMARY KEY,
	txt VARCHAR(10)
);

DELIMITER $$
CREATE PROCEDURE user_proc3(
	IN txtValue VARCHAR(10),
	OUT outValue INT)
BEGIN
	INSERT INTO noTable VALUES(NULL, txtValue);
    SELECT MAX(id) INTO outValue FROM noTable;
END $$
DELIMITER ;

CALL user_proc3('테스트1', @myValue);
SELECT CONCAT('입력된ID값=>', @myValue) AS 'test';

DROP PROCEDURE ifelse_proc;
DELIMITER $$
CREATE PROCEDURE ifelse_proc(
	IN memName VARCHAR(10)
)
BEGIN
	DECLARE debutYear INT;
	SELECT YEAR(debut_date) INTO debutYear FROM member
		WHERE mem_name = memName;
	IF(debutYear >= 2015) THEN
		SELECT '신인 가수네요. 화이팅 하세요.' AS '메세지';
	ELSE
		SELECT '고참 가수네요. 그동안 수고하셨어요' AS '메세지';
	END IF;
END $$
DELIMITER ;

SELECT mem_name, debut_date FROM member;
CALL ifelse_proc('티아라');

DELIMITER $$
CREATE PROCEDURE while_proc()
BEGIN
	DECLARE hap INT;
    DECLARE num INT;
    SET hap = 0;
    SET num = 1;
    
    WHILE(num<=100) DO
		SET hap = hap + num;
        SET num = num + 1;
	END WHILE;
    SELECT hap AS '1~100 합계';
END $$
DELIMITER ;

CALL while_proc();user_proc2

DELIMITER $$
CREATE PROCEDURE dynamic_proc(
	IN tableName VARCHAR(20)
)
BEGIN
	SET @sqlQuery = CONCAT('SELECT * FROM ', tableName);
	PREPARE myQuery FROM @sqlQuery;
	EXECUTE myQuery;
	DEALLOCATE PREPARE myQuery;
END $$
DELIMITER ;

DROP PROCEDURE dynamic_proc;
CALL dynamic_proc('member');

-- TRIGGER

USE market_db;
CREATE TABLE IF NOT EXISTS trigger_table(
	id INT,
    txt VARCHAR(10)
);
INSERT INTO trigger_table VALUES(1, '레드벨벳'); 
INSERT INTO trigger_table VALUES(2, '잇지'); 
INSERT INTO trigger_table VALUES(3, '블랙핑크'); 
SELECT * FROM trigger_table;

DELIMITER $$
CREATE TRIGGER myTrigger
	AFTER DELETE
    ON trigger_table
    FOR EACH ROW
BEGIN
	SET @msg = '가수 그룹이 삭제됨';
END $$
DELIMITER ;

SET @msg = '';
INSERT INTO trigger_table VALUES(4, '마마무');
SELECT @msg;
UPDATE trigger_table SET txt = '블핑' WHERE id=3;
SELECT @msg;
DELETE FROM trigger_table WHERE id=4;
SELECT @msg; 


CREATE TABLE singer(SELECT mem_id, mem_name, mem_number, addr FROM member);
SELECT * FROM singer;

CREATE TABLE backup_singer(
	mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    mem_number INT NOT NULL,
    addr CHAR(2) NOT NULL,
    modType CHAR(2),
    modDate DATE,
    modUser VARCHAR(30)
); 

DELIMITER $$
CREATE TRIGGER singer_updateTrg
	AFTER UPDATE
    ON singer
    FOR EACH ROW
BEGIN
	INSERT INTO backup_singer VALUES(OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr, '수정', CURDATE(), CURRENT_USER());
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER singer_deleteTrg
	AFTER DELETE
    ON singer
    FOR EACH ROW
BEGIN
	INSERT INTO backup_singer VALUES(OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr, '삭제', CURDATE(), CURRENT_USER());
END $$
DELIMITER ;

UPDATE singer SET addr='영국' WHERE mem_id='BLK';
DELETE FROM singer WHERE mem_number >= 7;

SELECT * FROM backup_singer;