--WHILE ��
DECLARE
    v_total NUMBER := 0;
    v_count NUMBER := 1; -- begin
BEGIN
    WHILE v_count <= 10 -- end
    LOOP -- ��ȣ ����
        v_total := v_total + v_count;
        v_count := v_count + 1; -- step
    END LOOP; -- ��ȣ ����
    dbms_output.put_line(v_total);
END;


--Ż�⹮ EXIT WHEN
DECLARE
    v_total NUMBER := 0;
    v_count NUMBER := 1; -- begin
BEGIN
    WHILE v_count <= 10 -- end
    LOOP -- ��ȣ ����
        EXIT WHEN v_count = 5; --break ����
        v_total := v_total + v_count;
        v_count := v_count + 1; -- step
    END LOOP; -- ��ȣ ����
    dbms_output.put_line(v_total);
END;


-- FOR��
-- ����: ������ 7��
DECLARE
    v_num NUMBER := 7;
BEGIN    
    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ���� ǥ�� (1���� 9���� for���� �����ڴ�)
    LOOP
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
END;


-- CONTINUE �� CONTINUE WHEN
DECLARE
    v_num NUMBER := 7;
BEGIN    
    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ���� ǥ�� (1���� 9���� for���� �����ڴ�)
    LOOP
        CONTINUE WHEN MOD(i,2) = 0;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
END;

-----------------------------------------------------------------------------
-- 1. ��� �������� ����ϴ� �͸� ����� ���弼��. (2 ~ 9��)
-- ¦���ܸ� ����� �ּ���. (2, 4, 6, 8)
-- ����� ����Ŭ ������ �߿��� �������� �˾Ƴ��� �����ڰ� �����. (% ����~)
DECLARE
BEGIN
    FOR i in 2..8
    LOOP
        CONTINUE WHEN MOD(i, 2) <> 0;
        dbms_output.put_line('***** ������ ' || i || '�� *****');
        FOR j IN 1..9
        LOOP
            dbms_output.put_line(i || 'x' || j || '=' || i*j);
        END LOOP;
        dbms_output.put_line('====================');
    END LOOP;
END;


-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno, writer, title �÷��� �����մϴ�.)
-- bno�� SEQUENCE�� �÷� �ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT ������ �ּ���.
-- ex) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title3 ....

SELECT * FROM board;

DROP TABLE board;
DROP SEQUENCE sequence_bno;
SELECT sequence_bno.CURRVAL FROM dual;

CREATE TABLE board (
    bno NUMBER PRIMARY KEY,
    writer VARCHAR2(10),
    title VARCHAR2(10)
)

CREATE SEQUENCE sequence_bno
    START WITH 1
    INCREMENT BY 1;

DECLARE
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 300
    LOOP
        INSERT INTO board
        VALUES(sequence_bno.NEXTVAL, 'test' || v_count, 'title' || v_count);
        v_count := v_count+1;
    END LOOP;
END;

COMMIT;














