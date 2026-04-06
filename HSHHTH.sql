/*
HTH 계정 생성후 +버튼 클릭 -> 
이름 : HTHTeacher
사용자 이름 : hth
비밀번호 : 1234 
호스트 이름: 192.1685.0.246 접속할 ip 주소
포트 : 1521 - 방화벽I/B, O/B에 포트 1521 추가필요
SID : xe
*/

INSERT INTO MYCLASS
VALUES (15, '홍성현', '010-4642-8416', 'xowl179@gmail.com', SYSDATE);
COMMIT;

SELECT * FROM MYCLASS
ORDER BY 번호 ASC;