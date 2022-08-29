use workdb;

CREATE TABLE tbl_books(
ISBN BIGINT	PRIMARY KEY,
도서명 VARCHAR(50)	 NOT NULL,
출판사 VARCHAR(10)	NOT NULL,
저자 VARCHAR(20)	NOT NULL,
출판일 VARCHAR(20)	NOT NULL,
페이지 INT	NOT NULL,
가격 INT	NOT NULL 
);

DROP TABLE tbl_books;



CREATE TABLE tbl_company(
출판사코드 VARCHAR(10) PRIMARY KEY,
출판사명 VARCHAR(20) NOT NULL,
대표 VARCHAR(20) NOT NULL,
전화번호 VARCHAR(20),
주소 VARCHAR(100)
);

CREATE TABLE tbl_author(
저자코드 VARCHAR(10) PRIMARY KEY,
저자명 VARCHAR(20) NOT NULL,
전화번호 VARCHAR(20) NOT NULL,
주소 VARCHAR(100)
);

SELECT * FROM tbl_books;
SELECT * FROM tbl_company;
SELECT * FROM tbl_author;

INSERT INTO tbl_books(ISBN, 도서명, 출판사, 저자, 출판일, 페이지, 가격)
VALUES
('9791162540770', '데스 바이 아마존', 'C0048', 'A0007', '2019-04-15', '272', '15000'),
('9791188850549', '4주 만에 완성하는 레깅스핏 스트레칭', 'C0046', 'A0017', '2019-04-11', '132', '13000'),
('9791188850518', '왕이 된 남자 2', 'C0019', 'A0040', '2019-04-10', '388', '14000'),
('9791188850501', '왕이 된 남자 1', 'C0030', 'A0049', '2019-04-10', '440', '14000'),
('9791162540756', '새벽에 읽는 유대인 인생 특강', 'C0086', 'A0100', '2019-04-10', '280', '15000'),
('9791188850471', '왕이 된 남자 포토에세이', 'C0072', 'A0052', '2019-04-10', '368', '25000'),
('9791162540732', '오토노미 제2의 이동혁명', 'C0036', 'A0021', '2019-03-31', '536', '22000'),
('9791162540718', '쓴다 쓴다 쓰는 대로 된다', 'C0035', 'A0002', '2019-03-30', '232', '13000');

SELECT COUNT(*) FROM tbl_books;
SELECT COUNT(*) FROM tbl_company;
SELECT COUNT(*) FROM tbl_author;

SELECT * FROM tbl_books
ORDER BY 출판일;

SELECT COUNT(*)
FROM tbl_books
GROUP BY 출판사;

SELECT AVG(가격)
FROM tbl_books
GROUP BY 출판사;

SELECT * FROM tbl_books
WHERE 20000 <= 가격;

SELECT ISBN, 도서명, tbl_company.출판사명, tbl_company.대표 AS 출판사대표, tbl_author.저자명 AS 저자, tbl_author.전화번호 AS 저자연락처
FROM tbl_books
LEFT JOIN tbl_company ON tbl_books.출판사 = tbl_company.출판사코드
LEFT JOIN tbl_author ON tbl_books.저자 = tbl_author.저자코드;

SELECT ISBN, 도서명, tbl_company.출판사명, tbl_company.대표 AS 출판사대표, tbl_author.저자명 AS 저자, tbl_author.전화번호 AS 저자연락처, 출판일
FROM tbl_books
LEFT JOIN tbl_company ON tbl_books.출판사 = tbl_company.출판사코드
LEFT JOIN tbl_author ON tbl_books.저자 = tbl_author.저자코드
WHERE 출판일 <= '2018-12-31';

UPDATE tbl_author
SET 전화번호 = '010-3782-9014'
WHERE 저자코드 = 'A0010';
