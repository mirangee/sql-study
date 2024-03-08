
SELECT * FROM employees;

-- WHERE절 비교 (데이터값은 대소문자 구분함 )
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG'; -- 오라클에서는 같다가 '=' 

SELECT *
FROM employees
WHERE last_name = 'King';













