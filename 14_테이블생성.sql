/*
���̺� ���� �� ������ Ÿ��
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��. NUMBER(2,0)
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�
    ��) 314.158235 -> 314.16 (�Ҽ��� 3�ڸ����� �ݿø�) 
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����˴ϴ�.
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte����)
    ��) VARCHAR2(20)  -> 20byte���� 
- CLOB -> Character Large OBject ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> Binary Large OBject ������ ��뷮 ��ü (�̹���, ���� ���� �� ���)
- DATE -> BC 4712�� 1�� 1�� ~ AD 9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ���� ����.
*/

CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    bonus NUMBER(10)
);

SELECT * FROM dept2;
DESC DEPT2;

-- NUMBER�� VARCHAR2 Ÿ���� ���̸� Ȯ��
INSERT INTO dept2
VALUES (10, '������', '����', sysdate, 1000000);

INSERT INTO dept2
VALUES (20, 'ȸ���', '���', sysdate, 2000000);

INSERT INTO dept2
VALUES (30, '�濵����', '���', sysdate, 2000000000);