

DROP TABLE ADMIN;

DROP TABLE LIKE_TABLE;
DROP SEQUENCE LIKE_TABLE_SEQ;
DROP TABLE MEMBER_LIKE_TABLE;
DROP SEQUENCE MEMBER_LIKE_TABLE_SEQ;

DROP SEQUENCE ONEBOARD_SEQ;
DROP TABLE ONEBOARD;
DROP SEQUENCE REPLY_SEQ;
DROP TABLE REPLY;
DROP SEQUENCE FREEBOARD_SEQ;
DROP TABLE FREEBOARD;
DROP TABLE MEMBER;

-- 멤버
CREATE TABLE MEMBER(
    mID VARCHAR(30) PRIMARY KEY,
    mPW VARCHAR(30) NOT NULL,
    mNAME VARCHAR(30) UNIQUE NOT NULL,
    mPHOTO VARCHAR(100),
    mBIRTH DATE,
    mGENDER VARCHAR2(10) NOT NULL,
    mEMAIL VARCHAR2(30) UNIQUE NOT NULL,
    mMBTI VARCHAR2(10),
    mRDATE DATE DEFAULT SYSDATE,
    mLIKE NUMBER(5) DEFAULT 0,
    mWRITECOUNT NUMBER(5) DEFAULT 0
);

INSERT INTO MEMBER(mID, mPW, mNAME, mPHOTO, mBIRTH, mGENDER, mMBTI, mEMAIL)
    VALUES('moan1', '1234', '문희석', 'gico.jpg', '1995-12-05', 'm', 'INTJ', 'moan11@moan.com');
INSERT INTO MEMBER(mID, mPW, mNAME, mPHOTO, mBIRTH, mGENDER, mMBTI, mEMAIL)
    VALUES('aaa', '1234', '홍길동12', 'kang.jpg', '1995-12-05', 'm', 'ENTP', 'moan12@moan.com');
INSERT INTO MEMBER(mID, mPW, mNAME, mPHOTO, mBIRTH, mGENDER, mMBTI, mEMAIL)
    VALUES('bbb', '1234', '홍길동23', 'jo.jpg', '1995-12-05', 'm', 'ISFJ', 'moan23@moan.com');
INSERT INTO MEMBER(mID, mPW, mNAME, mPHOTO, mBIRTH, mGENDER, mMBTI, mEMAIL)
    VALUES('ccc', '1234', '홍길동33', 's.jpg', '1995-12-05', 'm', 'INFP', 'moan34@moan.com');
INSERT INTO MEMBER(mID, mPW, mNAME, mPHOTO, mBIRTH, mGENDER, mMBTI, mEMAIL)
    VALUES('ddd', '1234', '홍길동43', 'go.jpg', '1995-12-05', 'm', 'ENTJ', 'moan45@moan.com');
INSERT INTO MEMBER(mID, mPW, mNAME, mPHOTO, mBIRTH, mGENDER, mMBTI, mEMAIL)
    VALUES('eee', '1234', '홍길동53', 'lee.jpg', '1995-12-05', 'm', 'ENFP', 'moan56@moan.com');
INSERT INTO MEMBER(mID, mPW, mNAME, mPHOTO, mBIRTH, mGENDER, mMBTI, mEMAIL)
    VALUES('fff', '1234', '홍길동63', 'lee.jpg', '1995-12-05', 'm', 'ESFJ', 'moan67@moan.com');
    

SELECT * FROM MEMBER;


-- 자유게시판
CREATE TABLE FREEBOARD(
    bNO NUMBER(6) PRIMARY KEY,
    mID VARCHAR2(30) REFERENCES MEMBER(mID),
    bMBTI VARCHAR2(30),
    bTITLE VARCHAR2(100) NOT NULL,
    bCONTENT VARCHAR2(4000) NOT NULL,
    bFILENAME VARCHAR2(100),
    bRDATE DATE DEFAULT SYSDATE,
    bHIT NUMBER(6) DEFAULT 0 NOT NULL,
    bGROUP NUMBER(6) NOT NULL,
    bSTEP NUMBER(6) NOT NULL,
    bINDENT NUMBER(6) NOT NULL,
    bLIKE NUMBER(6) DEFAULT 0 NOT NULL,
    bIP VARCHAR2(30) NOT NULL,
    bDELETEMARK NUMBER(2) DEFAULT 0 NOT NULL
);

CREATE SEQUENCE FREEBOARD_SEQ
MAXVALUE 999999 NOCACHE NOCYCLE;

INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'aaa', 'INTP', 'title', 'content', 'filename',
                FREEBOARD_SEQ.CURRVAL, 0, 0, '123.123.123.123');
INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'bbb', 'ISFJ', 'title', 'content', 'filename',
                FREEBOARD_SEQ.CURRVAL, 0, 0, '125.123.123.123');
INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'ccc', 'ENFP', 'title', 'content', 'filename',
                FREEBOARD_SEQ.CURRVAL, 0, 0, '123.123.123.123');          
INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'ddd', 'INTJ', 'title', 'content', 'filename',
                FREEBOARD_SEQ.CURRVAL, 1, 1, '123.123.123.123');
INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'eee', 'ISFP', 'title', 'content', 'filename',
                FREEBOARD_SEQ.CURRVAL, 0, 0, '123.123.123.123');
INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'eee', 'ISFP', '그냥 긴 글을 제목으로 적었을 때 어떻게 나오는지 보기위한 더미데이터', 'content', 'filename',
                FREEBOARD_SEQ.CURRVAL, 0, 0, '123.123.123.123');       
INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'eee', 'ISFP', '그냥 긴 글을 제목으로 적었을 때 어떻게 나오는지 보기위한 더미데이터', 'content', 'filename',
                FREEBOARD_SEQ.CURRVAL, 0, 0, '123.123.123.123');                     

SELECT * FROM FREEBOARD;


-- 댓글 게시판
CREATE TABLE REPLY(
    rNO NUMBER(6) PRIMARY KEY,
    mID VARCHAR2(30) REFERENCES MEMBER(mID),
    bNO NUMBER(6) REFERENCES FREEBOARD(bNO),
    rCONTENT VARCHAR2(1000),
    rRDATE DATE DEFAULT SYSDATE,
    rIP VARCHAR2(30)
);

CREATE SEQUENCE REPLY_SEQ
    MAXVALUE 999999 NOCACHE NOCYCLE;
    
INSERT INTO REPLY(rNO, mID, bNO, rCONTENT, rIP)
    VALUES(REPLY_SEQ.NEXTVAL, 'aaa', 23, '첫 댓글', '123.123.123.111');
INSERT INTO REPLY(rNO, mID, bNO, rCONTENT, rIP)
    VALUES(REPLY_SEQ.NEXTVAL, 'bbb', 5, '첫 댓글', '123.123.123.111');
INSERT INTO REPLY(rNO, mID, bNO, rCONTENT, rIP)
    VALUES(REPLY_SEQ.NEXTVAL, 'ccc', 3, '첫 댓글', '123.123.123.111');
INSERT INTO REPLY(rNO, mID, bNO, rCONTENT, rIP)
    VALUES(REPLY_SEQ.NEXTVAL, 'ddd', 4, '첫 댓글', '123.123.123.111');
INSERT INTO REPLY(rNO, mID, bNO, rCONTENT, rIP)
    VALUES(REPLY_SEQ.NEXTVAL, 'aaa', 33, '첫 댓글', '123.123.123.111');
INSERT INTO REPLY(rNO, mID, bNO, rCONTENT, rIP)
    VALUES(REPLY_SEQ.NEXTVAL, 'aaa', 1, '첫 댓글', '123.123.123.111');    
    

-- 일대일 게시판
CREATE TABLE ONEBOARD(
    obNO NUMBER(6) PRIMARY KEY,
    mID VARCHAR2(30) REFERENCES MEMBER(mID),
    obTITLE VARCHAR2(100) NOT NULL,
    obCONTENT VARCHAR2(4000) NOT NULL,
    obRDATE DATE DEFAULT SYSDATE,
    obGROUP NUMBER(6) NOT NULL,
    obSTEP NUMBER(6) NOT NULL,
    obIP VARCHAR2(30),
    obDELETEMARK NUMBER(2) DEFAULT 0,
    obGETNAME VARCHAR2(30),
    obBORN NUMBER(2),
    obANSWER VARCHAR2(30) DEFAULT '답변대기'
);

CREATE SEQUENCE ONEBOARD_SEQ
    MAXVALUE 999999 NOCACHE NOCYCLE;

INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', '답변전문가1', 0);
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', '고수', 0);
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title3', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', 'INTJ심리고수', 0);
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title4', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', '답변가', 0);
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title5', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', '전문가', 0);
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title6', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', '심리상담', 0);
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title7', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', '다물어보세요', 0);
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title8', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', '굿굿', 0);
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title7', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', 'bbb', 0);
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'aaa', 'title8', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', 'ccc', 0);



-- 좋아요 게시판
CREATE TABLE LIKE_TABLE(
    LIKENO NUMBER(6) PRIMARY KEY,
    mID VARCHAR2(30) REFERENCES MEMBER(mID),
    bNO NUMBER(6) REFERENCES FREEBOARD(bNO),
    LIKECHECK NUMBER(2) DEFAULT 0
);

CREATE SEQUENCE LIKE_TABLE_SEQ
    MAXVALUE 999999 NOCACHE NOCYCLE;
    



-- 멤버 좋아요 게시판
CREATE TABLE MEMBER_LIKE_TABLE(
    LIKENO NUMBER(6) PRIMARY KEY,
    mID VARCHAR2(30) REFERENCES MEMBER(mID),
    mMYID VARCHAR2(30),
    LIKECHECK NUMBER(2) DEFAULT 0
);

CREATE SEQUENCE MEMBER_LIKE_TABLE_SEQ
    MAXVALUE 999999 NOCACHE NOCYCLE;




-- 관리자 게시판
CREATE TABLE ADMIN(
    aID VARCHAR2(30) PRIMARY KEY,
    aPW VARCHAR2(30) NOT NULL,
    aNAME VARCHAR2(30) NOT NULL
);

-- 관리자 추가
INSERT INTO ADMIN VALUES('java', '1234', '자바킴');

-- 관리자 로그인
SELECT * FROM ADMIN WHERE aID='java' AND aPW='1234';

-- 관리자 dto
SELECT * FROM ADMIN WHERE aID='java';


SELECT * FROM MEMBER;
SELECT * FROM FREEBOARD;
SELECT * FROM REPLY;
SELECT * FROM ONEBOARD;
SELECT * FROM LIKE_TABLE;

COMMIT;




