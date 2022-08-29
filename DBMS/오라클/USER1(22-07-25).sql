USE schoolDB;
CREATE TABLE tbl_student(
st_num	VARCHAR(5)		PRIMARY KEY,
st_name	VARCHAR(20)	NOT NULL,
st_dept	VARCHAR(20),
st_grade	INT,
st_tel	VARCHAR(15)	NOT NULL,
st_addr	VARCHAR(125)
);

SELECT COUNT(*) FROM tbl_student;

SELECT * FROM tbl_student;

CREATE TABLE tbl_subject(
sb_code	VARCHAR(5)	NOT NULL	PRIMARY KEY,
sb_name	VARCHAR(25)	NOT NULL
);
INSERT INTO tbl_subject(sb_code, sb_name)
VALUES
('SB001','국어'),
('SB002','데이터베이스'),
('SB003','미술'),
('SB004','소프트웨어공학'),
('SB005','수학'),
('SB006','영어영문'),
('SB007','음악');

SELECT * FROM tbl_subject;

-- 성적이 저장될 table
-- 학생정보와 과목정보가 함께 연동되어 점수를 관리하는 table
-- sc_seq 임의의 칼럼을 만들어 PK로 삼고
-- 학번 + 과목코드가 동시에 같은 코드가 중복되지 않도록
-- UNIQUE(학번, 과목코드) 설정
CREATE TABLE tbl_score(
sc_seq	BIGINT		PRIMARY KEY	AUTO_INCREMENT,
sc_stnum	VARCHAR(5)	NOT NULL,
sc_sbcode	VARCHAR(5)	NOT NULL,
sc_score	INT,
UNIQUE(sc_stnum, sc_sbcode)
);
SELECT * FROM tbl_score;

-- tbl_score 데이터에서 점수가 70점 이하인 데이터만 추출
-- 학번순으로 리스트를 나열하기
-- Selection : 조건절(WHERE)을 추가하여 조건에 맞는 데이터만 찾기
SELECT * FROM tbl_score
WHERE sc_score <= 70
ORDER BY sc_stnum;

-- tbl_score 데이터에서 전체데이터를 표시하되 과목코드, 점수 칼럼만 표시되도록
SELECT sc_sbcode, sc_score FROM tbl_score;

-- Projection
-- table 많은 칼럼(속성 Attribute, 필드field)이 있을 경우
-- 필요한 칼럼만 나열하고 리스트를 보고자 할 때
SELECT sc_sbcode AS 과목코드, sc_score AS 점수
FROM tbl_score;

-- tbl_score 데이터에서 점수가 50점 이상 70점 이하인 데이터
-- 과목코드와 점수만 보이도록
SELECT sc_sbcode, sc_score FROM tbl_score
WHERE 50<= sc_score AND sc_score <= 70;

-- 범위를 지정할 때 이상 AND 이하일 경우 BETWEEN 을 사용할 수 있다
SELECT sc_sbcode, sc_score FROM tbl_score
WHERE sc_score BETWEEN 50 AND 70;

-- tbl_score table의 데이터를 참조하여
-- 과목별 전체 총점을 구하시오
SELECT SUM(sc_score)
FROM tbl_score
GROUP BY sc_sbcode;

-- 점수가 50 이상 70 이하인 데이터
-- tbl_subject table 과 연결하여
-- 과목코드, 과목명, 점수 칼럼이 보이도록

-- 점수가 50 ~ 70 인 데이터를 Selection
-- 과목코드, 과목명, 점수를 표현
-- tbl_student table 을 JOIN 하고
-- 학번, 학생이름, 과목코드, 과목명, 점수를 Projection
-- 학번 순으로 정렬하기
SELECT tbl_student.st_num, tbl_student.st_name, tbl_score.sc_sbcode, tbl_subject.sb_name, tbl_score.sc_score FROM tbl_score
LEFT JOIN tbl_subject ON tbl_score.sc_sbcode = tbl_subject.sb_code
LEFT JOIN tbl_student ON tbl_score.sc_stnum = tbl_student.st_num
WHERE sc_score BETWEEN 50 AND 70
ORDER BY sc_stnum;

-- tbl_score table에서 과목별 총점 구하기
-- GROUP BY SUM, AVG 등 통계함수를 사용하여 Selection
SELECT sc_sbcode AS 과목코드, SUM(sc_score) AS 총점, AVG(sc_score) AS 평균
FROM tbl_score
GROUP BY sc_sbcode;

-- 과목명을 함께 Projection 하기
-- 통계함수로 묶지 않은 코드는 GROUP BY에 표시해야 함
SELECT sc_sbcode AS 과목코드, tbl_subject.sb_name AS 과목명, SUM(sc_score) AS 총점, AVG(sc_score) AS 평균
FROM tbl_score
LEFT JOIN tbl_subject ON tbl_score.sc_sbcode = tbl_subject.sb_code
GROUP BY sc_sbcode, sb_name;

-- 학생별로 총점, 평균 구하기
-- 학번, 이름, 총점, 평균 Projection
-- 학번순으로 정렬
SELECT tbl_student.st_num AS 학번, tbl_student.st_name AS 이름, SUM(tbl_score.sc_score) AS 총점, AVG(tbl_score.sc_score) AS 평균
FROM tbl_score
LEFT JOIN tbl_student ON tbl_score.sc_stnum = tbl_student.st_num
GROUP BY tbl_student.st_name
ORDER BY sc_stnum;

SELECT st_num, st_name, sc_sbcode, sc_score
FROM tbl_student ST
LEFT JOIN tbl_score SC
ON ST.st_num = SC.sc_stnum;

-- tbl_score 테이블에서 각 학생들의 SB002(데이터베이스) 과목 점수만
-- 학번	데이터베이스점수(SB002)
-- S0001	90
-- S0002	70
SELECT st_num, st_name, sc_sbcode, sc_score
FROM tbl_student ST
LEFT JOIN tbl_score SC
ON ST.st_num = SC.sc_stnum
WHERE sc_sbcode = 'SB002';

SELECT sc_stnum,
	SUM(IF(sc_sbcode = 'SB002',sc_score,0)) AS 국어
FROM tbl_score
GROUP BY sc_stnum;

use schooldb;
DESC tbl_student;


-- workdb start
CREATE DATABASE workdb;
use workdb;

CREATE TABLE tbl_books(
bk_isbn	INT		PRIMARY KEY,
bk_name	VARCHAR(50)	NOT NULL,
bk_publisher	VARCHAR(5)	NOT NULL,	
bk_author	VARCHAR(5)	NOT NULL,	
bk_pubdate	VARCHAR(10)	NOT NULL,	
bk_pubdatevar	VARCHAR(10)	NOT NULL,	
bk_page	INT	NOT NULL,	
bk_price	INT	NOT NULL	
);

INSERT INTO tbl_books(bk_isbn, bk_name, bk_publisher, bk_author, bk_pubdate, bk_pubdatevar, bk_page, bk_price)
VALUES
('97950100','데스 바이 아마존', 'C0001', 'A0001', '2019-01-01', '2019-01-01', '200', '10000'), 
('97950101','데스 바이 사바나', 'C0002', 'A0002', '2019-01-02', '2019-01-02', '210', '11000'), 
('97950102','데스 바이 쿠팡', 'C0003', 'A0003', '2019-01-03', '2019-01-03', '220', '12000'), 
('97950103','데스 바이 사하라', 'C0004', 'A0004', '2019-01-04', '2019-01-04', '230', '13000'), 
('97950104','데스 바이 나이아가라', 'C0005', 'A0005', '2019-01-05', '2019-01-05', '240', '14000'), 
('97950105','데스 바이 솔트', 'C0006', 'A0006', '2019-01-06', '2019-01-06', '250', '15000'), 
('97950106','데스 바이 루마니아', 'C0007', 'A0007', '2019-01-07', '2019-01-07', '260', '16000'), 
('97950107','데스 바이 인디', 'C0008', 'A0008', '2019-01-08', '2019-01-08', '270', '17000'), 
('97950108','데스 바이 하이판', 'C0009', 'A0009', '2019-01-09', '2019-01-09', '280', '18000'), 
('97950109','데스 바이 빅토리아', 'C0010', 'A0010', '2019-01-10', '2019-01-10', '290', '19000');

SELECT * FROM tbl_books;

CREATE TABLE tbl_pubinfo(
pb_publisher	VARCHAR(5)		PRIMARY KEY,
pb_pub	VARCHAR(15)	NOT NULL,	
pb_repre	VARCHAR(5)	NOT NULL,	
pb_tel	VARCHAR(15),		
pb_addr	VARCHAR(30)		
);

INSERT INTO tbl_pubinfo(pb_publisher, pb_pub, pb_repre, pb_tel, pb_addr)
VALUES
('C0001', '아마존북스', '아마존', '010-123-1111', '아마존익스프레스'),
('C0002', '사바나북스', '사바나', '010-123-1112', '사바나지대'),
('C0003', '쿠팡북스', '쿠팡', '010-123-1113', '쿠팡센터'),
('C0004', '사하라북스', '사하라', '010-123-1114', '사하라사막'),
('C0005', '나이아가라북스', '나이아가라', '010-123-1115', '나이아가라폭포'),
('C0006', '솔트북스', '솔트', '010-123-1116', '솔트레이크시티'),
('C0007', '루마니아북스', '루마니아', '010-123-1117', '드라큘라의 성'),
('C0008', '인디북스', '인디', '010-123-1118', '갠지스강 유역'),
('C0009', '하이판북스', '하이판', '010-123-1119', '하이판 고개'),
('C0010', '빅토리아북스', '빅토리아', '010-123-1120', '글로리 빅토리아');

SELECT * FROM tbl_pubinfo;

CREATE TABLE tbl_auinfo(
au_bkauthor	VARCHAR(5)		PRIMARY KEY,
au_name	VARCHAR(10)	NOT NULL,
au_tel	VARCHAR(15)	NOT NULL,	
au_addr	VARCHAR(30)	NOT NULL
);

INSERT INTO tbl_auinfo(au_bkauthor, au_name, au_tel, au_addr)
VALUES
('A0001', '탐험가', '010-456-1111', '남미'),
('A0002', '야생동물 밀렵꾼', '010-456-1112', '오스트레일리아'),
('A0003', '쿠팡맨', '010-456-1113', '한국'),
('A0004', '현지인', '010-456-1114', '아프리카'),
('A0005', '여행자', '010-456-1115', '캐나다'),
('A0006', '상인', '010-456-1116', '미국'),
('A0007', '백작', '010-456-1117', '루마니아'),
('A0008', '크샤트리아', '010-456-1118', '인도'),
('A0009', '응우옌', '010-456-1119', '베트남'),
('A0010', '브리티쉬', '010-456-1120', '그레이트브리튼');

SELECT * FROM tbl_auinfo;

SELECT bk_isbn AS ISBN, bk_name AS 도서명, tbl_pubinfo.pb_pub AS 출판사명, tbl_pubinfo.pb_repre AS 출판사대표, tbl_auinfo.au_name AS 저자, tbl_auinfo.au_tel AS 저자연락처, bk_pubdate AS 출판일, bk_price AS 가격, bk_page AS 페이지
FROM tbl_books
LEFT JOIN tbl_pubinfo ON tbl_books.bk_publisher = tbl_pubinfo.pb_publisher
LEFT JOIN tbl_auinfo ON tbl_books.bk_author = tbl_auinfo.au_bkauthor
ORDER BY bk_isbn;