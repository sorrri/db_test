/* CONSTRAINT */

/* 1. NOT NULL 제약조건 */
-- null 값을 포함할 수 없는 컬럼에 대한 제약조건이자 컬럼 레벨에서만 제약조건 추가 가능
DROP TABLE if EXISTS user_notnull;
CREATE TABLE if NOT EXISTS user_notnull(
  user_no INT NOT NULL,
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255)
) ENGINE=INNODB;

INSERT INTO user_notnull
  (user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
  (1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'), 
  (2, 'user02', 'pass02', '유관순', '여', '010-7777-7777', 'yu77@gmail.com');
  
INSERT INTO user_notnull
  (user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
  (3, 'user03', 'pass03', NULL, '남', '010-1234-5677', 'hong1234@gmail.com');					-- 제약조건 걸림
  
  
/* 2. UNIQUE 제약조건 */
-- 중복값이 들어가지 않도록 하는 제약조건
-- 컬럼레벨 및 테이블레벨 모두 가능
CREATE TABLE if NOT EXISTS user_unique(
  user_no INT NOT NULL UNIQUE																					-- 컬럼레벨
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255), 
  UNIQUE(phone)																									-- 테이블레벨
) ENGINE=INNODB;

INSERT INTO user_unique
  (user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
  (1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'), 
  (2, 'user02', 'pass02', '유관순', '여', '010-7777-7777', 'yu77@gmail.com');
  
INSERT INTO user_unique
  (user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
  (3, 'user01', 'pass01', '홍길동2', '남', '010-1234-5678', 'hong123@gmail.com');				-- 제약조건 걸림
  
  
/* 3. PRIMARY KEY 제약조건 */
-- not null + unique 제약조건
-- 모든 테이블은 반드시 primary key를 가져야 함(두 개 이상 제약조건 불가능)
CREATE TABLE if NOT EXISTS user_primarykey(
  user_no INT,
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255), 
  UNIQUE(phone), 
  PRIMARY KEY(user_no)
) ENGINE=INNODB;

DESC user_primarykey;

INSERT INTO user_primarykey
  (user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
  (1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'), 
  (2, 'user02', 'pass02', '유관순', '여', '010-7777-7777', 'yu77@gmail.com');
  
INSERT INTO user_primarykey
  (user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
  (1, 'user012', 'pass012', '홍길동2', '남2', '010-1234-5678', 'hong123@gmail.com');		--제약조건 걸림
  
  
/* 4. FOREIGN KEY 제약조건 */
-- 4-1. 회원등급 부모 테이블 먼저 생성
DROP TABLE if EXISTS user_grade;
CREATE TABLE if NOT EXISTS user_grade(
  grade_code INT NOT NULL UNIQUE, 
  grade_name VARCHAR(255) NOT NULL
);

-- 4-2. 회원 자식 테이블을 이후에 생성
DROP TABLE if EXISTS user_foreignkey1;
CREATE TABLE if NOT EXISTS user_foreignkey1 ( 
  user_no INT PRIMARY KEY,
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255), 
  grade_code INT, 
  FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
) ENGINE=INNODB;

INSERT INTO user_grade
VALUES
(10, '일반회원');, 
(20, '우수회원'),
(30, '특별회원');

INSERT INTO user_foreignkey1
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1111-2222', 'hong@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-3333-4444', 'yu@gmail.com', 20);

-- FOREIGN KEY 제약조건이 걸린 컬럼은 부모테이블의 pk값 + null값까지 들어갈 수 있음
INSERT INTO user_foreignkey1
VALUES
(3, 'user01', 'pass01', '홍길동', '남', '010-1111-2222', 'hong@gmail.com', NULL);

-- FOREIGN KEY 제약조건이 걸린 컬럼이 부모에 없는 값이 들어갈 수 없음.(참조해야함)
INSERT INTO user_foreignkey1
VALUES
(4, 'user02', 'pass02', '유관순', '여', '010-3333-4444', 'yu@gmail.com', 40);				-- 제약조건 걸림

-- 참조가 되고부터는 부모테이블 및 참조된 행은 지울 수 없음(자식 테이블 먼저 지운 후 부모 테이블 지움)
-- 10번 등급의 회원이 이미 존재하므로 10번 등급은 삭제할 수 없음
DELETE FROM user_grade
WHERE grade_code = 10;

-- 참조가 안되어 있는 행은 지울 수 있음
-- 30번 등급의 회원은 존재하지 않으므로 30번 등급은 삭제할 수 있음
DELETE FROM user_grade
WHERE grade_code = 30;

-- 4-3. 삭제룰을 적용한 foreign key 제약조건 작성
DROP TABLE if EXISTS user_foreignkey2;
CREATE TABLE if NOT EXISTS user_foreignkey2 ( 
  user_no INT PRIMARY KEY,
  user_id VARCHAR(255) NOT NULL,
  user_pwd VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  gender VARCHAR(3),
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255), 
  grade_code INT, 
  FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
  ON DELETE CASCADE 																								-- 삭제룰
) ENGINE=INNODB;
-- ON DELETE SET NULL: 부모 테이블 행이 지워졌을때 자식 요소 NULL값으로 바꿈
-- CASCADE: 부모 테이블 행이 지워졌을때 자식 행도 같이 지움

INSERT INTO user_foreignkey2
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1111-2222', 'hong@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-3333-4444', 'yu@gmail.com', 20);

TRUNCATE user_foreignkey1;

-- 현재 회원의 참조 컬럼 값 확인
SELECT * FROM user_foreignkey2;

-- 참조하는 부모 테이블의 행 삭제 후 참조
DELETE FROM user_grade WHERE grade_code = 10;


/* CHECK 제약조건(조건식을 활용한) */
DROP TABLE if EXISTS user_check;
CREATE TABLE if NOT EXISTS user_check(
  user_no INT AUTO_INCREMENT PRIMARY KEY, 
  user_name VARCHAR(255) NOT NULL, 
  gender VARCHAR(3) CHECK(gender IN ('남', '여')),
  age INT CHECK(age >= 19)
) ENGINE=INNODB;

INSERT INTO user_check
VALUES
(NULL, '홍길동', '남', 25),
(NULL, '이순신', '남', 33);

SELECT * FROM user_check;

-- 성별에 잘못된 값 입력
INSERT INTO user_check
VALUES
(NULL, '아메바', '중', 19);																					-- 제약조건 걸림	

INSERT INTO user_check
VALUES 
(NULL, '유관순', '여', 16);																					-- 제약조건 걸림


/* DEFAULT 제약조건 */
CREATE TABLE if NOT EXISTS tbl_country(
  country_code INT AUTO_INCREMENT PRIMARY KEY,
  country_name VARCHAR(255) DEFAULT '한국', 
  population VARCHAR(255) DEFAULT '0명', 
  add_day DATE DEFAULT (CURRENT_DATE),
  add_time DATETIME DEFAULT (CURRENT_TIME)
)ENGINE=INNODB;

INSERT INTO tbl_country
VALUES
(NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM tbl_country;