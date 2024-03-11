
SELECT * FROM employees;

-- WHERE절 비교 (데이터값은 대소문자를 철저히 구분한다. )
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG'; -- 오라클에서는 같다가 '='이다. 

SELECT *
FROM employees
WHERE last_name = 'King';

SELECT * 
FROM employees
WHERE department_id = '50'; -- 문자열로 대입해도 암묵적 형변환을 통해 정수값도 조회해줌

SELECT * 
FROM employees
WHERE salary >= 15000
AND salary < 20000; -- AND로 조건을 추가한다.

SELECT * 
FROM employees
WHERE hire_date = '04/01/30'; -- date type은 문자열 형태로 조회


-- 데이터의 행 제한 (BETWEEN, IN, LIKE)
SELECT * 
FROM employees
WHERE salary BETWEEN 15000 AND 20000;
-- 비교연산자 쓰는 것과 동일한 결과
-- 연산속도는 비교연산자가 더 빠르지만 BETWEEN은 코드 가독성이 좋다.

SELECT * 
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';


-- IN 연산자의 사용: 특정 값들과 비교할 때 사용
SELECT * FROM employees
WHERE manager_id = 100
OR manager_id = 101
OR manager_id = 102;
-- IN을 사용하면 이 쿼리를 아래와 같이 간단하게 만들 수 있다.

SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');


-- LIKE 연산자(지정 문자열 포함 여부)
-- %는 어떤 문자든 조회, _는 데이터 자리를 지정하여 조회
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '03%'; -- '03'으로 시작하는 ANYTHING 조회

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%15'; -- '15'로 끝나는 ANYTHING 조회

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%'; -- '05'가 포함되는 ANYTHING 조회

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%'; -- 언더스코어로 정확한 자리 지정하여 조회 

-- IS NULL(NULL 값을 찾는다. NULL은 동등연산자로 찾지 않는다)
/*
SELECT * FROM employees
WHERE commission_pct = NULL;
*/

SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;


-- AND, OR
SELECT * FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;
-- 조회 의도: IT_PROG거나 FI_MGR 중에 SALARY가 6000 이상인 레코드만 조회
-- 결과: AND 연산이 먼저이므로 (job_id = 'FI_MGR' AND salary >= 6000)이 먼저 연산되어
-- 의도한 결과 대로 안 나옴.

SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;


-- 데이터의 정렬(SELECT 구문의 가장 마지막에 배치됩니다.)
-- ASC: acending 오름차순 -> 생략가능
-- DESC: descending 내림차순\
SELECT * FROM employees
ORDER BY hire_date ASC;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;

SELECT * FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;

SELECT
    first_name,
    salary*12 AS pay
FROM employees
ORDER BY pay ASC; -- 따로 지정한 별명도 정렬조건 기준으로 삼을 수 있음








