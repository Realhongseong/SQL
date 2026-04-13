--------------------------------------------------
DDL : DATA DEFINITION LANGUAGE
구조를 생성, 변경 ,제거

CREATE 
ALTER
DROP

계정생성
아이디 : SKY
비밀번호 : 1234

CMD
Microsoft Windows [Version 10.0.19045.6218]
(c) Microsoft Corporation. All rights reserved.

C:\Users\GGG>sqlplus /nolog

SQL*Plus: Release 21.0.0.0.0 - Production on 월 4월 13 14:06:05 2026
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

SQL> conn /as sysdba
연결되었습니다.

SQL> show user
USER은 "SYS"입니다
SQL> ALTER SESSION SET "_ORACLE_SCRIPT"=true;

세션이 변경되었습니다.

SQL> CREATE USER SKY IDENTIFIED BY 1234;

사용자가 생성되었습니다.


SQL> GRANT CONNECT, RESOURCE TO SKY;

권한이 부여되었습니다.

SQL> ALTER USER SKY DEFAULT TABLESPACE
  2  USERS QUOTA UNLIMITED ON USERS;

사용자가 변경되었습니다.

SQL> CONN SKY/1234
연결되었습니다.
SQL> SHOW USER
USER은 "SKY"입니다

--------------------------------------------------
새 계정으로 접속

SKY에 HR계정의 DATA를 가져온다
SQLPLUS에서 작업
1. HR로 로그인한다
win+r : cmd
-> sqlplus hr/1234

2. HR에서 다른계정인 SKY에게 SELECT 할수있는 권한을 부여한다
SQL> GRANT SELECT ON EMPLOYEES TO SKY; 

3. SKY로 로그인
SQL> CONN SKY/1234

4. SKY에서 HR계정의 EMPLOYEE를 조회
SQL> SELECT * FROM HR.EMPLOYEES; -- 조회성공

SQL> SELECT * FROM HR.DEPARTMENTS -- 조회실패
--------------------------------------------------
ORACLE의 TABLE 복사
HR의 EMPLOYEES TABLE을 복사해서 SKY로 가져온다

[1] 테이블 생성
1. 테이블 복사
대상 : 테이블 구조, 데이터 복사(제약 조건의 일부만 복사(NOT NULL)) -- 10

1) 구조, 데이터 다 복사, 제약조건은 일부만 수용
CREATE TABLE EMP1
AS
 SELECT * FROM HR.EMPLOYEES;

2) 구조, 데이터 다복사, 50번 80번 부서만 복사
CREATE TABLE EMP2
AS
 SELECT * FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID IN (50,80);


3) DATA 빼고 구조만 복사(
CREATE TABLE EMP3
  AS SELECT * FROM HR.EMPLOYEES
     WHERE 1 = 0;


4) 구조만 복사된 TABLE 에 DATE만 추가

CREATE TABLE EMP4
  AS 
   SELECT * FROM HR.EMPLOYEES
     WHERE 1 = 0;

-- DATA만 추가
INSERT INTO EMP4
SELECT * FROM HR.EMPLOYEES;
COMMIT;

5) 일부 칼럼만 복사해서 새로운 테이블 생성
CREATE TABLE EMP5
  AS 
   SELECT EMPLOYEE_ID EMPID,
          FIRST_NAME||''||LAST_NAME  ENAME,
          SALARY                     SAL,
          SALARY * COMMISSION_PCT    BONUS,
          MANAGER_ID                 MGR,
          DEPARTMENT_ID              DEPTID
   FROM HR.EMPLOYEES;
     








