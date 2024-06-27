SELECT * FROM tbl_menu;
SELECT * FROM tbl_category;

SELECT
	  a.category_code
	, a.menu_name AS '메뉴'
	, b.category_name AS '카테고리'
	, FLOOR(AVG(menu_price)) AS '평균 가격'
FROM tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code
WHERE menu_name LIKE '%무%'
GROUP BY category_code
HAVING AVG(menu_price) < 10000
ORDER BY 4 DESC;