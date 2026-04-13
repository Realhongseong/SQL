-- 함수
-- 숫자함수
    -- 1.ABS()
    -- 2.CEIL(n), FLOOR(n) -> 정수형
-- CEIL : 천장(무조건 올림)
-- FLOOR : 바닥(버림)

    SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001)       FROM DUAL; --  11 11 12
      
    SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001)    FROM DUAL; --  10 10 11  
      
    SELECT FLOOR(-10.123), FLOOR(-10.541), FLOOR(-11.001) FROM DUAL; -- -11 -11 -12
      
    SELECT TRUNC(-10.123), TRUNC(-10.541), TRUNC(-11.001) FROM DUAL; -- -10 -10 -11
        -- 소수이하 버림
        
 -- 3. ROUND(n, i)와 TRUNC(n1, n2)
    SELECT ROUND(10.154, 1), ROUND(10.154, 2), ROUND(10.154, 3) FROM DUAL; -- 10.2	10.15	10.154
    
    SELECT ROUND(0, 3), ROUND(115.155, -1), ROUND(115.155, -2)  FROM DUAL; -- 0	120	100

    SELECT TRUNC(10.154, 1), TRUNC(10.154, 2), TRUNC(10.154, 3) FROM DUAL; -- 10.1	10.15	10.154
    
    SELECT TRUNC(0, 3), TRUNC(115.155, -1), TRUNC(115.155, -2)  FROM DUAL; -- 0	110	100

 -- 4. POWER(2,3) : 제곱승 - 2의 3승
 -- SQRT(n)    : 제곱근 - SQUARE ROOT

    SELECT POWER(3, 2), POWER(3, 3), POWER(3, 3.0001), POWER(4, 0.5) FROM DUAL;
    
    SELECT SQRT(2), SQRT(4) FROM DUAL;
    
    SELECT SQRT(2), SQRT(-4) FROM DUAL;
    
 -- 5. 나머지 MOD(n2, n1)와 REMAINDER(n2, n1) MOD -> n2 - n1 * FLOOR(n2/n1)
 -- REMAINDER -> n2-n1 * ROUND (n2/n1)

    SELECT MOD(19,4), MOD(19.123, 4.2)  FROM DUAL; -- 3	2.323
    
    SELECT REMAINDER(19,4), REMAINDER(19.123, 4.2) FROM DUAL; -- -1	-1.877
    
 -- 6. EXP(n), LN(n) 그리고 LOG(n2, n1)
    SELECT EXP(2), LN(2.713), LOG(10, 100) FROM DUAL;
    
 -- 7. SIN(), SOC(), TAN() : DEGREE(도) -> RADIAN (월주율/180*각도) -> 0.01745
 SIN 30도 -> 0.5
 SELECT SIN(30), SIN(30*0.01745) FROM DUAL;
 
 -- 문자함수
 1. INITCAP(char), LOWER(char), UPPER(char)
 SELECT LOWER ('NEVER SAU GOODBYE'), UPPER('never6say*good가bye') FROM UDAL;
 
 SELECT LOWER ('NEVER SAU GOODBYE'), UPPER('never6say*good가bye') FROM UDAL;
 
 2. CONCAT(char1,char2), SUBSTR(char, pos, len), SUBSTRB(char, pos, len)
 
 SELECT CONCAT('I Have', 'A Dream'), 'I Have'||'A Dream' FROM DUAL;
 SELECT SUBSTR('ABCDEFG', 1,4), SUBSTR('ABCDEFG', -3,4) FROM DUAL;
 -- ABCD EFG
 -- SUBSTR('ABCDEFG', -1, 4) : -1  뒤로부터 첫번째 에서 4개 앞으로 진행 : 'g'

3. LTRIM(char, set), RTRIM(char, set)
  SELECT LTRIM('ABCDEFGABC','ABC'),
         LTRIM('가나다라','가'),
         RTRIM('ABCDEFGABC','ABC'),
         RTRIM('가나다라','라'),
         TRIM('ABCDEF'),
         LENGTH(TRIM('ABCDEF')),
         TRIM(LEADING'FROM''ABCDEF'),
         LENGTH(LEADING'FROM''ABCDEF')
  FROM DUAL;
  -- DEFGABC 나다라 ABCDEFG 가나다

SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('가나다라마바사', 1,4) FROM DUAL;

-----------------------------------------------------------------
4. LPAD(expr1, n, expr2), RPAD(expr1, n, expr2)

CREATE TABLE ex4_1(
    phone_num VARCHAR2(30)
);

INSERT INTO ex4_1 VALUES ('111-1111');
INSERT INTO ex4_1 VALUES ('111-2222');
INSERT INTO ex4_1 VALUES ('111-3333');

SELECT * FROM ex4_1;

SELECT LPAD(phone_num, 12, '(02)')
FROM ex4_1;

SELECT RPAD(phone_num, 12, '(02)')
FROM ex4_1;

5. REPLACE(char, search_str, replace_str), TRANSLATE(expr, FROM_str, to_str)

SELECT REPLACE ('나는 너를 모르는데 너는 나를 알겠는가?', '나','너')
FROM DUAL;

SELECT LTRIM(' ABC DEF '),
           RTRIM(' ABC DEF '),
           REPLACE(' ABC DEF ', ' ', '')
FROM DUAL;  
      
SELECT employee_id, 
     TRANSLATE(EMP_NAME,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','thehillsarealivewiththesou') AS TRANS_NAME
FROM employees;

6. INSTR(str, substr, pos, occur), --indexOf()
   LENGTH(chr)  --글자수
   LENGTHB(chr)  --바이트수
   
   SELECT INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면','만약') AS INSTSR1,
          INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면','만약', 5) AS INSTSR2,
          INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면','만약', 5, 2) AS INSTSR3
   FROM DUAL; 

   SELECT LENGTH('대한민국'), -- 4자
          LENGTH('대한민국')  -- 12바이트
   FROM DUAL;

-- 날짜함수
1. SYSDATE, SYSTIMESTAMP
2. ADD_MONTHS(date, integer)
3. MONTHS_BETWEEN(date1, date2)
4. LAST_DAT(date)
5. ROUND(date, format), TRUNC(date, format)
   SELECT SUSDATE, ROUND(SYSDATEM 'month'), TRUNC(SYSDATE, 'month')
   FROM DUAL;
6. NEXT_DAY(date, char)

-- 변환함수
-- https://thebook.io/006696/0110/
1. TO_CHAR (숫자 혹은 날짜, format)
  
    SELECT TO_CHAR(123456789, '999,999,999'),
           TO_CHAR(1234567,   '99,999,999'),
           TO_CHAR(1234567,   '00,000,000'),
           TO_CHAR(123.45678, '99,990.000'),    -- 소수이하자동반올림 3자리로
           TO_CHAR(123456789, '$999,999,999'),
           TO_CHAR(123456789, 'L999,999,999')
      FROM DUAL;
      --  123,456,789	 $123,456,789	        ￦123,456,789
  
    SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    FROM DUAL;
    
2.  TO_NUMBER(expr, format)  
    
3.  TO_DATE(char, format), TO_TIMESTAMP(char, format) 
    
4. GREATEST(expr1, expr2, …), LEAST(expr1, expr2, …)
    SELECT GREATEST(1, 2, 3, 2),  -- 3
           LEAST(1, 2, 3, 2)      -- 1
      FROM DUAL;
    
5. DECODE (expr, search1, result1, search2, result2, …, default)  


-- 직원이름, 담당업무
  SELECT   FIRST_NAME || ' ' || LAST_NAME   직원이름, 
           JOB_ID                           담당업무           
   FROM    EMPLOYEES ;



-- 직원번호, 담당업무, 담당업무 히스토리
  SELECT   EMPLOYEE_ID, JOB_ID  
   FROM    EMPLOYEES
  UNION  
  SELECT   EMPLOYEE_ID, JOB_ID  
   FROM    JOB_HISTORY;
  
  SELECT  *
   FROM   (
        SELECT   EMPLOYEE_ID, JOB_ID  
         FROM    EMPLOYEES
       UNION  
       SELECT   EMPLOYEE_ID, JOB_ID  
         FROM    JOB_HISTORY
   )   -- INLINE VIEW : ORDER BY 사용할 수 있어요 : FORM 뒤에 사용
   ORDER  BY   EMPLOYEE_ID ASC; 



-- 사번, 업무시작일, 업무 종료일, 담당업무, 부서번호

SELECT 사번, 업무시작일, 업무종료일, 담당업무, 부서번호
FROM
(
SELECT  EMPLOYEE_ID         사번,
        TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')    업무시작일,
        '재직중'   업무종료일,
        JOB_ID  담당업무,
        DEPARTMENT_ID   부서번호
FROM    EMPLOYEES
UNION
SELECT  EMPLOYEE_ID     사번,
        TO_CHAR(START_DATE, 'YYYY-MM-DD')   업무시작일,
        TO_CHAR(END_DATE, 'YYYY-MM-DD')     업무종료일,
        JOB_ID  담당업무,
        DEPARTMENT_ID   부서번호
FROM JOB_HISTORY
)
ORDER BY 사번 ASC, 업무시작일 ASC
;

-- 사번, 직원명, 업무시작일, 업무종료일, 담당업무명, 부서이름

---------------------------------------------------------
VIEW : 뷰  SQL 문을 저장해 놓고 TABLE 처럼 호출해서 사용하는 객체
 1) INLINE VIEW SELECT 할때만 VIEW로 작동 : 임시존재
 
 SELECT *
 FROM (
       SELECT EMPLOYEE_ID 사번,
              FIRST_NAME||''||LAST_NAME 이름,
              EMAIL||'@GREEN.COM' 이메일,
              PHONE_NUMBER 전화
       FROM   EMPLOYEES
       ORDER BY 이름
 )     T
       WHERE T.사번 IN (100,101,102);

 SELECT *
 FROM (
       SELECT DEPARTMENT_ID   DEPT_ID,
              COUNT(SALARY)   COUNT_SAL,
              SUM(SALARY)     SUM_SAL,
              AVG(SALARY)     AVG_SAL
       FROM   EMPLOYEES
       GROUP BY DEPARTMENT_ID
       ORDER BY DEPARTMENT_ID
       ) T
       WHERE T.AVG_SAL >= 4000
       ;       
 
 -- 2) 일반적인 VIEW -> 영구저장된 객체
    
    VIEW 생성 - 영구보관
    
    CREATE OR REPLACE VIEW "HR"."VIEW_EMP"("사번","이름","이메일","전화")
    AS
       SELECT EMPLOYEE_ID 사번,
              FIRST_NAME||''||LAST_NAME 이름,
              EMAIL||'@GREEN.COM' 이메일,
              PHONE_NUMBER 전화
       FROM   EMPLOYEES
       ORDER BY 이름;

 SELECT *
 FROM VIEW_EMP
 WHERE 이름 LIKE '%King%'
 ;

---------------------------------------------------------
-- 2) WITH  가상의 테이블 생성
   WITH A ("사번","이름","이메일","전화")
   AS (
       SELECT EMPLOYEE_ID 사번,
              FIRST_NAME||''||LAST_NAME 이름,
              EMAIL||'@GREEN.COM' 이메일,
              PHONE_NUMBER 전화
       FROM   EMPLOYEES
       ORDER BY 이름
   )
   SELECT * FROM A;
---------------------------------------------------------
SELF JOIN 
-- 직원번호, 직속상사번호
SELECT EMPLOYEE_ID 직원번호, MANAGER_ID 상사번호
FROM   EMPLOYEES;

-- 직원이름, 직속상사이름
-- 상사정보 : E1, 부하정보 : E2 - 테이블 복사
SELECT E2.FIRST_NAME||''||E2.LAST_NAME 직원이름,
       E1.FIRST_NAME||''||E1.LAST_NAME 상사이름
FROM   EMPLOYEES E1, EMPLOYEES E2
WHERE E1.EMPLOYEE_ID = E2.MANAGER_ID
ORDER BY E1.EMPLOYEE_ID ASC;
-- 사장이 출력되지 않는다

SELECT E2.EMPLOYEE_ID 사번,
       E2.FIRST_NAME||''||E2.LAST_NAME 직원이름,
       E1.FIRST_NAME||''||E1.LAST_NAME 상사이름
FROM   EMPLOYEES E1 RIGHT JOIN EMPLOYEES E2
ON  E1.EMPLOYEE_ID = E2.MANAGER_ID
ORDER BY E2.EMPLOYEE_ID ASC;
-- 모든 직원정보 : 사장,보검,리나
---------------------------------------------------------
-- 계층형 쿼리 : HIRERACHY
직원번호, 직원이름, 레벨, 부서명
LEVEL : 예약어, 계층형 쿼리의 레벨을 구하는

SELECT E.EMPLOYEE_ID     직원번호, 
       E.FIRST_NAME      직원이름, 
       LEVEL, 
       D.DEPARTMENT_NAME 부서명
FROM   EMPOYEES    E
JOIN   DEPARTMENTS D 
  ON   E.DEPARTMENT_ID = D.DEPARTMENT_ID 
START WITH E. MANAGER_ID IS NULL
CONNECT BY PRIOR E.EMPLOYEE_ID = E.MANAGER_ID;


---------------------------------------------------------
/*
EQUI JOIN / 등가조인 : JOIN 조건이 = 인 것
NOT EQUI JOIN / 비등가조인 : JOIN 조건이 = 이 아닌것
직원등급
월급          등급
20000   초과 :  S
15001 ~ 20000 : A
10001 ~ 15000 : B
 5001 ~ 10000 : C
 3001 ~ 5000  : D
    0 ~ 3000  : E
*/
 직원번호,   직원명, 월급,  등급 
 SELECT EMPLOYEE_ID               직원번호,
        FIRST_NAME||''||LAST_NAME 직원명,
        SALARY                    월급,
        CASE
         WHENE SALARY > 20000 THEN 'S'
         WHENE SALARY BETWEEN 15001 AND 20000 THEN 'A'
         WHENE SALARY BETWEEN 10001 AND 15000 THEN 'B'
         WHENE SALARY BETWEEN  5001 AND 10000 THEN 'C'
         WHENE SALARY BETWEEN  3001 AND  5000 THEN 'D'
         WHENE SALARY BETWEEN     0 AND  3000 THEN 'E'
         ELSE                                      '등급없음'     
        END                       등급  
 FROM EMPLOYEES;
 

-- 등급테이블 생성
DROP TABLE SALGRADE;
CREATE TABLE SALGRADE
(
   GRADE VARCHAR2(1) PRIMARY KET
  ,LOSAL NUMBER(19)
  ,HISAL NUMBER(19)
);

INSERT INTO SALGRADE VALUES('S', 20001, 9999999999);
INSERT INTO SALGRADE VALUES('A', 15001, 20000);
INSERT INTO SALGRADE VALUES('B', 10001, 15000);
INSERT INTO SALGRADE VALUES('C',  5001, 10000);
INSERT INTO SALGRADE VALUES('D',  3001,  5000);
INSERT INTO SALGRADE VALUES('E',     0,  3000);
COMMIT;

20000   초과 :  S
15001 ~ 20000 : A
10001 ~ 15000 : B
 5001 ~ 10000 : C
 3001 ~ 5000  : D
    0 ~ 3000  : E

---------------------------------------------------------
-- 분석함수 WINDOW 함수
1. ROW_NUMBER()  : 줄번호(1,2,3,4,5...)
2. RANK()        : 석차  (1,2,2,4,5,5,7...)
3. DENSE_RANK()  : 석차  (1,2,2,3,4,5,5,6...)
4. NTILE()       : 그룹으로 분류
5. LISTAGG() : 

-- DESC NULLS FIRST : NULL 맨 위로 - 기본값
-- DESC NULLS LAST  : NULL 맨 밑으로

1. ROW_NUMBER()
전체
SELECT   EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM     EMPLOYEES
ORDER BY SALARY DESC NULLS LAST
;

자료를 10개만 출력
-- 1) OLD 문법 : ROWNUM = 의사(PSUEDO)칼럼
SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE ROWNUM BETWEEN 1 AND 10
ORDER BY SALARY DESC NULLS LAST;

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM(
    SELECT   EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
    FROM     EMPLOYEES
    ORDER BY SALARY DESC NULLS LAST
) T
;


-- 2) ANSI 문법 : ROW_NUMBER() 11G ^
    
    SELECT * 
    FROM
    (
    SELECT   ROW_NUMBER() OVER(ORDER BY SALARY DESC NULLS LAST) RN,
             EMPLOYEE_ID,
             FIRST_NAME,
             LAST_NAME,
             SALARY
    FROM     EMPLOYEES
) T
WHERE T.RN BETWEEN 11 AND 21
;

-- 3) ORACLE 12C 부터는 OFFSET

SELECT * 
FROM     EMPLOYEES
ORDER BY SALARY DESC NULLS LAST
OFFSET   11 ROWS FETCH NEXT 10 ROWS ONLY;
-- 11 부터 10개 : ROW_NUMBER 보다 속도가 빠르다.

---------------------------------------------------------

-- 2. RANK() : 석차(1,2,2,4,5,5,7...)
월급순으로 석차를 출력
사번, 이름, 월급, 석차

SELECT  EMPLOYEE_ID               사번, 
        FIRST_NAME||''||LAST_NAME 이름, 
        SALARY                    월급, 
        RANK() OVER(ORDER BY SALARY DESC NULLS LAST) 석차
FROM    EMPLOYEES;


-- 3. DENSE_RANK() : 석차(1,2,2,3,4,5,5,6...)
SELECT  EMPLOYEE_ID               사번, 
        FIRST_NAME||''||LAST_NAME 이름, 
        SALARY                    월급, 
        DENSE_RANK() OVER(ORDER BY SALARY DESC NULLS LAST) 석차
FROM    EMPLOYEES;

-- 월급순으로 석차를 출력(1~10등까지)
SELECT * FROM
(
SELECT  EMPLOYEE_ID               사번, 
        FIRST_NAME||''||LAST_NAME 이름, 
        SALARY                    월급, 
        RANK() OVER(ORDER BY SALARY DESC NULLS LAST) 석차
FROM    EMPLOYEES) T
WHERE   T.석차 BETWEEN 1 AND 10;

SELECT * FROM
(
SELECT  EMPLOYEE_ID               사번, 
        FIRST_NAME||''||LAST_NAME 이름, 
        SALARY                    월급, 
        DENSE_RANK() OVER(ORDER BY SALARY DESC NULLS LAST) 석차
FROM    EMPLOYEES) T
WHERE   T.석차 BETWEEN 1 AND 10;

---------------------------------------------------------
5. LISTAGG() : 여러줄을 한줄짜리 문자열로 변경

SELECT  DEPARTMENT_ID FROM    EMPLOYEES;

SELECT  DISTINCT DEPARTMENT_ID FROM    EMPLOYEES;

SELECT  LISTAGG(DISTINCT DEPARTMENT_ID) FROM    EMPLOYEES;

SELECT  LISTAGG(DISTINCT DEPARTMENT_ID, ',')
WITHIN  GROUP(ORDER BY DEPARTMENT_ID DESC)
FROM    EMPLOYEES;

SELECT  LISTAGG(DISTINCT DEPARTMENT_ID, ',')
FROM    EMPLOYEES;







