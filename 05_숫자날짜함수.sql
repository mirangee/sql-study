-- �����Լ�
-- ROUND(�ݿø�)
-- ���ϴ� �ݿø� ��ġ�� �Ű������� ����. ������ �ִ� �͵� ����
SELECT
    ROUND(3.1415, 3),ROUND(45.923, 0),ROUND(45.923, -1)
FROM dual;


-- TRUNC(����)
-- ������ �Ҽ��� �ڸ� ������ �߶���ϴ�.
SELECT
    TRUNC(3.1415, 3),TRUNC(45.923, 0),TRUNC(45.923, -1) 
FROM dual;

-- ABS(���밪)
SELECT ABS(-34) FROM dual;

-- CEIL(�ø�), FLOOR(����): �Ҽ����� ��� �����ų� �ø���.
SELECT
    CEIL(3.1415),
    FLOOR(3.1415)
FROM dual;

--MOD(������ ������ ����) : ����Ŭ�� % ������ ����.
SELECT
    10 / 4, MOD(10, 4)
FROM dual;

---------------------------------------------------------------

--��¥�Լ�
-- sysdate : ��ǻ���� ���� ��¥, �ð� ������ �����ͼ� �����ϴ� �Լ� -> �ð� ������ ����
SELECT sysdate FROM dual; -- ����->ȯ�漳��->�����ͺ��̽�->NLS���� �ð� ���� ���̴� ������ �ٲ� �� �ִ�(HH24:MI:SS).
SELECT systimestamp FROM dual;  -- �и���, ǥ�� �ñ��� ����

-- ��¥�� ���� ����(���ڸ� ���� ������ ����)
SELECT sysdate - 1 FROM dual;

-- ��¥Ÿ�� ������ ���� ���� ���(��, ������ ��� �� ��)
SELECT 
    first_name,
    sysdate - hire_date --�ϼ� 
FROM employees;

SELECT 
    first_name,
    (sysdate - hire_date) / 7 AS Week --�ּ� 
FROM employees;

SELECT 
    first_name,
    (sysdate - hire_date) / 365 AS Year --����
FROM employees;

--ROUND : ��¥ �ݿø�, ����
SELECT ROUND(sysdate) FROM dual; -- ������ �������� �Ϸ� ���� �ݿø�
SELECT ROUND(sysdate, 'year') FROM dual; -- ������ �������� �� ���� �ݿø�
SELECT ROUND(sysdate, 'month') FROM dual; -- ������ �������� �� ���� �ݿø�
SELECT ROUND(sysdate, 'day') FROM dual; -- ������ �������� �� ���� �ݿø�(�� ���� ������ �Ͽ���)

SELECT TRUNC(sysdate) FROM dual; -- ������ �������� �Ϸ� ���� ����
SELECT TRUNC(sysdate, 'year') FROM dual; -- ������ �������� �� ���� ����
SELECT TRUNC(sysdate, 'month') FROM dual; -- ������ �������� �� ���� ����
SELECT TRUNC(sysdate, 'day') FROM dual; -- ������ �������� �� ���� ����(�� ���� ������ �Ͽ���)