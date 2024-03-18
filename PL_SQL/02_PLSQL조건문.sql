--IF��
DECLARE
    v_salary NUMBER := 0; --SQL���� ���Կ����ڸ� ':=' �̷��� ����.
    v_department_id NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1); 
    -- ���� ���� 10~110�̸� 1�� �ڸ����� �ݿø��� �� ��ȯ�ϵ��� ����(�μ�id�� 10�����̹Ƿ�)
    dbms_output.put_line('������ ����: ' || v_department_id); --���� Ȯ�ο�
    
    SELECT 
         salary
    INTO 
        v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; --ù° ���� ���ؼ� ������ ����
    
    IF
        v_salary <= 5000
    THEN 
        dbms_output.put_line('�޿��� 5000�� �� ��');
    ELSIF
        v_salary <= 9000
    THEN
       dbms_output.put_line('�޿��� 5000 �ʰ� 9000 ����');
    ELSE
       dbms_output.put_line('�޿��� 9000 �ʰ���');
    END IF;    
END;



--CASE��
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1); 
    -- ���� ���� 10~110�̸� 1�� �ڸ����� �ݿø��� �� ��ȯ�ϵ��� ����(�μ�id�� 10�����̹Ƿ�)
    
    SELECT 
         salary
    INTO 
        v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; --ù° ���� ���ؼ� ������ ����
    
    CASE
        WHEN v_salary <= 5000 THEN 
            dbms_output.put_line('�޿��� 5000 ����');
        WHEN v_salary <= 9000 THEN
            dbms_output.put_line('�޿��� 5000 �ʰ� 9000 ����');
        ELSE
            dbms_output.put_line('�޿��� 9000 �ʰ�');
    END CASE;    
END;


-- ��ø IF��
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
    v_commission NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1); 
    -- ���� ���� 10~110�̸� 1�� �ڸ����� �ݿø��� �� ��ȯ�ϵ��� ����(�μ�id�� 10�����̹Ƿ�)
    
    SELECT 
         salary, commission_pct
    INTO 
        v_salary, v_commission
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; --ù° ���� ���ؼ� ������ ����
    
    IF v_commission >0 THEN
        IF v_commission > 0.15 THEN
            dbms_output.put_line('Ŀ�̼��� 15% �̻��Դϴ�');
            dbms_output.put_line('Ŀ�̼�: ' || v_salary * v_commission);
        END IF; --ENDIF�� �ݴ� ��ȣ��� �����ϸ� �ȴ�.
    ELSE
        dbms_output.put_line('Ŀ�̼��� �����Ф�');
    END IF;    
END;
