-- 숫자함수
-- ROUND(반올림)
-- 원하는 반올림 위치를 매개값으로 지정. 음수를 주는 것도 가능
SELECT
    ROUND(3.1415, 3),ROUND(45.923, 0),ROUND(45.923, -1)
FROM dual;


-- TRUNC(절사)
-- 정해진 소수점 자리 수까지 잘라냅니다.
SELECT
    TRUNC(3.1415, 3),TRUNC(45.923, 0),TRUNC(45.923, -1) 
FROM dual;

-- ABS(절대값)
SELECT ABS(-34) FROM dual;

-- CEIL(올림), FLOOR(내림): 소수점을 모두 내리거나 올린다.
SELECT
    CEIL(3.1415),
    FLOOR(3.1415)
FROM dual;

--MOD(나머지 나눗셈 연산) : 오라클엔 % 연산이 없다.
SELECT
    10 / 4, MOD(10, 4)
FROM dual;

---------------------------------------------------------------

--날짜함수
-- sysdate : 컴퓨터의 현재 날짜, 시간 정보를 가져와서 제공하는 함수 -> 시간 정보도 있음
SELECT sysdate FROM dual; -- 도구->환경설정->데이터베이스->NLS에서 시간 정보 보이는 설정을 바꿀 수 있다(HH24:MI:SS).
SELECT systimestamp FROM dual;  -- 밀리초, 표준 시까지 제공

-- 날짜도 연산 가능(일자만 숫자 덧뺄셈 가능)
SELECT sysdate - 1 FROM dual;

-- 날짜타입 간에는 뺄셈 연산 허용(단, 덧셈은 허용 안 함)
SELECT 
    first_name,
    sysdate - hire_date --일수 
FROM employees;

SELECT 
    first_name,
    (sysdate - hire_date) / 7 AS Week --주수 
FROM employees;

SELECT 
    first_name,
    (sysdate - hire_date) / 365 AS Year --연수
FROM employees;

--ROUND : 날짜 반올림, 절사
SELECT ROUND(sysdate) FROM dual; -- 오늘을 기준으로 하루 단위 반올림
SELECT ROUND(sysdate, 'year') FROM dual; -- 오늘을 기준으로 연 단위 반올림
SELECT ROUND(sysdate, 'month') FROM dual; -- 오늘을 기준으로 월 단위 반올림
SELECT ROUND(sysdate, 'day') FROM dual; -- 오늘을 기준으로 주 단위 반올림(한 주의 시작은 일요일)

SELECT TRUNC(sysdate) FROM dual; -- 오늘을 기준으로 하루 단위 절사
SELECT TRUNC(sysdate, 'year') FROM dual; -- 오늘을 기준으로 연 단위 절사
SELECT TRUNC(sysdate, 'month') FROM dual; -- 오늘을 기준으로 월 단위 절사
SELECT TRUNC(sysdate, 'day') FROM dual; -- 오늘을 기준으로 주 단위 절사(한 주의 시작은 일요일)