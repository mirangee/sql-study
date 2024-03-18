--WHILE 문
DECLARE
    v_total NUMBER := 0;
    v_count NUMBER := 1; -- begin
BEGIN
    WHILE v_count <= 10 -- end
    LOOP -- 괄호 역할
        v_total := v_total + v_count;
        v_count := v_count + 1; -- step
    END LOOP; -- 괄호 역할
    dbms_output.put_line(v_total);
END;


--탈출문 EXIT WHEN
DECLARE
    v_total NUMBER := 0;
    v_count NUMBER := 1; -- begin
BEGIN
    WHILE v_count <= 10 -- end
    LOOP -- 괄호 역할
        EXIT WHEN v_count = 5; --break 역할
        v_total := v_total + v_count;
        v_count := v_count + 1; -- step
    END LOOP; -- 괄호 역할
    dbms_output.put_line(v_total);
END;


-- FOR문
-- 예시: 구구단 7단
DECLARE
    v_num NUMBER := 7;
BEGIN    
    FOR i IN 1..9 -- .을 두 개 작성해서 범위 표현 (1부터 9까지 for문을 돌리겠다)
    LOOP
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
END;


-- CONTINUE 문 CONTINUE WHEN
DECLARE
    v_num NUMBER := 7;
BEGIN    
    FOR i IN 1..9 -- .을 두 개 작성해서 범위 표현 (1부터 9까지 for문을 돌리겠다)
    LOOP
        CONTINUE WHEN MOD(i,2) = 0;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
END;

-----------------------------------------------------------------------------
-- 1. 모든 구구단을 출력하는 익명 블록을 만드세요. (2 ~ 9단)
-- 짝수단만 출력해 주세요. (2, 4, 6, 8)
-- 참고로 오라클 연산자 중에는 나머지를 알아내는 연산자가 없어요. (% 없음~)
DECLARE
BEGIN
    FOR i in 2..8
    LOOP
        CONTINUE WHEN MOD(i, 2) <> 0;
        dbms_output.put_line('***** 구구단 ' || i || '단 *****');
        FOR j IN 1..9
        LOOP
            dbms_output.put_line(i || 'x' || j || '=' || i*j);
        END LOOP;
        dbms_output.put_line('====================');
    END LOOP;
END;


-- 2. INSERT를 300번 실행하는 익명 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요. (bno, writer, title 컬럼이 존재합니다.)
-- bno는 SEQUENCE로 올려 주시고, writer와 title에 번호를 붙여서 INSERT 진행해 주세요.
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














