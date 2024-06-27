/* VIEW */
-- 테이블을 활용한 가상 테이블
-- VIEW는 원본 테이블을 참조해서 보여주는 용도
-- 보여지는건 실제 테이블(베이스 테이블)의 값

SELECT
	  menu_name
	, menu_price
FROM tbl_menu;

-- DROP VIEW v_menu;
CREATE OR REPLACE VIEW v_menu										-- OR REPLACE: 기존에 테이블이 있으면 기존 테이블에 치환
AS 
SELECT
	  menu_name AS '메뉴명'
	, menu_price AS '메뉴단가'
FROM tbl_menu;

SELECT * FROM v_menu;


/* VIEW를 통한 DML(사용 X) */
-- 베이스 테이블(tbl_menu) 조회
SELECT * FROM tbl_menu;

-- VIEW 생성
CREATE OR REPLACE VIEW hansik
AS 
SELECT 
	  menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE category_code = 4;

SELECT * FROM hansik;

-- hansik이라는 view를 통해 tbl_menu라는 베이스테이블에 영향을 줌
INSERT INTO hansik
VALUES 
(NULL, '식혜맛국밥', 5500, 4, 'Y');

UPDATE hansik
SET menu_name = '버터맛국밥'
  , menu_price = 6000
WHERE menu_name = '식혜맛국밥';

CREATE OR REPLACE VIEW v_test
AS 
SELECT
	AVG(menu_price) + 3
FROM tbl_menu;

SELECT *FROM v_test;

INSERT INTO v_test VALUES(10);