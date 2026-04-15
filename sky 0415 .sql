시퀀스 : SEQUENCE : 번호자동증가
-- 번호칼럼에 자동으로 번호를 증가

CREATE TABLE TABLE1(
    ID NUMBER(6) PRIMARY KEY,
    TITLE VARCHAR2(400),
    MEMO VARCHAR2(4000)
);

--INSERT INTO TABLE1 VALUES (1,'A','AAAA');
--INSERT INTO TABLE1 VALUES (2,'B','ㄹㅇㅋㅋ');
--INSERT INTO TABLE1 VALUES (3,'A','ㅇㅇ');

CREATE SEQUENCE SEQ_ID;
SEQ_ID.NEXTVAL
SEQ_ID.CURRVAL

SELECT SEQ_ID.NEXTVAL FROM DUAL; -- 시퀀스의 새로운 번호를 발급받는다
SELECT SEQ_ID.CURRVAL FROM DUAL; -- 시퀀스의 현재 번호
-- 중간에 데이터의 삭제가 되면 빈 번호공간이 생긴다.
-- 대체방안
INSERT INTO TABLE1 VALUES (SEQ_ID.NEXTVAL,'A','AAAA');
INSERT INTO TABLE1 VALUES (SEQ_ID.NEXTVAL,'B','ㄹㅇㅋㅋ');
INSERT INTO TABLE1 VALUES ((SELECT NVL (MAX(ID),0)+1 FROM TABLE1),'A','ㅇㅇ');



INSERT INTO TABLE1 VALUES (SEQ_ID.NEXTVAL,'A','AAAA');
INSERT INTO TABLE1 VALUES (SEQ_ID.NEXTVAL,'B','ㄹㅇㅋㅋ');
INSERT INTO TABLE1 VALUES (SEQ_ID.NEXTVAL,'A','ㅇㅇ');

COMMIT;

DELETE FROM TABLE1;
번호자동증가
MSSQ : IDENTITY, SEQUENCE
    CREATE TABLE TABLE(
      ID INT IDENTITY(1,1)  -- 1 부터 시작해서 1씩 증가
    )
MYSQL, MARIADB
    CREATE TABLE TABLE(
      ID INT AUTO_INCREMENT
    )
-----------------------------------------------------------------
PRIMARY KEY 값 수정가능/불가능
-- 외래키 설정이 안되어있어 수정가능
UPDATE TABLE1
SET ID = 1
WHERE ID = 4;

SELECT * FROM TABLE1;

-- 외래키 설정이 되어있어 수정가능
UPDATE TABLE1
SET = 7
WHERE = 1;
------------------------------------------------
인덱스 : INDEX (찾아보기표)
검색할때 해달칼럼에 인덱스를 사용하면 검색이 빨라진다
(단, INSER, DELETE, UPDATE를 사용할때 새로 인덱스를 고쳐야함)
추가, 수정같은 작업이 많을시 더 느려질수있다

WHERE 문에 사용하는 칼럼이나 JOIN 에 사용하는 칼럼에 설정
PRIMARY KEY, UNIQUE -> 자동으로 인덱스 생성된다.
검색을 자주하는 칼럼에 적용하는것

CREATE TABLE emp_big AS
SELECT
    e.employee_id + (lv * 100000) AS employee_id,
    e.first_name,
    e.last_name,
    e.email || lv AS email,
    e.phone_number,
    e.hire_date,
    e.job_id,
    e.salary,
    e.commission_pct,
    e.manager_id,
    e.department_id
FROM hr.employees e
CROSS JOIN (
    SELECT LEVEL AS lv
    FROM dual
    CONNECT BY LEVEL <= 10000
);

SELECT COUNT(*) FROM EMP_BIG;

-- 인덱스가 지정된 칼럼으로 조건을 걸어서 검색할때 작동
SET TIMING ON;

SELECT * 
FROM EMP_BIG
WHERE EMAIL = 'SKING5000';

-- 인덱스 생성
CREATE INDEX IDX_EMAIL
ON EMP_BIG (EMAIL);

CREATE INDEX IDX_NAME
ON EMP1(FIRST_NAME||''||LAST_NAME);
-------------------------------------------------------------
트리거 TRIGGER 방아쇠
회원정보가 추가되면 로그에 기록을 남기는 작업을 해야할때

상황
1) INSERT 회원정보
2) INSERT 로그기록
두번실행

자동화
1) INSERT 회원정보 -> TRIGGER -> INSERT 로그기록 명령을 호출,실행

단점 : 로직 추적이 쉽지 않다(트리거를 남발하지 말라)

BEFORE TRIGGER
AFTER  TRIGGER -> INSTEAD OF

CREATE OR REPLACE TRIGGER TRG_EMP
AFTER INSERT ON EMP_BIG
FOR EACH ROW
    BEGIN
         INSERT 로그
    END;

-----------------------------------------------------
트랜잭션(TRANSACTION)

송금
  1)내 계좌에서 금액-
  2)상대 계좌에서 금액+
  
  1) UPDATE MTABLE
     SET 내계좌 = 내계좌 - 100
     
  2) UPDATE MTABLE
     SET 내계좌 = 내계좌 + 100
 
  1번 종료후 문제발생시 2번이 실행되지 않으면 문제발생
  
  BEGIN TRAN
  UPDATE MTALBE
     SET 내계좌 = 내계좌 - 100
  UPDATE MTABLE
     SET 내계좌 = 내계좌 + 100
     COMMIT;
  END;
  
  
  1,2번을 한개의 작업단위로 묶어서 처리
  문제발생시 처음 돌아간다
  
 ------------------------------------------------------
  
 LOCK : DB잠김 - 상태
 
 INSERT INTO TABLE1 VALUES (7, 'C','ㅎㅎ');
 SELECT * FROM table1;
 
 
 
COMMIT;




