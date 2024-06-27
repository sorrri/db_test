-- type casting
-- 명시적 형변환

-- 1) 숫자 -> 숫자
SELECT CAST(AVG(menu_price) AS UNSIGNED INTEGER) AS '가격평균'
FROM tbl_menu;
DESC tbl_menu;

-- 소수점 이하 한자리까지만 표기
SELECT CAST(AVG(menu_price) AS FLOAT) AS '가격평균'
FROM tbl_menu;

-- 소수점 이하 12자리까지 표기
SELECT CAST(AVG(menu_price) AS DOUBLE) AS '가격평균'
FROM tbl_menu;


-- 2) 문자 -> 날짜
-- 2024년 6월 27일을 date형으로 변환
SELECT CAST('2024$6$27' AS DATE);
SELECT CAST('2024/6/27' AS DATE);
SELECT CAST('2024#6#27' AS DATE);


-- 3) 숫자 -> 문자
SELECT CONCAT(cast(1000 AS CHAR), '원');							-- concat: 정수+문자열 -> 문자열(묵(암)시적 형변환)

-- 암시적 형변환
SELECT 1+'2';
SELECT 1+'김';																-- mariadb가 연산 시 치환하기 힘든 문자열은 0으로 치환하여 적용
SELECT 5 > '반가워';														 -- '반가워'가 0으로 치환(true에 해당: 1, false에 해당: 0)

