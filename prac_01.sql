SELECT
	menu_name
	, menu_price
FROM tbl_menu
WHERE menu_price > 7000
AND menu_name LIKE '%밥%'
ORDER BY 2 DESC;