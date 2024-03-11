
SELECT * FROM dual; -- 오라클 기본 더미 테이블. 
/*
dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서,
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블입니다.
일시적인 산술 연산이나 날짜 연산 등에 주로 사용합니다.
모든 사용자가 접근할 수 있습니다.
*/

-- lower(문자열): 모두 소문자로 변환
-- initcap(문자열): 앞글자만 대문자로 변환
-- upper(문자열): 대문자로 변환
SELECT 'abcDEF', lower('abcDEF'), initcap('abcDEF'), upper('abcDEF')
FROM dual;

SELECT last_name, lower(last_name), initcap(last_name), upper(last_name)
FROM employees;

SELECT salary
FROM employees
WHERE LOWER(last_name) = 'austin'; --대소문자 구분이 어렵다면 아예 소문자로 바꿔서 비교


-- length(문자열): 문자열 길이 조회
-- instr(대상 문자열, 찾을 문자열): 문자 찾기, 없으면 0을 반환, 있으면 인덱스값 반환
-- 참고: DB 쪽에서 인덱스는 1부터 시작한다.
SELECT 'abcDEF', length('abcDEF'), instr('abcDEF', 'b'), instr('abcDEF', '8')
FROM dual; -- abcDEF, 6, 2, 0

SELECT
    first_name,
    length(first_name),
    instr(first_name, 'a')
FROM employees;


-- substr(자를 문자열, 시작 인덱스, 남길 문자 길이)
-- substr(자를 문자열, 시작 인덱스) -> 문자열 끝까지
-- 인덱스 1부터 시작
-- concat(문자 연결)  오라클은 매개값을 2개만 받는다.
SELECT
    'abcDEF' AS ex,
    SUBSTR('abcDEF', 2, 5),
    CONCAT('abc','123')
FROM dual;

SELECT
    first_name AS ex,
    SUBSTR(first_name, 1, 3),
    CONCAT(first_name,last_name)
FROM employees;

-- 좌, 우측을 지정한 문자열로 채우기
--LPAD(대상 문자열, 글자 총 길이, 지정 문자열)
--RPAD(대상 문자열, 글자 총 길이, 지정 문자열)
--ID, 전화번호 가리기용으로 활용 가능
SELECT
    LPAD('abc', 10, '*'),
    RPAD('abc', 10, '*')
FROM dual;


--TRIM(문자열) : 양쪽 공백 제거
--LTRIM(param1, param2) : param2의 값을 param1에서 찾아서 제거(왼쪽부터)
--RTRIM(param1, param2) : param2의 값을 param1에서 찾아서 제거(오른쪽부터)

SELECT
    LTRIM('javascript_java', 'java'),
    RTRIM('javascript_java', 'java')
FROM dual;

SELECT
    TRIM('        java         ')
FROM dual;


--REPLACE(기준 문자열, OLD, NEW)
SELECT
    REPLACE('My dream is a president', 'president', 'programmer')
FROM dual;

SELECT
    REPLACE(REPLACE('My dream is a president', 'president', 'programmer'),' ', '')
FROM dual; -- 메서드 호출 중첩 가능
-- 공백을 없앨 수 있다

SELECT
    REPLACE(CONCAT('HELLO','WORLD!'), '!', '?')
FROM dual;


-------------------------실습예제------------------------

/*
문제 1.
EMPLOYEES 테이블에서 이름, 입사일자 컬럼으로 변경(별칭)해서 이름순으로 오름차순 출력 합니다.
조건 1) 이름 컬럼은 first_name, last_name을 붙여서 출력합니다. (CONCAT)
조건 2) 입사일자 컬럼은 xx/xx/xx로 저장되어 있습니다. xxxxxx형태로 변경해서 출력합니다. (REPLACE)
*/
SELECT
    CONCAT(first_name, last_name) AS 이름,
    REPLACE(hire_date,'/','')
FROM employees
ORDER BY 이름 ASC;


/*
문제 2.
EMPLOYEES 테이블에서 phone_number컬럼은 ###.###.####형태로 저장되어 있다
여기서 처음 세 자리 숫자 대신 서울 지역변호 (02)를 붙여 
전화 번호를 출력하도록 쿼리를 작성하세요. 
*/
SELECT
    phone_number,
    SUBSTR(phone_number,1,3),
    REPLACE(phone_number, SUBSTR(phone_number,1,3), '(02)')
FROM employees;

-- 선생님 풀이
SELECT
    CONCAT('(02)', SUBSTR(phone_number, 5))
FROM employees;


/*
문제 3. 
EMPLOYEES 테이블에서 JOB_ID가 it_prog인 사원의 이름(first_name)과 급여(salary)를 출력하세요.
조건 1) 비교하기 위한 값은 소문자로 비교해야 합니다.(힌트 : lower 이용)
조건 2) 이름은 앞 3문자까지 출력하고 나머지는 *로 출력합니다. 
이 열의 열 별칭은 name입니다.(힌트 : rpad와 substr 또는 substr 그리고 length 이용)
조건 3) 급여는 전체 10자리로 출력하되 나머지 자리는 *로 출력합니다. 
이 열의 열 별칭은 salary입니다.(힌트 : lpad 이용)
*/

SELECT
    RPAD(SUBSTR(first_name, 1, 3), length(first_name), '*') AS name,
    LPAD(salary, 10, '*') AS salary 
FROM employees
WHERE LOWER(job_id) = 'it_prog';
