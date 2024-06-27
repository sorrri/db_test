/* set operator */
-- join은 가로로 접합, set operator은 세로로 접합

/* UNION */
SELECT 
	  menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE category_code = 10
UNION
SELECT
	  menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE menu_price < 9000;

/* UNION ALL */
SELECT 
	  menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE category_code = 10
UNION ALL
SELECT
	  menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE menu_price < 9000;

/* INTERSECT */
-- MYSQL과 MARIADB는 INTERSECT가 공식적으로 지원 X
-- 1) INNER JOIN 활용
SELECT 
	  a.menu_code
	, a.menu_name
	, a.menu_price
	, a.category_code
	, a.orderable_status
FROM tbl_menu a
INNER JOIN (SELECT  b.menu_code
						, b.menu_name
						, b.menu_price
						, b.category_code
						, b.orderable_status
				FROM tbl_menu b
				WHERE b.menu_price < 9000) c ON (a.menu_code = c.menu_code)
WHERE a.category_code = 10;

-- 2) IN 연산자 활용
SELECT 
	  a.menu_code
	, a.menu_name
	, a.menu_price
	, a.category_code
	, a.orderable_status
FROM tbl_menu a
WHERE a.category_code = 10
AND a.menu_code IN (SELECT b.menu_code													-- 서브쿼리 다중행 불가능('=' 두 번 불가능 IN 사용)
						  FROM tbl_menu b
						  WHERE b.menu_price < 9000);
						  
/* MINNUS */
-- MYSQL과 MARIADB는 MINUS가 공식적으로 지원 X
SELECT 
	  a.menu_code
	, a.menu_name
	, a.menu_price
	, a.category_code
	, a.orderable_status
FROM tbl_menu a
LEFT JOIN (SELECT  b.menu_code
						, b.menu_name
						, b.menu_price
						, b.category_code
						, b.orderable_status
				FROM tbl_menu b
				WHERE b.menu_price < 9000) c ON (a.menu_code = c.menu_code)
WHERE a.category_code = 10
AND c.menu_code IS NULL;																	-- 교집합을 빼고