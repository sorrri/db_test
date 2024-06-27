-- group by절
-- 메뉴가 존재하는 카테고리 그룹 조회
-- 그룹 함수(SUM, AVG, COUNT, MAX, MIN)를 적용하기 위한 설정
SELECT
	category_code
FROM tbl_menu
GROUP BY category_code;

-- COUNT 함수 활용
SELECT
	  COUNT(*)
	, a.category_code
FROM tbl_menu a
GROUP BY a.category_code;

SELECT
	  COUNT(*)
	, CONCAT(a.category_code, '번 카테고리') AS '카테고리 번호'
FROM tbl_menu a
GROUP BY a.category_code;

-- COUNT 함수
-- COUNT(컬럼명 또는 *)
-- COUNT(컬럼명) 해당 컬럼에 NULL이 아닌 행의 개수
-- COUNT(*) 모든 행의 개수

SELECT 
	  COUNT(*) AS '모든 카테고리 행'
	, COUNT(ref_category_code) AS '상위 카테고리가 존재하는 카테고리'
FROM tbl_category;

-- SUM 함수 활용
SELECT
	  category_code
	, SUM(menu_price)
FROM tbl_menu
GROUP BY category_code;

-- AVG 함수 활용
SELECT
	  category_code
	, FLOOR(AVG(menu_price))																-- FLOOR: 소수점 버림
FROM tbl_menu
GROUP BY category_code;

-- having절
SELECT 
	  SUM(menu_price)
	, category_code
FROM tbl_menu
GROUP BY category_code 
-- HAVING category_code BETWEEN 5 AND 9;
HAVING SUM(menu_price) >= 20000;

-- -------------------------------------------------------------------------------------------------
-- rollup
-- group을 묶을 때 하나의 기준(하나의 컬럼)으로 그룹화하여 ROLLUP
SELECT
	  SUM(menu_price)
	, category_code
FROM tbl_menu
GROUP BY category_code
WITH ROLLUP;																					-- 총계의 개념이 나옴

-- group을 묶을 때 여러개의 기준(여러개의 컬럼)으로 그룹화하여 ROLLUP
SELECT 
	  SUM(menu_price)
	, menu_price
	, category_code
FROM tbl_menu
GROUP BY menu_price, category_code
WITH ROLLUP;																					-- 소계와 총계의 개념이 나옴