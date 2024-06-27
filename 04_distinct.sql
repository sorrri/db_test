-- distinct

SELECT 
	category_code
FROM tbl_menu
ORDER BY category_code;

-- 메뉴가 할당된 카테고리 종류
SELECT
	DISTINCT category_code								-- DISTINCT: 중복 제거			
FROM tbl_menu
ORDER BY category_code;

-- 상위 카테고리 조회
-- 1) where절 활용
SELECT
	*
FROM tbl_category
WHERE ref_category_code IS NULL;

-- 카테고리의 상위 카테고리 번호 조회
SELECT
	DISTINCT ref_category_code
-- 	, category_name AS '카테고리명'
FROM tbl_category
WHERE ref_category_code IS NOT NULL;

-- 2) 서브쿼리를 활용하여 하나의 쿼리로 작성
SELECT
	*
FROM tbl_category
WHERE category_code IN (SELECT DISTINCT ref_category_code
								FROM tbl_category
								WHERE ref_category_code IS NOT NULL
							  );

-- 다중열 distinct
SELECT
	  category_code
	, orderable_status
FROM tbl_menu;

SELECT 
	DISTINCT 
	  category_code
	, orderable_status
FROM tbl_menu;