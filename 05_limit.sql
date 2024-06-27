-- limit
-- 전체 행 조회
SELECT
	  menu_code
	, menu_name
	, menu_price
FROM tbl_menu
ORDER BY menu_price DESC;

SELECT 
	  menu_code
	, menu_name
	, menu_price
FROM tbl_menu
ORDER BY menu_price DESC, menu_code DESC 
LIMIT 4, 3;													-- LIMIT index, length(정렬된 후에 자름)

SELECT
	*
FROM tbl_menu
ORDER BY menu_code LIMIT 10;							-- 하나의 수치만 주면 length의 의미를 가지게 됨