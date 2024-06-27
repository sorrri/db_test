-- where절
-- 주문 가능한 메뉴만 조회(메뉴이름, 메뉴가격, 주문가능상태)
SELECT
	  menu_name
	, menu_price
	, orderable_status
FROM tbl_menu
WHERE orderable_status = 'Y';
-- WHERE orderable_status = 'N';

-- DESC를 통해 컬럼명 빠르게 확인
DESC tbl_menu;

-- ------------------------------------------------------------------
-- '기타' 카테고리에 해당하지 않는 메뉴 조회
-- 1) 카테고리명이 '기타'인 카테고리는 카테고리 코드가 10번
SELECT
	*
FROM tbl_category
WHERE category_name = '기타';

-- 2) 카테고리 코드가 10번이 아닌 메뉴 조회
SELECT
	*
FROM tbl_menu
-- WHERE category_code != 10;
WHERE category_code <> 10;

-- where절은 조건을 나타내는데 같은지(=)와 같지 않은지(!=, <>)를 활용할 수 있다.
-- 뿐만 아니라, 대소 비교(>, <, >=, <=)를 통해서도 where절에 활용할 수 있다.

SELECT
	*
FROM tbl_menu
WHERE menu_price >= 5000
ORDER BY menu_price ASC;

-- 5000원 이상이면서 7000원 미만인 메뉴 조회(AND)
SELECT
	*
FROM tbl_menu
WHERE menu_price >= 5000 
AND menu_price < 7000;

-- 10000원보다 크거나 5000원 이하인 메뉴 조회(OR)
SELECT 
	*
FROM tbl_menu
WHERE menu_price > 10000
OR menu_price <= 5000;

-- -----------------------------------------------------------------

SELECT
	  menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE menu_price > 5000
OR category_code = 10;

SELECT
	  menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE menu_price > 5000
AND category_code = 10;

-- -----------------------------------------------------------------
-- between 연산자 활용하기
-- 가격이 5000원 이상이면서 9000원 이하인 메뉴 전체 컬럼 조회
SELECT 
	*
FROM tbl_menu
WHERE menu_price >= 5000
AND menu_price <= 9000;

SELECT
	*
FROM tbl_menu
WHERE menu_price BETWEEN 5000 AND 9000; 

-- 반대범위도 테스트(5000 미만 또는(OR) 9000 초과)
SELECT
	*
FROM tbl_menu
WHERE menu_price NOT BETWEEN 5000 AND 9000; 

-- ----------------------------------------------------------------
-- LIKE문
-- 제목, 작성자 등을 검색할 때 사용
SELECT 
	*
FROM tbl_menu
WHERE menu_name LIKE '%밥%';

SELECT 
	*
FROM tbl_menu
WHERE menu_name NOT LIKE '%밥%';

-- ----------------------------------------------------------------
-- in 연산자
-- 카테고리가 '중식', '커피', '기타'인 메뉴 조회
SELECT 
	*
FROM tbl_menu
WHERE category_code = 5
OR category_code = 8
OR category_code = 10;

SELECT 
	*
FROM tbl_menu
WHERE category_code IN (5, 8, 10);
-- WHERE category_code NOT IN (5, 8, 10);

-- ----------------------------------------------------------------
-- is null 연산자 활용
-- 상위 카테고리 조회하기
SELECT 
	*
FROM tbl_category
WHERE ref_category_code IS NULL;

-- 하위 카테고리 조회하기
SELECT 
	*
FROM tbl_category
WHERE ref_category_code IS NOT NULL;