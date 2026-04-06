/*
HSH/1234 계정생성후 로그인 > 작업
데이터 저장공간 만들기 : TABLE 생성
잘못 만들어진 경우 : DROP TABLE MYCLASS; 실행후 재 생성
우리 정보 : MyClass
번호  숫자(5)  필수입력
이름  문자(50) 필수입력
전화  문자(13)
메일  문자(70) 
가입일 날짜
*/

CREATE TABLE MYCLASS ( 
번호  NUMBER(5)    NOT NULL,
이름  VARCHAR2(50) NOT NULL,
전화  VARCHAR2(13),
메일  VARCHAR2(70),
가입일 DATE
);