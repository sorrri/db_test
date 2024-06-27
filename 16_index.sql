/* INDEX */
-- 검색 성능 향상(30% 정도 범위)
-- 추가적인 공간, 잦은 변동 X(Rebuild idx)
-- primary key는 자동으로 인덱스 부여(고유 식별자)

CREATE TABLE phone(
  phone_code INT PRIMARY KEY,
  phone_name VARCHAR(100), 
  phone_price DECIMAL(10, 2)
);

INSERT INTO phone
VALUES 
(1, 'galaxyS24', 1200000), 
(2, 'iphone14pro', 1430000),
(3, 'galaxyfold3', 1730000);

SELECT * FROM phone;

-- where절을 활용한 단순 조회
SELECT * FROM phone WHERE phone_name = 'galaxyS24';
EXPLAIN SELECT *FROM phone WHERE phone_name = 'galaxyS24';

-- phone_name에 index 추가하기
CREATE INDEX idx_name ON phone(phone_name);
SHOW INDEX FROM phone;

-- 다시 index가 추가된 컬럼으로 조회해서 index를 태웠는지 확인
SELECT * FROM phone WHERE phone_name = 'galaxyS24';
EXPLAIN SELECT *FROM phone WHERE phone_name = 'galaxyS24';

-- 주기적으로 index를 REBUILD 함
-- (mariadb는 optimize 키워드 사용)
OPTIMIZE TABLE phone;																			-- rebuild idx

DROP INDEX idx_name ON phone;
SHOW INDEX FROM phone;