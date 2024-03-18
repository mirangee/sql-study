/*
���ν����� divisor_proc
���� �ϳ��� ���޹޾� �ش� ���� ����� ������ ����ϴ� ���ν����� �����մϴ�.
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
    dbms_output.put_line(p_num ||'�� ��� ����: ' || v_cnt || '��');
END;

EXEC divisor_proc(72);

/*
�μ���ȣ, �μ���, �۾� flag(I: insert, U:update, D:delete)�� �Ű������� �޾� 
depts ���̺� 
���� INSERT, UPDATE, DELETE �ϴ� depts_proc �� �̸��� ���ν����� ������.
�׸��� ���������� commit, ���ܶ�� �ѹ� ó���ϵ��� ó���ϼ���.
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
            dbms_output.put_line('�������� �ʴ� �μ� ID�Դϴ�.');
            RETURN;
        END IF;
        UPDATE depts d
        SET d.department_name = p_department_name
        WHERE d.department_id = p_department_id;
    ELSIF p_flag = 'D' THEN
        IF v_cnt = 0 THEN
            dbms_output.put_line('�������� �ʴ� �μ� ID�Դϴ�.');
            RETURN;
        END IF;
        DELETE FROM depts d
        WHERE d.department_id = p_department_id;
    ELSE
        dbms_output.put_line('�߸��� flag ���� �Է��߽��ϴ�.');
    END IF;
    
    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN        
        dbms_output.put_line('���ܰ� �߻��߾��.');
        dbms_output.put_line('ERROR MSG: '|| SQLERRM);
        dbms_output.put_line('ERROR CODE: '|| SQLCODE);
        ROLLBACK;    
END;


EXEC depts_proc(80, 'yayaya', 'I');
ALTER TABLE depts ADD CONSTRAINT depts_deptno_pk PRIMARY KEY(department_id);
DESC depts;
SELECT constraint_name, constraint_type, table_name FROM user_constraints WHERE table_name = 'depts';
/*
employee_id�� ���޹޾� employees�� �����ϸ�,
�ټӳ���� out�ϴ� ���ν����� �ۼ��ϼ���. (�͸��Ͽ��� ���ν����� ����)
���ٸ� exceptionó���ϼ���
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
        dbms_output.put_line('�������� �ʴ� id�Դϴ�');
END;

DECLARE
    v_employee_id NUMBER := 300;
    v_work_years NUMBER;
BEGIN
    calc_workyear_proc(v_employee_id, v_work_years);
    IF v_work_years IS NOT NULL THEN
        dbms_output.put_line(v_employee_id || '����� �ټӿ����� ' || v_work_years || '���Դϴ�'); 
    END IF;
END;