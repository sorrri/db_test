/* DML(Data Manipulation Language) */
-- INSERT, UPDATE, DELETE (SELECT - DQL)

/* INSERT */
-- 새로운 행을 추가
-- 테이블의 행의 수 증가
SELECT * FROM tbl_menu;

INSERT 
INTO tbl_menu																			-- 컬럼
(
-- menu_code -> AUTO INCREMENT: 자동 번호 발생기(ORACLE 적용 X)
  menu_name, menu_price, category_code, orderable_status
)
VALUES																					-- 값
('초콜릿죽', 6500, 7, 'Y');

SELECT * FROM tbl_menu ORDER BY 1 DESC;

/* MULTI INSERT */
INSERT 
INTO tbl_menu
VALUES 
(NULL, '참치맛아이스크림', 1700, 12, 'Y'),
(NULL, '멸치맛아이스크림', 1500, 11, 'Y'),
(NULL, '소시지맛커피', 2500, 8, 'Y');

/* UPDATE */
-- 테이블에 기록된 컬럼값을 수정하는 구문
-- 전체 행 개수에는 변화 X
SELECT 
	*
FROM tbl_menu
WHERE menu_name = '소시지맛커피';

UPDATE tbl_menu
SET category_code = 7
WHERE menu_code = 25;

-- subquery를 활용한 UPDATA
UPDATE tbl_menu
SET category_code = 6
WHERE menu_code = (SELECT menu_code 
						  FROM tbl_menu
						  WHERE menu_name = '소시지맛커피');
						  
/* DELETE */
-- 테이블의 행을 삭제하는 구문
-- 테이블의 행의 개수가 줄어듦
SELECT * FROM tb_menu;
-- DELETE
-- FROM tbl_menu;																		-- 조건절 사용!!(미사용 시 테이블 날라감)

-- mariadb는 autocommit이 기본적으로 'on' -> INSERT, UPDATA, DELETE시 베이스 테이블(메모리)에 바로 반영
-- 다시 살리고 싶다면 autocommit을 꺼야함
-- ROLLBACK; 테이블 복구
-- (SET autocommit = on일경우 ROLLBACK 불가능 -> off로 변경)

DELETE
FROM tbl_menu
ORDER BY menu_price																	-- 메뉴가격 기준 오름차순
LIMIT 2;																					-- 정렬된 첫 행부터 두 개의 행에 해당

/* REPLACE */
-- insert시 primary key(null X, 중복 X, 이후 수정 X) 또는 unique key(중복 X)
-- 가 충돌이 발생하지 않도록 replace를 통해 중복된 데이터 덮어 씌울 수 있음
REPLACE tbl_menu																		-- into 생략 가능
VALUES
(17, '참기름소주', 5000, 10, 'Y');

SELECT * FROM tbl_menu WHERE menu_code = 17;
