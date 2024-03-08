-- 오라클의 한 줄 주석
/* 
    오라클의 여러 줄 주석
*/

-- SELECT [컬럼 명(여러개 가능)] FROM [테이블 이름];
SELECT * FROM employees;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;
    
-- 컬럼을 조회하는 위치에서 */+- 연산이 가능합니다.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1 AS "성과급 포함"
FROM employees; --salary에 10%를 가산한 값을 조회, 원본 테이블엔 영향 없음

--NULL 값의 확인 (값이 없는 것이지 숫자 0이나 공백과는 다른 존재)
SELECT department_id, commission_pct
FROM employees;

-- alias(컬럼명, 테이블명의 이름을 변경해서 조회)
SELECT
    first_name AS 이름,
    last_name AS 성,
    salary AS 급여
FROM employees;

-- || (문자열 연결 기호), 문자열 안에 덧셈 연산 허용 안 함
-- 오라클은 홑따옴표로 문자를 표현하고 문자열 안에 홑따옴표 특수기호를
-- 표현하고 싶다면 ''를 두 번 연속으로 쓰면 된다.
SELECT
    first_name || ' ' || last_name || '''s salary is ' || salary AS 급여내역
FROM employees;

-- DISTINCT (중복 행의 제거)
SELECT DISTINCT department_id FROM employees;

-- ROWNUM, ROWID (행 번호, 행 아이디)
-- **ROWNUM: 쿼리에 의해 반환되는 행 번호를 반환
-- ROWID: 데이터베이스 내의 행 주소 반환
SELECT ROWNUM, ROWID, employee_id
FROM employees;
