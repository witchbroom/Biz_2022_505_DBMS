CREATE DATABASE bootDB;
USE bootDB;
DESC tbl_users;

INSERT INTO tbl_users(username, password)
VALUES('user123', '12341234');
SELECT * FROM tbl_users;

USE mydb;
SELECT * FROM tbl_emrs;
DROP TABLE tbl_emrs;
DROP TABLE tbl_dise;

CREATE TABLE IF NOT EXISTS tbl_emrs(
	seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	name	VARCHAR(10),
	age	BIGINT,
	sex	VARCHAR(10),
	dcode	VARCHAR(20),
	karte	VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tbl_dise(
	code VARCHAR(10) PRIMARY KEY,
    dis VARCHAR(25) NOT NULL
);

SELECT * FROM tbl_dise;

SELECT tbl_emrs.seq, tbl_emrs.name, tbl_emrs.age, tbl_emrs.sex, tbl_emrs.dcode, tbl_dise.dis
FROM tbl_emrs
LEFT JOIN tbl_dise ON tbl_emrs.dcode = tbl_dise.code;



INSERT INTO tbl_dise (code, dis) VALUES ('A00', '콜레라');
INSERT INTO tbl_dise (code, dis) VALUES ('A01', '장티푸스 및 파라티푸스');
INSERT INTO tbl_dise (code, dis) VALUES ('A03', '이질');
INSERT INTO tbl_dise (code, dis) VALUES ('A15', '결핵');
INSERT INTO tbl_dise (code, dis) VALUES ('A22', '탄저병');
INSERT INTO tbl_dise (code, dis) VALUES ('A30', '한센병');
INSERT INTO tbl_dise (code, dis) VALUES ('A50', '매독');
INSERT INTO tbl_dise (code, dis) VALUES ('A54', '임질');
INSERT INTO tbl_dise (code, dis) VALUES ('A75', '발진티푸스');
INSERT INTO tbl_dise (code, dis) VALUES ('A80', '소아마비');
INSERT INTO tbl_dise (code, dis) VALUES ('B01', '수두');
INSERT INTO tbl_dise (code, dis) VALUES ('B02', '대상포진');
INSERT INTO tbl_dise (code, dis) VALUES ('B04', '원숭이두창');
INSERT INTO tbl_dise (code, dis) VALUES ('B15', '바이러스성 간염');
INSERT INTO tbl_dise (code, dis) VALUES ('B20', '인체면역결핍성 바이러스(HIV)');
INSERT INTO tbl_dise (code, dis) VALUES ('B30', '바이러스성 결막염');
INSERT INTO tbl_dise (code, dis) VALUES ('B35', '피부사상균증(무좀)');
INSERT INTO tbl_dise (code, dis) VALUES ('B50', '말라리아');
INSERT INTO tbl_dise (code, dis) VALUES ('B68', '조충증');
INSERT INTO tbl_dise (code, dis) VALUES ('B85', '이감염증');
INSERT INTO tbl_dise (code, dis) VALUES ('B87', '구더기증');
INSERT INTO tbl_dise (code, dis) VALUES ('C05', '구강암');
INSERT INTO tbl_dise (code, dis) VALUES ('C15', '식도암');
INSERT INTO tbl_dise (code, dis) VALUES ('C16', '위암');
INSERT INTO tbl_dise (code, dis) VALUES ('C18', '대장암');
INSERT INTO tbl_dise (code, dis) VALUES ('C25', '췌장암');
INSERT INTO tbl_dise (code, dis) VALUES ('C32', '후두암');
INSERT INTO tbl_dise (code, dis) VALUES ('C34', '폐암');
INSERT INTO tbl_dise (code, dis) VALUES ('C38', '심장암');
INSERT INTO tbl_dise (code, dis) VALUES ('C50', '유방암');
INSERT INTO tbl_dise (code, dis) VALUES ('C73', '갑상선암');
INSERT INTO tbl_dise (code, dis) VALUES ('D66', '혈우병');
INSERT INTO tbl_dise (code, dis) VALUES ('E00', '갑상선기능저하증');
INSERT INTO tbl_dise (code, dis) VALUES ('E10', '당뇨병');
INSERT INTO tbl_dise (code, dis) VALUES ('E66', '비만');
INSERT INTO tbl_dise (code, dis) VALUES ('F00', '알츠하이머병에서의 치매');
INSERT INTO tbl_dise (code, dis) VALUES ('F20', '조현병(정신분열증)');
INSERT INTO tbl_dise (code, dis) VALUES ('G00', '뇌수막염');
INSERT INTO tbl_dise (code, dis) VALUES ('G56', '손목터널증후군');
INSERT INTO tbl_dise (code, dis) VALUES ('H00', '다래끼');
INSERT INTO tbl_dise (code, dis) VALUES ('H40', '녹내장');
INSERT INTO tbl_dise (code, dis) VALUES ('I20', '협심증');
INSERT INTO tbl_dise (code, dis) VALUES ('I80', '심부정맥혈전증');
INSERT INTO tbl_dise (code, dis) VALUES ('J00', '감기');
INSERT INTO tbl_dise (code, dis) VALUES ('J45', '천식');
INSERT INTO tbl_dise (code, dis) VALUES ('J93', '기흉');
