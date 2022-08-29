use mydb;
DESC tbl_users;

SHOW tables;

SELECT * FROM tbl_users;

DESC tbl_memos;
SELECT * FROM tbl_memos;

DESC tbl_address;

use mydb;
/*
DROP TABLE : 테이블 삭제
DELETE FROM [table] : 데이터만 전체삭제
TRUNCATE TABLE [table] : DROP 후에 다시 CREATE
*/
TRUNCATE TABLE tbl_address;
SELECT * FROM tbl_address;
SELECT COUNT(*) FROM tbl_address;

SELECT * FROM tbl_address
WHERE a_name = '학생이름';

DELETE FROM tbl_address
WHERE a_seq = 50;
DELETE FROM tbl_address
WHERE a_seq = 189;

-- a_name 칼럼의 데이터가 야유신 인 데이터만 추출
SELECT * FROM tbl_address
WHERE a_name = '야유신';

-- 중간문자열 검색
-- a_name 칼럼에 '유'가 포함된 모든 데이터
SELECT * FROM tbl_address
WHERE a_name LIKE '%유%';

-- a_name 칼럼의 데이터가 '유'로 시작되는 데이터
SELECT * FROM tbl_address
WHERE a_name LIKE '유%';

-- a_name 칼럼의 데이터가 '유'로 끝나는 데이터
SELECT * FROM tbl_address
WHERE a_name LIKE '%유';

-- LIKE 연산자는 index도 작용이 안되고 full text 검사
-- 전체데이터를 처음부터 순서대로 비교하여 검색
-- WHRER 절에서 사용하는 연산자중에 가장 성능이 낮다

SELECT * FROM tbl_address
WHERE a_name LIKE CONCAT('%','유','%');


-- mybatis의 mapper에서 사용하는 코드
SELECT * FROM tbl_address
WHERE a_name LIKE CONCAT('%',#{a_name},'%');

-- mybatis의 mapper에서 사용하는 Oracle 코드
-- SELECT * FROM tbl_address
-- WHERE a_name LIKE '%' || ${a_name} || '%';

-- LIMIT : 데이터의 출력개수를 제한하는 키워드
SELECT * FROM tbl_address
LIMIT 10;
-- OFFSET : 앞에서부터 건너뛰고 출력하기
SELECT * FROM tbl_address
LIMIT 10 OFFSET 10;

SELECT * FROM
(
SELECT * FROM tbl_address
WHERE a_name LIKE '%유%'
) AS SUB
LIMIT 10 OFFSET 10;