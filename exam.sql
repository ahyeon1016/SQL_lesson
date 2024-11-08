CREATE DATABASE exam;
USE exam;

CREATE TABLE exam1(
	mem_id VARCHAR(12) PRIMARY KEY,
    mem_name VARCHAR(10) NOT NULL,
    age INT,
    tier VARCHAR(10) NOT NULL,
    job VARCHAR(10),
    point INT NULL DEFAULT 0
);
DESC exam1;

CREATE TABLE exam2(
	num VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    amount INT CHECK (amount >= 0 AND amount <= 10000), 
    price INT,
    company VARCHAR(20)
);
DESC exam2;

CREATE TABLE exam3(
	mem_num VARCHAR(10) PRIMARY KEY,
    mem_id VARCHAR(12),
    obj VARCHAR(10),
    amount INT,
    addr VARCHAR(20),
	date DATE,
    FOREIGN KEY(mem_id) REFERENCES exam1(mem_id),
	FOREIGN KEY(obj) REFERENCES exam2(num)
);
DESC exam3;

ALTER TABLE exam1 ADD reg_date DATE; 
ALTER TABLE exam2 DROP price;