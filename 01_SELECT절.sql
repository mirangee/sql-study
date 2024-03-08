-- ����Ŭ�� �� �� �ּ�
/* 
    ����Ŭ�� ���� �� �ּ�
*/

-- SELECT [�÷� ��(������ ����)] FROM [���̺� �̸�];
SELECT * FROM employees;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;
    
-- �÷��� ��ȸ�ϴ� ��ġ���� */+- ������ �����մϴ�.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1 AS "������ ����"
FROM employees; --salary�� 10%�� ������ ���� ��ȸ, ���� ���̺� ���� ����

--NULL ���� Ȯ�� (���� ���� ������ ���� 0�̳� ������� �ٸ� ����)
SELECT department_id, commission_pct
FROM employees;

-- alias(�÷���, ���̺���� �̸��� �����ؼ� ��ȸ)
SELECT
    first_name AS �̸�,
    last_name AS ��,
    salary AS �޿�
FROM employees;

-- || (���ڿ� ���� ��ȣ), ���ڿ� �ȿ� ���� ���� ��� �� ��
-- ����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ� ���ڿ� �ȿ� Ȭ����ǥ Ư����ȣ��
-- ǥ���ϰ� �ʹٸ� ''�� �� �� �������� ���� �ȴ�.
SELECT
    first_name || ' ' || last_name || '''s salary is ' || salary AS �޿�����
FROM employees;

-- DISTINCT (�ߺ� ���� ����)
SELECT DISTINCT department_id FROM employees;

-- ROWNUM, ROWID (�� ��ȣ, �� ���̵�)
-- **ROWNUM: ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ��ȯ
-- ROWID: �����ͺ��̽� ���� �� �ּ� ��ȯ
SELECT ROWNUM, ROWID, employee_id
FROM employees;
