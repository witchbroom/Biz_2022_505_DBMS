use schoolDB;

-- MySQL의 Boolean type
-- 실제 테이블상에는 BOOLEAN type이 없고
-- tinyint type으로 칼럼이 생성된다
-- 이 값은 0과 1의 값을 가지며 Java에서 SELECT를 하면
-- 1은 true로 0은 false로 자동 형변환된다
CREATE TABLE tbl_users(
username	VARCHAR(20)	PRIMARY KEY,
password	VARCHAR(20) NOT NULL,
isEnabled	BOOLEAN	DEFAULT FALSE,
isAccountNonExpired	BOOLEAN DEFAULT TRUE,
isAccountNonLocked	BOOLEAN DEFAULT TRUE,
isCredentialsNonExpired	BOOLEAN	DEFAULT TRUE,

email	VARCHAR(30),
tel	VARCHAR(15),
realname	VARCHAR(20),
nickname	VARCHAR(20)
);

-- Spring Security에서 사용하는 권한테이블
-- 한 user에게 여러가지 복합적인 권한을 부여하기 위하여
-- 사용하는 보조 테이블
CREATE TABLE tbl_authorities(
seq BIGINT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(20),
authority VARCHAR(20)
);

DESC tbl_users;