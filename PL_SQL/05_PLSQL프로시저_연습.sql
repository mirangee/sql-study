/*
프로시저명 divisor_proc
숫자 하나를 전달받아 해당 값의 약수의 개수를 출력하는 프로시저를 선언합니다.
*/
CREATE OR REPLACE PROCEDURE divisor_proc
    (p_num IN Number)
IS
    v_cnt Number := 0;
BEGIN
    FOR i IN 1..p_num
    LOOP
        IF MOD(P_NUM, i) = 0 THEN
            v_cnt := v_cnt + 1;
        END IF;
    END LOOP;
    dbms_output.put_line(p_num ||'의 약수 개수: ' || v_cnt || '개');
END;

EXEC divisor_proc(72);

/*
부서번호, 부서명, 작업 flag(I: insert, U:update, D:delete)을 매개변수로 받아 
depts 테이블에 
각각 INSERT, UPDATE, DELETE 하는 depts_proc 란 이름의 프로시저를 만들어보자.
그리고 정상종료라면 commit, 예외라면 롤백 처리하도록 처리하세요.
*/
CREATE OR REPLACE PROCEDURE depts_proc
    (
    p_department_id IN depts.department_id%TYPE,
    p_department_name IN VARCHAR2,
    p_flag IN VARCHAR2
    )
IS
    v_cnt NUMBER := 0;
BEGIN
    SELECT COUNT(*)
    INTO v_cnt
    FROM depts d
    WHERE d.department_id = p_department_id;
    
    IF p_flag = 'I' THEN
        INSERT INTO depts (department_id, department_name)
        VALUES (p_department_id, p_department_name);
    ELSIF p_flag = 'U' THEN
        IF v_cnt = 0 THEN
            dbms_output.put_line('존재하지 않는 부서 ID입니다.');
            RETURN;
        END IF;
        UPDATE depts d
        SET d.department_name = p_department_name
        WHERE d.department_id = p_department_id;
    ELSIF p_flag = 'D' THEN
        IF v_cnt = 0 THEN
            dbms_output.put_line('존재하지 않는 부서 ID입니다.');
            RETURN;
        END IF;
        DELETE FROM depts d
        WHERE d.department_id = p_department_id;
    ELSE
        dbms_output.put_line('잘못된 flag 값을 입력했습니다.');
    END IF;
    
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN        
        dbms_output.put_line('예외가 발생했어요.');
        dbms_output.put_line('ERROR MSG: '|| SQLERRM);
        dbms_output.put_line('ERROR CODE: '|| SQLCODE);
        ROLLBACK;    
END;


EXEC depts_proc(80, 'yayaya', 'I');
ALTER TABLE depts ADD CONSTRAINT depts_deptno_pk PRIMARY KEY(department_id);
DESC depts;
SELECT constraint_name, constraint_type, table_name FROM user_constraints WHERE table_name = 'depts';
/*
employee_id를 전달받아 employees에 존재하면,
근속년수를 out하는 프로시저를 작성하세요. (익명블록에서 프로시저를 실행)
없다면 exception처리하세요
*/

CREATE OR REPLACE PROCEDURE calc_workyear_proc
    (p_employee_id IN NUMBER,
    p_work_years OUT NUMBER)
IS
    v_hire_date DATE;
BEGIN
    SELECT hire_date
    INTO v_hire_date
    FROM employees e
    WHERE e.employee_id = p_employee_id;
   
    p_work_years := TRUNC((sysdate - v_hire_date) / 365, 0);
    
    EXCEPTION WHEN NO_DATA_FOUND THEN        
        dbms_output.put_line('존재하지 않는 id입니다');
END;

DECLARE
    v_employee_id NUMBER := 300;
    v_work_years NUMBER;
BEGIN
    calc_workyear_proc(v_employee_id, v_work_years);
    IF v_work_years IS NOT NULL THEN
        dbms_output.put_line(v_employee_id || '사원의 근속연수는 ' || v_work_years || '년입니다'); 
    END IF;
END;