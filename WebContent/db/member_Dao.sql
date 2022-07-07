-- MEMBER DAO 구성하기

-- 0. 닉네임 조회
SELECT * FROM  MEMBER WHERE mNAME='홍길동';

-- 0. 이메일 조회
SELECT * FROM  MEMBER WHERE memail='123@123.com';

-- 1. 로그인 중복체크
SELECT * FROM MEMBER WHERE mID='aaa';

-- 2. DTO 정보 mid로 가져오기
SELECT * FROM MEMBER WHERE mID='aaa';

-- 3. 로그인
SELECT * FROM MEMBER WHERE mID='aaa' AND mPW='1234';

-- 4. 회원가입
INSERT INTO MEMBER(mID, mPW, mNAME, mPHOTO, mBIRTH, mGENDER, mEMAIL, mMBTI)
    VALUES('aaa2121231', '1234', '1홍길동1213', 'kim.jpg', '1995-12-05', 'f','12113@11232', 'INTJ');
                    
-- 5. 리스트 조회
SELECT *
    FROM MEMBER
    ORDER BY mLIKE DESC;

SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM(SELECT *
                FROM MEMBER
                ORDER BY mLIKE DESC) A)
    WHERE RN BETWEEN 2 AND 5;
    
    
-- 6. 회원정보수정
UPDATE MEMBER SET mPW='1234',
                  mNAME='111',
                  mPHOTO='gang.png',
                  mBIRTH='1995-12-05',
                  mGENDER='f',
                  mEMAIL='123@1222',
                  mMBTI='ISFP'
        WHERE mID='aaa';


-- 7. 등록된 회원 수
SELECT COUNT(*) TOTCNT FROM MEMBER;

-- 8. 좋아요 올리기
UPDATE MEMBER SET mLIKE = mLIKE+1 WHERE mID='fff';

-- 9. 글쓴 갯수 올리기
UPDATE MEMBER SET mWRITECOUNT = mWRITECOUNT+1 WHERE mID='eee';

-- 11. 멤버 검색(리스트 조회와 통합)
SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM(SELECT *
                FROM MEMBER
                ORDER BY mLIKE DESC) A)
    WHERE mNAME LIKE '%'||'홍'||'%' AND RN BETWEEN 1 AND 5;

-- 12. 회원 상세보기(조회수 올리기 포함한)
SELECT * FROM MEMBER WHERE mID='aaa';




SELECT * FROM MEMBER;
SELECT * FROM FREEBOARD;
COMMIT;




-- FREEBOARD DAO 구성하기



-- 1. 글목록
SELECT B.*, M.mNAME, (SELECT COUNT(*) FROM REPLY WHERE bNO=B.bNO) REPLYCOUNT
    FROM FREEBOARD B, MEMBER M
    WHERE B.mID=M.mID AND bDELETEMARK=0
    ORDER BY bGROUP DESC, bSTEP;

SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM(SELECT B.*, M.mNAME, (SELECT COUNT(*) FROM REPLY WHERE bNO=B.bNO) REPLYCOUNT
    FROM FREEBOARD B, MEMBER M
    WHERE B.mID=M.mID AND bDELETEMARK=0
    AND (bMBTI LIKE '%'||UPPER('intj')||'%' OR b.BTITLE LIKE '%'||UPPER('intj')||'%'
    OR bCONTENT LIKE '%'||UPPER('intj')||'%' OR M.mNAME LIKE '%'||UPPER('intj')||'%')
    ORDER BY bGROUP DESC, bSTEP) A)
    WHERE RN BETWEEN 1 AND 1000;

-- 2. 등록된 글 수
SELECT COUNT(*) FROM FREEBOARD;

-- 2-2. 검색된 글 수
SELECT COUNT(*)
    FROM FREEBOARD B, MEMBER M
    WHERE B.mID=M.mID AND bDELETEMARK=0
        AND (bMBTI LIKE '%'||UPPER('intj')||'%' OR b.BTITLE LIKE '%'||UPPER('intj')||'%'
        OR bCONTENT LIKE '%'||UPPER('intj')||'%' OR M.mNAME LIKE '%'||UPPER('intj')||'%');

-- 3. 원글쓰기
INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'ddd', UPPER('intj'), 'title', 'content', 'filename',
                FREEBOARD_SEQ.CURRVAL, 0, 0, '123.123.123.123');

-- 4. 답변글 쓰기전 스텝
UPDATE FREEBOARD SET bSTEP = bSTEP+1 WHERE bGROUP=7 AND bSTEP>0;

-- 5. 답변글 쓰기
INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'aaa', '답변3',
            '그룹 7번 글의 답변', 'content', 'filename', 7, 2, 2, '123.123.123.123');

SELECT * FROM FREEBOARD;
SELECT * FROM MEMBER;

-- 6-1. 원글 상세보기
SELECT *  FROM FREEBOARD WHERE bNO=1;

SELECT B.*, M.mMBTI, M.mNAME
        FROM FREEBOARD B, MEMBER M
        WHERE B.mID=M.mID AND bDELETEMARK=0 AND bGROUP=23 AND bINDENT=0;

-- 6-2. 답변들 상세보기
SELECT B.*, M.mMBTI, M.mNAME
        FROM FREEBOARD B, MEMBER M
        WHERE B.mID=M.mID AND bDELETEMARK=0 AND bGROUP=33 AND bINDENT!=0
        ORDER BY bSTEP, bRDATE;
        
-- 7. 조회수 올리기
UPDATE FREEBOARD SET bHIT = bHIT+1 WHERE bNO=1;

-- 8. 좋아요 올리기
UPDATE FREEBOARD SET bLIKE = bLIKE+1 WHERE bNO=1;

-- 9. 글 수정하기
UPDATE FREEBOARD SET bMBTI='ENTP',
                    bTITLE='수정 제목',
                    bCONTENT='수정 본문',
                    bFILENAME=NULL,
                    bIP='123.123.123.111'
            WHERE bNO=2;

-- 10. 글 삭제하기
UPDATE FREEBOARD SET bDELETEMARK = 1 WHERE bNO=5;

SELECT * FROM FREEBOARD;


-- 11. 답글 갯수표현하기
SELECT COUNT(*)-1 FROM FREEBOARD WHERE bGROUP=3;


COMMIT;




-- 댓글 게시판

-- 1. 댓글 달기
INSERT INTO REPLY(rNO, mID, bNO, rCONTENT, rIP)
    VALUES(REPLY_SEQ.NEXTVAL, 'eee', 23, '첫 댓글', '123.123.123.111');
            
-- 2. 댓글 삭제
DELETE REPLY WHERE rNO=3;

-- 3. 댓글 리스트 보기
SELECT R.*, M.mNAME FROM REPLY R, FREEBOARD F, MEMBER M
        WHERE R.bNO=F.bNO AND F.bGROUP=33 AND F.bINDENT=0 AND M.mID=R.mID
        ORDER BY R.rRDATE;

SELECT * FROM REPLY;
SELECT * FROM MEMBER;
COMMIT;






-- ONEBOARD DAO 구성하기

-- 1-1. 글목록(내가 질문한 일대일 질문 리스트)
SELECT O.*, M.mNAME
    FROM ONEBOARD O, MEMBER M
    WHERE O.mID=M.mID AND obGETNAME='bbb' OR O.mID='bbb'
    ORDER BY obGROUP DESC, obSTEP;

-- 내닉네임 혹은 아이디로 조회 / 상대방 닉네임 보이게
-- mid(내 아이디) mname(내 닉네임) / obgetname(상대방 닉네임)
-- aaa가 질문한 리스트 보여주는 중
SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM(SELECT O.*, M.mNAME
                FROM ONEBOARD O, MEMBER M
                WHERE O.mID=M.mID AND O.mID='aaa' AND obBORN=0 AND obDELETEMARK=0
                ORDER BY obGROUP DESC, obSTEP) A)
    WHERE RN BETWEEN 1 AND 10;
    
-- 1-2. 내가 받은 일대일 질문 리스트

-- bbb가 받은 리스트 보여주는 중
SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM(SELECT O.*, M.mNAME
                FROM ONEBOARD O, MEMBER M
                WHERE O.mID=M.mID AND obGETNAME='bbb' AND obBORN=0 AND obDELETEMARK=0
                ORDER BY obGROUP DESC, obSTEP) A)
    WHERE RN BETWEEN 1 AND 3;


SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM(SELECT O.*, M.mNAME
                FROM ONEBOARD O, MEMBER M
                WHERE O.mID=M.mID AND obGETNAME=(SELECT mNAME FROM MEMBER WHERE mID='moan')
                AND obBORN=0 AND obDELETEMARK=0
                ORDER BY obGROUP DESC, obSTEP) A)
    WHERE RN BETWEEN 1 AND 3;
    
    
SELECT * FROM ONEBOARD;
SELECT * FROM MEMBER;

-- 2-1. 내가 질문한 글 수

SELECT COUNT(*)
    FROM ONEBOARD O, MEMBER M
    WHERE O.mID=M.mID AND O.mID='aaa' AND obBORN=0 AND obDELETEMARK=0
    ORDER BY obGROUP DESC, obSTEP;


-- 2-2. 내가 받은 글 수
SELECT COUNT(*)
    FROM ONEBOARD O, MEMBER M
    WHERE O.mID=M.mID AND obGETNAME=(SELECT mNAME FROM MEMBER WHERE mID='moan')
    AND obBORN=0 AND obDELETEMARK=0
    ORDER BY obGROUP DESC, obSTEP;


-- 3. 원 질문 쓰기
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'bbb', 'title', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', 'ccc', 0);

INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'bbb', 'title', 'content', ONEBOARD_SEQ.CURRVAL, 0, '123.123.123.1', '문희석', 0);
    
-- 4. 답변글 쓰기전 스텝
UPDATE ONEBOARD SET obSTEP = obSTEP+1 WHERE obGROUP=2 AND obSTEP>0;

-- 5-1 답변글 쓰면서 상태 바꿔주기
UPDATE ONEBOARD SET obANSWER = '답변완료' WHERE obGROUP=1;

-- 5-2. 답변글 쓰기
INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN)
    VALUES(ONEBOARD_SEQ.NEXTVAL, 'bbb', '답변1', '답변내용', 3, 0, '123.123.123.1', '홍길동', 1);
    
SELECT * FROM ONEBOARD;
SELECT * FROM MEMBER;

-- 6-1. 원글 상세보기
SELECT *  FROM ONEBOARD WHERE obNO=1;

SELECT O.*, M.mNAME
        FROM ONEBOARD O, MEMBER M
        WHERE O.mID=M.mID AND obDELETEMARK=0 AND obGROUP=23 AND obBORN=0;

-- 6-2. 답변들 상세보기
SELECT O.*, M.mNAME
        FROM ONEBOARD O, MEMBER M
        WHERE O.mID=M.mID AND obDELETEMARK=0 AND obGROUP=49 AND obBORN!=0
        ORDER BY obRDATE;

-- 9. 글 수정하기
UPDATE ONEBOARD SET obTITLE='수정 제목',
                     obCONTENT='수정 본문',
                     obIP='123.123.123.111'
            WHERE obNO=2;

-- 10. 글 삭제하기
UPDATE ONEBOARD SET obDELETEMARK = 1 WHERE obNO=5;

SELECT * FROM FREEBOARD;

SELECT * FROM MEMBER;
COMMIT;



-- 회원 추천 테이블 DAO

-- 멤버 좋아요 누르기
INSERT INTO MEMBER_LIKE_TABLE
    VALUES(MEMBER_LIKE_TABLE_SEQ.NEXTVAL, 'aaa', 'bbb', 1);

-- 멤버 좋아요 제거하기
DELETE MEMBER_LIKE_TABLE
    WHERE mID='aaa' AND mMYID='bbb' AND LIKECHECK=1;

-- 멤버 눌렀는지 확인하기
SELECT LIKECHECK
    FROM MEMBER_LIKE_TABLE
    WHERE mID='aaa' AND mMYID='bbb';


-- 게시판 좋아요 테이블 DAO

-- 게시판 좋아요 누르기
INSERT INTO LIKE_TABLE VALUES(LIKE_TABLE_SEQ.NEXTVAL, 'aaa', 3, 1);

-- 게시판 좋아요 제거하기
DELETE LIKE_TABLE WHERE bNO=8 AND mID='aaa' AND LIKECHECK=1;

-- 게시판 눌렀는지 확인하기
SELECT LIKECHECK FROM LIKE_TABLE WHERE bNO=214 AND mID='aaa';

SELECT * FROM LIKE_TABLE WHERE bNO=214;


