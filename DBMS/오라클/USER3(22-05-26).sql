-- USER3
INSERT INTO tbl_student(st_num, st_name, st_grade, st_addr, st_tel);

CREATE TABLE tbl_user(
    username VARCHAR2(10) PRIMARY KEY,
    password VARCHAR2(120) NOT NULL,
    name nVARCHAR2(20),
    email VARCHAR2(125),
    role VARCHAR2(10)
);