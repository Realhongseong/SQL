SELECT * FROM tab; -- 테이블 목록 조회
 
 /*
 SELECT  칼럼명1 별칭, 칼럼명2, 별칭2 . . .
 FROM    테이블명
 WHERE   조건
 ORDER BY 정렬할 칼럼1 ASC, 정렬할 칼럼2 DESC
 */
 
--직원의 이름을 성과 이름을 붙혀서 출력
 SELECT FIRST_NAME, LAST_NAME, FIRST_NAME||' '||LAST_NAME EMPNAME
 FROM EMPLOYEES
 -- ORDER BY FIRST_NAME
 ORDER BY 3     -- 3번째 칼럼을 기준으로
 ;
 
 
 
 -- 부서번호가 60인 직원정보
 -- 조건 : =, !=(<>, ^=)
 -- >,<,>=,<=
 -- NOT, AND, OR
 -- 
 SELECT EMPLOYEE_ID                     번호,
        FIRST_NAME ||' '|| LAST_NAME    이름,
        EMAIL                           메일,
        DEPARTMENT_ID                   부서번호
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60
 ORDER BY 이름 ASC
 ;
 
 -- 부서번호가 90인 직원정보
 SELECT EMPLOYEE_ID                     번호,
        FIRST_NAME ||' '|| LAST_NAME    이름,
        EMAIL                           메일,
        DEPARTMENT_ID                   부서번호
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
 ORDER BY 이름 ASC
 ;
 
  -- 부서번호가 60,90인 직원정보
 SELECT EMPLOYEE_ID                   번호,
        FIRST_NAME ||''|| LAST_NAME   이름,
        EMAIL                         메일,
        DEPARTMENT_ID                 부서번호 
 FROM   EMPLOYEES E
 WHERE  DEPARTMENT_ID = 60 or
        DEPARTMENT_ID = 90      -- OR : ~이거나 + 논리합
 ORDER BY 부서번호 ASC
 ;
 
 -- IN 명령어(OR 대체ㅇㅇ)
 SELECT EMPLOYEE_ID                   번호,
        FIRST_NAME ||''|| LAST_NAME   이름,
        EMAIL                         메일,
        DEPARTMENT_ID                 부서번호 
 FROM   EMPLOYEES E
 WHERE  DEPARTMENT_ID IN (90,60,50,80)
 ORDER BY 부서번호 ASC, 이름 ASC  -- 부서번호순. 부서번호가 같으면 이름 순
 ;
 
 -- 월급이 12000 이상인 직원의 번호, 이름, 이메일, 월급을 월급순으로 출력
 SELECT EMPLOYEE_ID                     번호,
        FIRST_NAME ||' '|| LAST_NAME    이름,
        EMAIL                           메일,
        SALARY                          월급
 FROM EMPLOYEES
 WHERE SALARY >= 12000
 ORDER BY SALARY DESC
 ;
 
 -- 월급이 10000~15000 인 직원의 사번, 이름, 월급, 부서번호 -1
  SELECT EMPLOYEE_ID                     번호,
         FIRST_NAME ||' '|| LAST_NAME    이름,
         SALARY                          월급,
         DEPARTMENT_ID                   부서번호
 FROM EMPLOYEES
 WHERE 10000<=SALARY
  AND  SALARY<=15000
 ORDER BY SALARY DESC
 ;
  
 -- 월급이 10000~15000 인 직원의 사번, 이름, 월급, 부서번호 -2
  SELECT EMPLOYEE_ID                     번호,
         FIRST_NAME ||' '|| LAST_NAME    이름,
         SALARY                          월급,
         DEPARTMENT_ID                   부서번호
 FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 15000
 ORDER BY SALARY DESC
 ;
 
 -- 직업 ID가 IT PROG 인 직원명단 -1
   SELECT EMPLOYEE_ID                     번호,
          FIRST_NAME ||' '|| LAST_NAME    이름,
          EMAIL                           메일,
          JOB_ID                          직업ID
 FROM EMPLOYEES
 WHERE JOB_ID = 'IT_PROG'
 ORDER BY 직업ID DESC
 ;
 
  -- 직업 ID가 IT PROG 인 직원명단 -2 / UPPER(),LOWER(), INITCAP() 함수
   SELECT EMPLOYEE_ID                     번호,
          FIRST_NAME ||' '|| LAST_NAME    이름,
          JOB_ID                          직업ID,
          DEPARTMENT_ID                   부서번호
 FROM EMPLOYEES
 WHERE LOWER(JOB_ID) = 'IT_PROG'
 ORDER BY JOB_ID DESC
 ;
 
 -- 직원이름이 GRANT 인 사람을 찾음
 SELECT FIRST_NAME ||' '|| LAST_NAME    이름
 FROM   EMPLOYEES
 WHERE  UPPER(FIRST_NAME) = 'GRANT' OR
        UPPER(LAST_NAME) = 'GRANT'
 ORDER BY FIRST_NAME ||' '|| LAST_NAME ASC
 ;
 
 -- 사번, 월급, 10% 인상한 월급
 SELECT EMPLOYEE_ID                    사번,
        FIRST_NAME ||' '|| LAST_NAME   이름,
        SALARY                         월급,
        SALARY * 1.1                   인상월급
 FROM EMPLOYEES
 ORDER BY SALARY * 1.1 DESC
 ;

 -- 50번 부서의 직원명단, 월급, 부서번호
 SELECT EMPLOYEE_ID                     번호,
        FIRST_NAME ||' '|| LAST_NAME    이름,
        SALARY                          월급,
        DEPARTMENT_ID                   부서번호
 FROM   EMPLOYEES
 WHERE  DEPARTMENT_ID = 50
 ORDER BY SALARY DESC
 ;
 
 -- 20,80,60,90번 부서의 직원 명단, 월급, 부서번호
 SELECT EMPLOYEE_ID                     번호,
        FIRST_NAME ||' '|| LAST_NAME    이름,
        SALARY                          월급,
        DEPARTMENT_ID                   부서번호
 FROM   EMPLOYEES
 WHERE  DEPARTMENT_ID IN (20,80,60,90)
 ORDER BY DEPARTMENT_ID ASC
 ;
 
 -- 중요데이터를 2개 입력
 -- 전체 자료수
 SELECT COUNT(*)
 FROM EMPLOYEES; --107 ROW의 COUNT
 
 SELECT SYSDATE
 FROM DUAL;     -- 오늘의 날짜 연월일시분초
 
 -- 신입사원 입사(박보검,카리나)
 INSERT INTO EMPLOYEES
 VALUES (207,'보검','박','BOKUM','1.515.555.8888',SYSDATE,'IT_PROG',NULL,NULL,NULL,NULL);
 
 INSERT INTO EMPLOYEES
 VALUES (208,'리나','카','RINA','1.515.555.9999',SYSDATE,'IT_PROG',NULL,NULL,NULL,NULL);
 
 SELECT * FROM EMPLOYEES;
 SELECT COUNT(*) FROM EMPLOYEES;
 
UPDATE EMPLOYEES
SET    EMAIL = 'KRAINA',
       PHONE_NUMBER = '010-1234-5678'
WHERE  EMPLOYEE_ID = 208;
 
 COMMIT;
 --ROLLBACK : SAVE POINT 전으로 돌아감ㅇㅇ
 
 
 
 -- 보너스 없는 직원 명단 (commission pct 가 없다)
 SELECT   EMPLOYEE_ID                     번호,
          FIRST_NAME ||' '|| LAST_NAME    이름,
          COMMISSION_PCT                  보너스
 FROM     EMPLOYEES
 WHERE    COMMISSION_PCT IS null
 -- WHERE    COMMISSION_PCT IS NOT null // 받는사람
 ORDER BY FIRST_NAME ||' '|| LAST_NAME; 
 
 -- 전화번호가 010 으로 시작하는
 -- 패턴매칭 : LIKE 사용필
 -- % : 0자 '이상'의 모든 숫자,글자
 -- _ : '1자' 의 모든 숫자,글자
 SELECT   EMPLOYEE_ID                     번호,
          FIRST_NAME ||' '|| LAST_NAME    이름,
          PHONE_NUMBER                    전화번호
 FROM     EMPLOYEES
 WHERE    PHONE_NUMBER LIKE '010%'  -- 010 으로 시작하는
 --WHERE    PHONE_NUMBER LIKE '010%'  -- STARTS WITH : ~로 시작하는
 --WHERE    PHONE_NUMBER LIKE '%555'  -- END WITH : 555를 포함하는
 --WHERE    PHONE_NUMBER LIKE '%555%'  -- CONTAINS : 555를 포함하는
 ;
 
 -- LAST_NAME 세번째, 네번째 글자가 LL 인것
 SELECT   EMPLOYEE_ID  번호,
          LAST_NAME    이름,
          FIRST_NAME   이름
 FROM     EMPLOYEES
 WHERE    LAST_NAME LIKE '__ll%'
 ;
 ------------------------------------
 SELECT   EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
 FROM EMPLOYEES;
 WHERE
 
 -- 날짜 26/04/07 : 표현법이 틀림 년/월/일
 -- 2026-04-07 : ANSI 표준
 -- 04/07/26  : 월/일/년 -> 미국식
 -- 07/04/26  : 일/월/년 -> 영국식
 
 ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
 
 SELECT SYSDATE FROM DUAL;
 SELECT 7/2  FROM DUAL;
 SELECT 0/2  FROM DUAL;
 SELECT 2/0  FROM DUAL;  -- ORA-01476: 제수가 0 입니다
 SELECT SYSTIMESTAMP FROM DUAL;
 
 SELECT SYSDATE -7,    -- 일주일 전 날짜
        SYSDATE,       -- 오늘 날짜
        SYSDATE +7      -- 일주일 후 날짜
  FROM DUAL;
  -- 날짜 + N , 날짜 - : 며칠 전,후
  -- 날짜1 - 날짜2 : 두 날짜사이의 차이를 날 수로 계산
 --  날짜1 + 날짜2 : 오류 - 의미없음
 
 -- 오늘부터 크리스마스까지 남은날짜
 SELECT TO_DATE('26/12/25') - SYSDATE
 FROM DUAL;
 
 -- 소수이하 3자리로 반올림 : ROUND(VAL, 3) 
 -- 소수이하 3자리로 절사   : TRUNC( VAL, 3)
 -- 15일 기준으로 반올림 날짜 : ROUND
 -- 해당 달의 첫번째 날짜 : TRUNC
 SELECT SYSDATE,
 ROUND(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'MONTH')
 FROM DUAL;
 
 SELECT NEXT_DAY(SYSDATE, '월요일')FROM DUAL;   -- 26/04/13 : 다음 월요일
 SELECT TRUNC(SYSDATE, 'MONTH')FROM DUAL;       -- 26/04/01 : 해당 월의 첫째날
 SELECT LAST_DAY(SYSDATE)FROM DUAL;             -- 26/04/30 : 해당 월의 마지막날
 
 
 -- 입사 년월이 17년 2월인 사원
 SELECT   EMPLOYEE_ID                    번호,
          FIRST_NAME ||' '|| LAST_NAME   이름,
          HIRE_DATE                      입사
FROM      EMPLOYEES
WHERE     HIRE_DATE
 BETWEEN  '2017-02-01'
 AND      LAST_DAY('2017-02-01')
ORDER BY  FIRST_NAME ||' '|| LAST_NAME
;

        
 -- 17/02/07에 입사한 사람
SELECT   EMPLOYEE_ID                    번호,
         FIRST_NAME ||' '|| LAST_NAME   이름,
         HIRE_DATE                      입사
FROM     EMPLOYEES
WHERE    HIRE_DATE = '17/02/07'
ORDER BY FIRST_NAME ||' '|| LAST_NAME
;

 -- 12/06/07에 입사한 사람
SELECT   EMPLOYEE_ID                    번호,
         FIRST_NAME ||' '|| LAST_NAME   이름,
         HIRE_DATE                      입사
FROM     EMPLOYEES
WHERE    HIRE_DATE = '12/06/07'
;

 -- 오늘 (26/04/07) 입사한 사람
SELECT   FIRST_NAME, LAST_NAME, HIRE_DATE
FROM     EMPLOYEES
WHERE    '2026-04-07 00:00:00' <= HIRE_DATE
 AND     HIRE_DATE <= '2026-04-07 23:59:59';
 
 -- TYPE 변환
 -- TO_DATE(문자) -> 날짜
 -- TO_NUMBER(문자) -> 숫자
 -- TO_CHAR(숫자, '포멧') -> 글자
 -- TO_CHAR(날짜, '포멧') -> 날짜 형태의 문자
 -- 포멧 : YYYY-MM-DD HH24:MI:SS DAY AM
 
  -- 17/02/07에 입사한 사람
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY-MM') = '2017-02';

-- 화요일 입사자를 출력
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, TO_CHAR(HIRE_DATE, 'DAY'), TO_CHAR(HIRE_DATE,'YYYY-MM-DD')
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'DY') = '화'
ORDER BY HIRE_DATE ASC;








