
SELECT * FROM dual; -- ����Ŭ �⺻ ���� ���̺�. 
/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺��Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
*/

-- lower(���ڿ�): ��� �ҹ��ڷ� ��ȯ
-- initcap(���ڿ�): �ձ��ڸ� �빮�ڷ� ��ȯ
-- upper(���ڿ�): �빮�ڷ� ��ȯ
SELECT 'abcDEF', lower('abcDEF'), initcap('abcDEF'), upper('abcDEF')
FROM dual;

SELECT last_name, lower(last_name), initcap(last_name), upper(last_name)
FROM employees;

SELECT salary
FROM employees
WHERE LOWER(last_name) = 'austin'; --��ҹ��� ������ ��ƴٸ� �ƿ� �ҹ��ڷ� �ٲ㼭 ��


-- length(���ڿ�): ���ڿ� ���� ��ȸ
-- instr(��� ���ڿ�, ã�� ���ڿ�): ���� ã��, ������ 0�� ��ȯ, ������ �ε����� ��ȯ
-- ����: DB �ʿ��� �ε����� 1���� �����Ѵ�.
SELECT 'abcDEF', length('abcDEF'), instr('abcDEF', 'b'), instr('abcDEF', '8')
FROM dual; -- abcDEF, 6, 2, 0

SELECT
    first_name,
    length(first_name),
    instr(first_name, 'a')
FROM employees;


-- substr(�ڸ� ���ڿ�, ���� �ε���, ���� ���� ����)
-- substr(�ڸ� ���ڿ�, ���� �ε���) -> ���ڿ� ������
-- �ε��� 1���� ����
-- concat(���� ����)  ����Ŭ�� �Ű����� 2���� �޴´�.
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

-- ��, ������ ������ ���ڿ��� ä���
--LPAD(��� ���ڿ�, ���� �� ����, ���� ���ڿ�)
--RPAD(��� ���ڿ�, ���� �� ����, ���� ���ڿ�)
--ID, ��ȭ��ȣ ����������� Ȱ�� ����
SELECT
    LPAD('abc', 10, '*'),
    RPAD('abc', 10, '*')
FROM dual;


--TRIM(���ڿ�) : ���� ���� ����
--LTRIM(param1, param2) : param2�� ���� param1���� ã�Ƽ� ����(���ʺ���)
--RTRIM(param1, param2) : param2�� ���� param1���� ã�Ƽ� ����(�����ʺ���)

SELECT
    LTRIM('javascript_java', 'java'),
    RTRIM('javascript_java', 'java')
FROM dual;

SELECT
    TRIM('        java         ')
FROM dual;


--REPLACE(���� ���ڿ�, OLD, NEW)
SELECT
    REPLACE('My dream is a president', 'president', 'programmer')
FROM dual;

SELECT
    REPLACE(REPLACE('My dream is a president', 'president', 'programmer'),' ', '')
FROM dual; -- �޼��� ȣ�� ��ø ����
-- ������ ���� �� �ִ�

SELECT
    REPLACE(CONCAT('HELLO','WORLD!'), '!', '?')
FROM dual;


-------------------------�ǽ�����------------------------

/*
���� 1.
EMPLOYEES ���̺��� �̸�, �Ի����� �÷����� ����(��Ī)�ؼ� �̸������� �������� ��� �մϴ�.
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�. (CONCAT)
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�. (REPLACE)
*/
SELECT
    CONCAT(first_name, last_name) AS �̸�,
    REPLACE(hire_date,'/','')
FROM employees
ORDER BY �̸� ASC;


/*
���� 2.
EMPLOYEES ���̺��� phone_number�÷��� ###.###.####���·� ����Ǿ� �ִ�
���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� 
��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���. 
*/
SELECT
    phone_number,
    SUBSTR(phone_number,1,3),
    REPLACE(phone_number, SUBSTR(phone_number,1,3), '(02)')
FROM employees;

-- ������ Ǯ��
SELECT
    CONCAT('(02)', SUBSTR(phone_number, 5))
FROM employees;


/*
���� 3. 
EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
���� 1) ���ϱ� ���� ���� �ҹ��ڷ� ���ؾ� �մϴ�.(��Ʈ : lower �̿�)
���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
*/

SELECT
    RPAD(SUBSTR(first_name, 1, 3), length(first_name), '*') AS name,
    LPAD(salary, 10, '*') AS salary 
FROM employees
WHERE LOWER(job_id) = 'it_prog';
