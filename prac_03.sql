-- <JOIN 미사용 연습문제>
-- 1. 모든 사원 모든 컬럼 조회
SELECT * FROM employee;

-- 2. 사원들의 사번(사원번호), 이름 조회
SELECT
	  EMP_ID
	, EMP_NAME
FROM employee;

-- 3. 201번 사번의 사번 및 이름 조회
SELECT 
	  EMP_ID
	, EMP_NAME
FROM employee
WHERE EMP_ID = 201;

-- 4. employee 테이블에서 부서 코드가 'D9'인 사원 조회
SELECT 
	*
FROM employee
WHERE DEPT_CODE = 'D9';

-- 5. employee 테이블에서 직급 코드가 'J1'인 사원 조회
SELECT 
	*
FROM employee
WHERE JOB_CODE = 'J1';

-- 6. employee 테이블에서 급여가 300만원 이상(>=)인 사원의 사번, 이름, 부서코드, 급여 조회
SELECT 
	  EMP_ID
	, EMP_NAME
	, DEPT_CODE
	, SALARY
FROM employee
WHERE SALARY >= 3000000;

-- 7. 부서코드가 'D6'이고 급여를 300만원보다 많이 받는 직원의 이름, 부서코드, 급여 조회
SELECT 
	  EMP_NAME
	, DEPT_CODE
	, SALARY
FROM employee
WHERE DEPT_CODE = 'D6' AND SALARY > 3000000;

-- 8. 보너스를 받지 않는 사원에 대한 사번, 직원명, 급여, 보너스를 조회
SELECT
	  EMP_ID
	, EMP_NAME
	, SALARY
	, BONUS
FROM employee
WHERE BONUS IS NULL;

-- 9. 'D9'부서에서 근무하지 않는 사원의 사번, 이름, 부서코드를 조회
SELECT 
	  EMP_ID
	, EMP_NAME
	, DEPT_CODE
FROM employee
WHERE DEPT_CODE != 'D9';

-- 10. employee 테이블에서 퇴사 여부가 N인 직원들 조회하고 사번, 이름, 입사일을 별칭을 사용해 조회
-- (퇴사 여부 컬럼은 ENT_YN이고 N은 퇴사 안한 사람, Y는 퇴사 한 사람)
SELECT 
	  EMP_ID AS '사번'
 	, EMP_NAME AS '이름'
	, HIRE_DATE AS '입사일'
FROM employee
WHERE ENT_YN = 'N';

-- 11. employee 테이블에서 급여 350만원 이상 550만원 이하를 받는 직원의 사번, 이름, 급여, 부서코드, 직급코드를 별칭을 사용해 조회
SELECT 
	  EMP_ID AS '사번'
	, EMP_NAME AS '이름'
	, SALARY AS '급여'
	, DEPT_CODE AS '부서코드'
	, JOB_CODE AS '직급코드'
FROM employee
WHERE SALARY BETWEEN 3500000 AND 5500000;

-- 12. employee 테이블에서 '성이 김씨'인 직원의 사번, 이름, 입사일 조회
SELECT 
	  EMP_ID
	, EMP_NAME
	, HIRE_DATE
FROM employee
WHERE EMP_NAME LIKE '김%';

-- 13. employee 테이블에서 '성이 김씨'가 아닌 직원의 사번, 이름, 입사일 조회
SELECT 
	  EMP_ID
	, EMP_NAME
	, HIRE_DATE
FROM employee
WHERE EMP_NAME NOT LIKE '김%';

-- 14. employee 테이블에서 '하' 문자가 이름에 포함된 직원의 이름, 주민번호, 부서코드 조회
SELECT 
	  EMP_NAME
	, EMP_NO
	, DEPT_CODE
FROM employee
WHERE EMP_NAME LIKE '%하%';

-- 15. 'J2'직급이면서 급여가 200만원 이상인 직원이거나 'J7'직급인 직원의 이름, 급여, 직급코드 조회
SELECT
	  EMP_NAME
	, SALARY
	, JOB_CODE
FROM employee
WHERE JOB_CODE = 'J2' AND SALARY >= 2000000;

-- 16. 'J2'직급이거나 'J7'직급인 직원들 중에 급여가 200만원 이상인 직원의 이름, 급여, 직급코드 조회
SELECT
	  EMP_NAME
	, SALARY
	, JOB_CODE
FROM employee
WHERE JOB_CODE = 'J2' OR JOB_CODE = 'J7' AND SALARY >= 2000000;

-- 17. IN 연산자로 업그레이드
SELECT
	  EMP_NAME
	, SALARY
	, JOB_CODE
FROM employee
WHERE JOB_CODE IN ('J2', 'J7') AND SALARY >= 2000000;

-- -----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM job;
SELECT * FROM location;
SELECT * FROM NATIONAL;
SELECT * FROM sal_grade;
-- <JOIN 사용 연습 문제>
-- 1. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회(1명)
SELECT
	  a.EMP_ID
	, a.EMP_NAME
	, b.DEPT_TITLE
FROM employee a
JOIN department b ON a.DEPT_CODE = b.DEPT_ID
WHERE a.EMP_NAME LIKE '%형%';

-- 2. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회(9명)
SELECT
	  a.EMP_NAME
	, c.JOB_NAME
	, b.DEPT_TITLE
FROM employee a
JOIN department b ON a.DEPT_CODE = b.DEPT_ID
JOIN job c ON a.JOB_CODE = c.JOB_CODE
WHERE b.DEPT_TITLE LIKE '%해외영업%';

-- 3. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회(8명)(INNER JOIN)
SELECT 
	  a.EMP_NAME
	, a.BONUS
	, b.DEPT_TITLE
	, c.LOCAL_NAME
FROM employee a
JOIN department b ON a.DEPT_CODE = b.DEPT_ID
JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
WHERE BONUS IS NOT NULL;

-- 4. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회(3명)
SELECT 
	  a.EMP_NAME
	, d.JOB_NAME
	, b.DEPT_TITLE
	, c.LOCAL_NAME
FROM employee a
JOIN department b ON a.DEPT_CODE = b.DEPT_ID
JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
JOIN job d ON a.JOB_CODE = d.JOB_CODE
WHERE a.DEPT_CODE = 'D2';

-- 5. 급여 테이블의 등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의 사원명, 직급명, 급여, 연봉을 조회(20명)
-- (연봉에 보너스포인트 적용)
SELECT 
	  a.EMP_NAME
	, b.JOB_NAME
	, a.SALARY
FROM employee a
JOIN job b ON a.JOB_CODE = b.JOB_CODE
JOIN sal_grade c ON a.SAL_LEVEL = c.SAL_LEVEL
WHERE c.MIN_SAL < a.SALARY AND BONUS IS NOT NULL a.;




-- 6. 한국(KO)과 일본(JP)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명을 조회(15명)
SELECT 
	  a.EMP_NAME
	, b.DEPT_TITLE
	, c.LOCAL_NAME
	, d.NATIONAL_NAME
FROM employee a
JOIN department b ON a.DEPT_CODE = b.DEPT_ID
JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
JOIN NATIONAL d ON c.NATIONAL_CODE = d.NATIONAL_CODE
WHERE d.NATIONAL_CODE IN ('KO', 'JP');

-- 7. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회(60명)(SELF JOIN)


-- 8. 보너스포인트가 없는 직원들 중에서 직급코드가 'J4'와 'J7'인 직원들의 사원명, 직급명, 급여를 조회(8명)
-- (단, JOIN과 IN 사용)
SELECT 
	  a.EMP_NAME
	, b.JOB_NAME
	, a.SALARY
FROM employee a
JOIN job b ON a.JOB_CODE = b.JOB_CODE
WHERE a.BONUS IS NULL AND a.JOB_CODE IN ('J4', 'J7');

-- 9. 직급이 대리이면서 아시아지역(ASIA1, ASIA2, ASIA3 모두 해당)에 근무하는 직원 조회
-- 사번(EMPLOYEE.EMP_ID), 이름(EMPLOYEE.EMP_NAME), 직급명(JOB.JOB_NAME), 부서명(DEPARTMENT.DEPT_TITLE)
-- , 근무지역명(LOCATION.LOCAL_NAME), 급여(EMPLOYEE.SALARY)를 조회
-- (해당 컬럼을 찾고, 해당 컬럼을 지닌 테이블들을 찾고, 테이블들을 어떤 순서로 조인해야 하는지 고민하고 SQL문 작성)
SELECT
	  a.EMP_ID
	, a.EMP_NAME
	, c.JOB_NAME
	, b.DEPT_TITLE
	, d.LOCAL_NAME
	, a.SALARY
FROM employee a
JOIN department b ON a.DEPT_CODE = b.DEPT_ID
JOIN job c ON a.JOB_CODE = c.JOB_CODE
JOIN location d ON b.LOCATION_ID = d.LOCAL_CODE
WHERE c.JOB_CODE = 'J6' AND LOCAL_CODE IN ('L1', 'L2', 'L3')
