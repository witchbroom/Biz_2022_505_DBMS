-- 여기는 USER2 화면

SELECT * FROM tbl_score;
/*
tbl_score 데이터는 한 학생의 과목점수가 각각 레코드별로 저장되어 있다
과목수가 늘어나면 학번, 과목명, 점수 형식으로 계속 저장해주면 된다.

실제 필요한 데이터는 학번, 과목명, 점수 칼럼인데 PK를 설정하기 위해 SEQ라는
칼럼이 추가된 상태

SEQ 칼럼이 없이 PK를 설정하려면 학번, 과목명으로 두개의 칼럼을 묶어서
PK로 해야한다.
다수의 칼럼을 묶음으로 PK를 설정하는 것을 Super Key 라고 한다.
필요에 따라 Super Key 로 PK 를 설정하기도 하지만 Super Key 는 잘못 사용하면
데이터 무결성을 해칠 수 있다
*/

UPDATE tbl_student SET sc_score = 90
WHERE sc_num = '1111' AND sc_subject = '국어'

DELETE FROM tbl_student
WHERE sc_num = '1111' AND sc_subject = '국어'

-- 4. 실행후 정확히 원하는 값으로 변경되었는지 확인
SELECT * FROM tbl_score WHERE sc_seq = 308;

-- 학생별로 성적 총점을 계산하자
SELECT sc_stnum, SUM(sc_score)
FROM tbl_score
GROUP BY sc_stnum;

-- 정규화되지 않고 각 과목별로 칼럼이 있는 table
SELECT sc_kor + sc_eng + sc_math FROM tbl_score;

-- 학생별로 성적 총점을 계산하고
-- 학번 순으로 정렬하자
SELECT sc_stnum, SUM(sc_score)
FROM tbl_score
GROUP BY sc_stnum
ORDER BY sc_stnum;

-- 성적조회를 하였는데 학번과 점수만 나타나서 누구인지(학생이름) 알수 없다
-- 두개 이상의 테이블을 서로 연동하여 데이터를 확인하기
-- JOIN 하여 데이터 검색
-- 1. tbl_score table 데이터를 전부 펼치고
-- 2. sc_stnum 칼럼과 sc_score 칼럼 데이터를 보여주면서
-- 3. tbl_score.sc_stnum 데이터를 가지고 tbl_student.st_num을 SELECT 한 후
-- 4. 일치하는 데이터가 있으면 st_name 칼럼을 가져와서 함께 보여라
SELECT
FROM tbl_score, tbl_student
WHERE sc_stnum = st_num;



/*
처음으로 데이터를 저장하기 위해서 할일
1. 등록된 사용자로 접속하기
2. 테이블 생성
*/

CREATE TABLE tbl_student (
	st_num	VARCHAR2(5)	PRIMARY KEY,
	st_name	nVARCHAR2(20)	NOT NULL,
	st_tel	VARCHAR2(15)	UNIQUE NOT NULL,
	st_addr	nVARCHAR2(125)	NULL,
	st_dept	nVARCHAR2(5)	NULL,
	st_grade	NUMBER(1)	NULL
);

-- DROP TABLE tbl_student;

-- tbl_student에 데이터 추가하기
-- 생성된 테이블에 데이터를 추가하는 행위를 Data Create라고 한다
INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept )
VALUES( '00001', '홍길동', '010-111-1111', '컴공과');

INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept )
VALUES( '00002', '이몽룡', '010-111-1112', '전자과');

INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept )
VALUES( '00003', '성춘향', '010-111-1113', '정보통신');

-- 저장된 데이터의 조회(Query), 읽기
SELECT *
FROM tbl_student;

SELECT st_num, st_name, st_dept
FROM tbl_student

-- 칼럼의 표시순서를 변경하여 보여달라
SELECT st_num, st_dept, st_name, st_tel, st_ddr, st_grade
FROM tbl_student

-- tbl student에 저장된 데이터중에서 이름이 홍길동인 데이터만
-- SELECTION 해달라
SELECT *
FROM tbl_student
WHERE st_name = '홍길동'

/*
SELECT 명령수행
Projection : 데이터를 조회할때 보고자 하는 칼럼만 표시하는 것
Selection : 데이터를 조회할때 WHERE 조건절을 붙여
필요한 데이터리스트만 보는것

Projection을 하면 실제 컬럼보다 적은 양의 컬럼을 보여준다
Selection을 하면 실제 데이터 리스트보다 적은 양의 리스트를 보여준다
*/
-- 전체 데이터를 조건없이 보여주되 
-- 이름(st_name 컬럼) 순으로 정렬(Sort)하여 보여라
-- 가나다순(오름차순) 정렬
SELECT *
FROM tbl_student
ORDER BY st_name;

-- 역순(내림차순) 정렬
SELECT *
FROM tbl_student;
ORDER BY st_name DESC;

INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept )
VALUES('00004', '장영실', '000-111-1114', '컴공과');
INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept )
VALUES('00005', '최순실', '000-111-1115', '컴공과');

-- 학과(st_dept)가 컴공과인 데이터만 SELECTION 하여
-- 이름(st_name)순으로 정렬하라
SELECT *
FROM tbl_student;
WHERE st_dept = '컴공과'
ORDER BY st_name;

-- 컴공과 학생들만 이름을 역순정렬하여 보여라
SELECT *
FROM tbl_student;
WHERE st_dept = '컴공과'
ORDER BY st_name DESC;

-- 전체 데이터를 학과명 순으로 정렬하고
-- 학과명이 같은데이터 끼리는 이름순으로 정렬하라
SELECT *
FROM tbl_student
ORDER BY st_dept, st_name;

-- 전체 데이터의 개수가 몇개냐?
SELECT COUNT(st_dept)
FROM tbl_student;

-- 학과별로 학생이 몇명인지 알고싶다
SELECT st_dept; COUNT(st_dept) -- 3 : 묶인 그룹에 포함된 데이터가 몇개인지
FROM tbl_student -- 1 : 데이터 가져오기
GROUP BY st_dept; -- 2 : st_dept(학과)가 같은 데이터까지 묶고

SELECT COUNT(*)
FROM tbl_student
WHERE st_dept = '컴공과';

/*
도구에서 데이터를 추가, 수정, 삭제명령을 수행한 경우
Oracle DBMS에게 요청을 한 상태가 된다
하지만 Oracle DBMS 는 아직 스토리지의 DBF 파일에 저장하지 않은 상태이다
이 상태에서 도구를 종료해버리면
Oracle DBMS는 어떤 문제가 발생하여 종료된 것으로 생각하고
데이터를 지워버린다.
도구를 사용하여 접속했을 경우는 도구를 종료하기 전에
반드시 COMMIT을 해주어야 한다
*/
COMMIT;

SELECT * FROM tbl_student;

/*
DCL (Data Control Lang.)
사용자에게 권한을 부여(GRANT)하거나 회수(REVOKE)하는 명령이 있고
데이터를 COMMIT, 또는 ROLLBACK 하는 명령이 있다
*/

INSERT INTO tbl_student( st_num, st_name, st_tel )
VALUES('00006', '신창원', '010-111-1116');

ROLLBACK;

DELETE
FROM tbl_student;

DROP TABLE tbl_student;
CREATE TABLE tbl_student(
st_num	VARCHAR2(5)		PRIMARY KEY,
st_name	nVARCHAR2(20)	NOT NULL,
st_dept	nVARCHAR2(10),		
st_grade	NUMBER(1),		
st_tel	VARCHAR2(15)	NOT NULL UNIQUE,
st_addr	nVARCHAR2(125)		
);

CREATE TABLE tbl_score(
sc_stnum	VARCHAR2(5)		PRIMARY KEY,
sc_kor	NUMBER,
sc_eng	NUMBER,		
sc_math	NUMBER,		
sc_his	NUMBER,		
sc_moral	NUMBER,		
sc_sci	NUMBER		
);

SELECT st_dept, COUNT(st_dept)
FROM tbl_student
GROUP BY st_dept;

-- 위 결과에서 학생수가 많은 학과부터 보여주기

SELECT st_dept, COUNT(st_dept) AS 학생수
FROM tbl_student
GROUP BY st_dept
ORDER BY COUNT (st_dept) DESC;