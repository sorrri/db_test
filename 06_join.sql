-- join

-- alias(별칭)
-- 컬럼에 별칭을 다는 것 외에도 FROM절에 작성되는 것들에 별칭도 추가 가능
-- 테이블 또는 FROM절에 별칭을 추가할 때는 싱글쿼테이션('') 없이 작성
-- AS는 생략 가능
SELECT
	  a.category_code
	, a.menu_name
FROM tbl_menu a
ORDER BY a.category_code, a.menu_name;

-- inner join
-- INNER라는 키워드는 생략해도 INNER JOIN
-- 1) ON을 활용
SELECT
	  a.category_code
	, a.menu_name
	, b.category_name
FROM tbl_menu a
-- INNER JOIN tbl_category b ON a.category_code = b.category_code;
JOIN tbl_category b ON a.category_code = b.category_code;

-- 2) USING을 활용
-- join할 테이블들의 매핑 컬럼명들이 동일할 경우에만 사용 가능
SELECT 
	  a.category_code
	, a.menu_name
	, b.category_name
FROM tbl_menu a
JOIN tbl_category b USING (category_code);

-- --------------------------------------------------------------------------
-- outer join
-- 1) LEFT JOIN
SELECT 
	  a.category_name
	, b.menu_name
FROM tbl_category a
LEFT JOIN tbl_menu b ON (a.category_code = b.category_code);			-- LEFT JOIN은 a를 기준으로 조인

-- 2) RIGHT JOIN
SELECT 
	  a.menu_name
	, b.category_name
FROM tbl_menu a
RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);		-- RIGHT JOIN은 b를 기준으로 조인

-- 3) CROSS JOIN
SELECT 
	  a.menu_name
	, b.category_name
FROM tbl_menu a
CROSS JOIN tbl_category b;															

-- 4) SELF JOIN
-- a에 해당하는 것은 하위 카테고리, b에 해당하는 것은 상위 카테고리
SELECT 
	  a.category_name
	, b.category_name
FROM tbl_category a
JOIN tbl_category b ON (a.ref_category_code = b.category_code);		-- SELF JOIN은 자기 자신을 참조