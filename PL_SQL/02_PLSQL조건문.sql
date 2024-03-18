--IF문
DECLARE
    v_salary NUMBER := 0; --SQL에선 대입연산자를 ':=' 이렇게 쓴다.
    v_department_id NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1); 
    -- 난수 범위 10~110이며 1의 자리에서 반올림한 수 반환하도록 설정(부서id는 10단위이므로)
    dbms_output.put_line('생성된 난수: ' || v_department_id); --난수 확인용
    
    SELECT 
         salary
    INTO 
        v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; --첫째 값만 구해서 변수에 저장
    
    IF
        v_salary <= 5000
    THEN 
        dbms_output.put_line('급여가 5000이 안 됨');
    ELSIF
        v_salary <= 9000
    THEN
       dbms_output.put_line('급여가 5000 초과 9000 이하');
    ELSE
       dbms_output.put_line('급여가 9000 초과임');
    END IF;    
END;



--CASE문
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1); 
    -- 난수 범위 10~110이며 1의 자리에서 반올림한 수 반환하도록 설정(부서id는 10단위이므로)
    
    SELECT 
         salary
    INTO 
        v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; --첫째 값만 구해서 변수에 저장
    
    CASE
        WHEN v_salary <= 5000 THEN 
            dbms_output.put_line('급여가 5000 이하');
        WHEN v_salary <= 9000 THEN
            dbms_output.put_line('급여가 5000 초과 9000 이하');
        ELSE
            dbms_output.put_line('급여가 9000 초과');
    END CASE;    
END;


-- 중첩 IF문
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
    v_commission NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1); 
    -- 난수 범위 10~110이며 1의 자리에서 반올림한 수 반환하도록 설정(부서id는 10단위이므로)
    
    SELECT 
         salary, commission_pct
    INTO 
        v_salary, v_commission
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; --첫째 값만 구해서 변수에 저장
    
    IF v_commission >0 THEN
        IF v_commission > 0.15 THEN
            dbms_output.put_line('커미션이 15% 이상입니다');
            dbms_output.put_line('커미션: ' || v_salary * v_commission);
        END IF; --ENDIF가 닫는 괄호라고 생각하면 된다.
    ELSE
        dbms_output.put_line('커미션이 없어요ㅠㅠ');
    END IF;    
END;
