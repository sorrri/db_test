/* DDL(Data Definition Language) */
-- if NOT EXISTS(옵션): 테이블이 이미 존재 시 만들지 않음(오류X)
CREATE TABLE if NOT EXISTS tb1(
  pk INT PRIMARY KEY, 
  fk INT,
  col1 VARCHAR(255), 													-- VAR: 알아서 데이터 조절(가변)
  CHECK(col1 IN ('Y', 'N'))
)ENGINE = INNODB;

-- 존재하는 테이블 요약
DESC tb1;
DESCRIBE tb1;

INSERT 
INTO tb1
VALUES
(1, 2, 'Y');

/* AUTO_INCREMENT */
DROP TABLE tb2;

CREATE TABLE tb2(
  pk INT PRIMARY KEY AUTO_INCREMENT,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

DESC tb2;

INSERT
INTO tb2
VALUES
(NULL, 2, 'N');

SELECT * FROM tb2;

/* ALTER */
-- 컬럼 추가
ALTER TABLE tb2 ADD col2 INT NOT NULL;
DESC tb2;

-- 컬럼 삭제
ALTER TABLE tb2 DROP COLUMN col2;
DESC tb2;

-- 컬럼 이름 및 컬럼 정의 변경
ALTER TABLE tb2 CHANGE COLUMN fk change_fk INT NOT NULL;
DESC tb2;

-- 제약조건 제거(primary key 제약조건 제거)
ALTER TABLE tb2 DROP PRIMARY KEY;											-- 오류

-- auto_increment 먼저 제거(drop이 아닌 modify) 후 primary key 제거
ALTER TABLE tb2 MODIFY pk INT;
DESC tb2;

ALTER TABLE tb2 DROP PRIMARY KEY;
DESC tb2;

-- /* TRUNCATE */		
-- 절삭(truncate) vs 삭제(delete)
-- truncate: 테이블의 데이터(데이터 및 관련 제약조건 관련 등 모두 제거)
-- 			 테이블의 초기화(테이블 처음당시로 돌려줌)
-- delete: 데이터만 제거
CREATE TABLE if NOT EXISTS tb3 (
  pk INT AUTO_INCREMENT,
  fk INT,
  col1 VARCHAR(255) CHECK(col1 IN ('Y', 'N')),
  PRIMARY KEY(pk)
);

INSERT INTO tb3
VALUES
(NULL, 1, 'N');

SELECT * FROM tb3;

TRUNCATE tb3;


