
SELECT * FROM employees;

-- WHERE�� �� (�����Ͱ��� ��ҹ��ڸ� ö���� �����Ѵ�. )
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG'; -- ����Ŭ������ ���ٰ� '='�̴�. 

SELECT *
FROM employees
WHERE last_name = 'King';

SELECT * 
FROM employees
WHERE department_id = '50'; -- ���ڿ��� �����ص� �Ϲ��� ����ȯ�� ���� �������� ��ȸ����

SELECT * 
FROM employees
WHERE salary >= 15000
AND salary < 20000; -- AND�� ������ �߰��Ѵ�.

SELECT * 
FROM employees
WHERE hire_date = '04/01/30'; -- date type�� ���ڿ� ���·� ��ȸ


-- �������� �� ���� (BETWEEN, IN, LIKE)
SELECT * 
FROM employees
WHERE salary BETWEEN 15000 AND 20000;
-- �񱳿����� ���� �Ͱ� ������ ���
-- ����ӵ��� �񱳿����ڰ� �� �������� BETWEEN�� �ڵ� �������� ����.

SELECT * 
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';


-- IN �������� ���: Ư�� ����� ���� �� ���
SELECT * FROM employees
WHERE manager_id = 100
OR manager_id = 101
OR manager_id = 102;
-- IN�� ����ϸ� �� ������ �Ʒ��� ���� �����ϰ� ���� �� �ִ�.

SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');


-- LIKE ������(���� ���ڿ� ���� ����)
-- %�� � ���ڵ� ��ȸ, _�� ������ �ڸ��� �����Ͽ� ��ȸ
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '03%'; -- '03'���� �����ϴ� ANYTHING ��ȸ

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%15'; -- '15'�� ������ ANYTHING ��ȸ

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%'; -- '05'�� ���ԵǴ� ANYTHING ��ȸ

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%'; -- ������ھ�� ��Ȯ�� �ڸ� �����Ͽ� ��ȸ 

-- IS NULL(NULL ���� ã�´�. NULL�� ������ڷ� ã�� �ʴ´�)
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
-- ��ȸ �ǵ�: IT_PROG�ų� FI_MGR �߿� SALARY�� 6000 �̻��� ���ڵ常 ��ȸ
-- ���: AND ������ �����̹Ƿ� (job_id = 'FI_MGR' AND salary >= 6000)�� ���� ����Ǿ�
-- �ǵ��� ��� ��� �� ����.

SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;


-- �������� ����(SELECT ������ ���� �������� ��ġ�˴ϴ�.)
-- ASC: acending �������� -> ��������
-- DESC: descending ��������\
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
ORDER BY pay ASC; -- ���� ������ ���� �������� �������� ���� �� ����








