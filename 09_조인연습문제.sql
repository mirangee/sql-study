/*
���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� �ּ����� �ۼ�)
*/
SELECT *
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id; --rows: 106

SELECT *
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id; --rows: 107

SELECT *
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id; --rows: 122

SELECT *
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id; --rows: 123

/*
���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_name�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
*/
SELECT e.first_name || ' ' || e.last_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 200;


/*
���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����Ǿ� �ִ��� Ȯ��
*/
SELECT e.first_name, e.job_id, j.job_title
FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.first_name;



/*
���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
*/
SELECT *
FROM jobs
LEFT OUTER JOIN job_history
ON jobs.job_id = job_history.job_id;

/*
���� 5.
--Steven King�� �μ����� ����ϼ���.
*/
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.first_name = 'Steven'
AND e.last_name = 'King';

/*
���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
*/
SELECT *
FROM employees
CROSS JOIN departments;

/*
���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
*/

SELECT
    e.employee_id AS �����ȣ,
    e.first_name AS �̸�,
    e.salary AS �޿�,
    d.department_name AS �μ���,
    loc.city AS �ٹ���
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations loc
ON d.location_id = loc.location_id
WHERE e.job_id = 'SA_MAN'
ORDER BY �����ȣ;

/*
���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� 
���� ������ ����ϼ���.
*/
SELECT *
FROM employees e
LEFT JOIN jobs j
ON e.job_id = j.job_id
WHERE j.job_title IN ('Stock Manager','Stock Clerk');

/*
���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
*/
SELECT d.department_name
FROM departments d
LEFT JOIN employees e
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

/*
���� 10. 
-join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
*/
SELECT 
    e1.first_name AS �����,
    e2.first_name AS �Ŵ�����
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;

/*
���� 11. 
-- EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)id��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���.
-- �Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� �����ϼ���.
*/
SELECT 
    e1.first_name AS �����,
    e1.manager_id AS ������ID,
    e2.first_name AS �Ŵ�����,
    e2.salary AS "�Ŵ��� �޿�"
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e2.salary desc;