-- ���̺� ������ ��������
-- : ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ���� ��Ģ�� �����ϴ� ��.

-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű) UNIQUE KEY + NOT NULL
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����), NULL�� �����
-- NOT NULL: null�� ������� ����. (�ʼ���)
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷� (�ܷ�Ű)
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.(CUSTOM ��������, NOT NULL�� CUSTOM ���� �����̱� �ϴ�.)

-- �÷� ���� ���� ���� (�÷� ���𸶴� �������� ���� )
-- Ű �̸� ���� ���� '���̺��_�÷���_Ű��'
CREATE TABLE dept2 (
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY, -- �������� �ĺ��ڴ� ������ �����մϴ�. (����Ŭ�� �˾Ƽ� �̸� ����)
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
    --FOREIGN KEY�� ������ ���� ���̺��� �÷� ������ Ÿ�԰� ���� �����ؾ� �Ѵ�.
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);



-- ���̺� ���� ���� ���� (��� �� ���� �� �������� ���ϴ� ���)
CREATE TABLE dept2 (
    dept_no NUMBER(2), 
    dept_name VARCHAR2(14) CONSTRAINT dept_name_notnull NOT NULL,
    loca NUMBER(4), 
    dept_bonus NUMBER(10), 
    dept_gender VARCHAR2(1), 
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no), 
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);

-- �ܷ� Ű(foreign key)�� �θ����̺�(�������̺�)�� ���ٸ� INSERT �Ұ���.
INSERT INTO dept2
VALUES(10, 'gg', 6542, 90000, 'M'); -- ���� -> 6542�� ������ ����!

INSERT INTO dept2
VALUES(20, 'hh', 1900, 90000, 'M'); 

UPDATE dept2
SET loca = 4000
WHERE dept_no = 10; -- ����(�ܷ�Ű �������� ����)

UPDATE dept2
SET dept_no = 20
WHERE dept_no = 10; -- ����(�ֿ�Ű �������� ����)

UPDATE dept2
SET dept_bonus = 900
WHERE dept_no = 10; -- ����(check �������� ����)

-- ���̺� ���� ���� �������� �߰� �� ����, ����
-- ���� ������ �߰�, ������ �����մϴ�. ������ �ȵ˴ϴ�.
-- �����Ϸ��� �����ϰ� ���ο� �������� �߰��ؾ� �մϴ�.

CREATE TABLE dept2 (
    dept_no NUMBER(2), 
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4), 
    dept_bonus NUMBER(10), 
    dept_gender VARCHAR2(1)
);

-- pk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no);
-- fk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_loca_locid_fk
FOREIGN KEY(loca) REFERENCES locations(location_id);
-- check �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000);
-- unique �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptname_uk UNIQUE(dept_name);
-- NOT NULL�� �� �������·� �����մϴ�.
ALTER TABLE dept2 MODIFY dept_bonus NUMBER(10) NOT NULL;

-- ���� ���� Ȯ��
SELECT * FROM user_constraints
WHERE table_name = 'DEPT2';

-- ���� ���� ���� (���� ������ �̸����� -> �̸��� ���� ���� �ʾҴٸ� ����Ŭ�� �ο��� �̸��� ����)
ALTER TABLE dept2 DROP CONSTRAINT dept2_deptno_pk;

-------------------------------------------------------------
--����1.
CREATE TABLE mem (
    M_NAME VARCHAR2(10) NOT NULL,
    M_NUM NUMBER(3) CONSTRAINT mem_memnum_pk PRIMARY KEY,
    REG_DATE DATE NOT NULL CONSTRAINT mem_regdate_uk UNIQUE,
    GENDER VARCHAR2(2) CONSTRAINT mem_gender_ck CHECK (GENDER IN ('M','F')) ,
    LOCA NUMBER(4) CONSTRAINT mem_loca_loc_locid_fk REFERENCES LOCATIONS(LOCATION_ID)
);

SELECT * FROM user_constraints
WHERE table_name = 'MEMBERS';

INSERT INTO MEM
VALUES ('AAA', 1, SYSDATE, 'M', 1800);

INSERT INTO MEM
VALUES ('BBB', 2, TO_DATE('2018-07-02'), 'F', 1900);

INSERT INTO MEM
VALUES ('CCC', 3, TO_DATE('2018-07-03'), 'M', 2000);

INSERT INTO MEM
VALUES ('DDD', 4, SYSDATE, 'M', 2000);

INSERT INTO MEMBERS
VALUES ('EEE', 5, '2018.07.31', 'M', 2000);

INSERT INTO MEMBERS
VALUES ('FFF', 6, '18.08.01', 'M', 2000);

INSERT INTO MEMBERS
VALUES ('GGG', 7, '20180802', 'M', 2000);

UPDATE MEM SET reg_date = TO_DATE('2018-07-01')
WHERE M_NUM = 1;


-- ����2.
SELECT m_name, m_num, street_address, l.location_id
FROM MEM M
JOIN LOCATIONS L
ON M.LOCA = L.LOCATION_ID
ORDER BY M.M_NUM;

ALTER TABLE MEMBER
RENAME TO MEMBERS;

SELECT * FROM MEMBERS;