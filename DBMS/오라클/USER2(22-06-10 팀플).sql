CREATE TABLE tbl_users(
    username VARCHAR2(20) PRIMARY KEY,
	password nVARCHAR2(125) NOT NULL,
	email VARCHAR2(125),
	name nVARCHAR2(125),
	role VARCHAR2(5)
);

DESC tbl_users;

INSERT ALL
INTO tbl_users(username, password)
VALUES('username001', 'password001')

INTO tbl_users(username, password)
VALUES('username002', 'password002')

SELECT * FROM DUAL;

SELECT * FROM tbl_users;

