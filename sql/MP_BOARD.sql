CREATE TABLE MP_BOARD(
	BNO NUMBER NOT NULL,
	TITLE VARCHAR2(100) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	WRITER VARCHAR2(100) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	PRIMARY KEY(BNO)
)SEGMENT CREATION IMMEDIATE;

SELECT * FROM MP_BOARD;

CREATE SEQUENCE MP_BOARD_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO MP_BOARD(BNO,TITLE, CONTENT,WRITER)
	VALUES (MP_BOARD_SEQ.NEXTVAl, '제목입니다','내용입니다','coala');
	
SELECT * FROM MP_BOARD;
COMMIT;
