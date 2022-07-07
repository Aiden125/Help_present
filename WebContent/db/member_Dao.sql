-- MEMBER DAO 구성하기

-- 1. 로그인 중복체크
SELECT * FROM MEMBER WHERE mID='aaa';

-- 2. DTO 정보 mid로 가져오기
SELECT * FROM MEMBER WHERE mID='aaa';

-- 3. 로그인
SELECT * FROM MEMBER WHERE mID='aaa' AND mPW='1234';

-- 4. 회원가입
INSERT INTO MEMBER(mID, mPW, mNAME, mBIRTH, mGENDER, mEMAIL, mMBTI)
    VALUES('aaa21', '1234', '홍길동121', '1995-12-05', 'f','1213@12', 'INTJ');
                    
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
SELECT B.*, M.mNAME
    FROM FREEBOARD B, MEMBER M
    WHERE B.mID=M.mID
    ORDER BY bGROUP DESC, bSTEP;

SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM(SELECT B.*, M.mNAME, M.mMBTI
                FROM FREEBOARD B, MEMBER M
                WHERE B.mID=M.mID AND bDELETEMARK=0
                ORDER BY bGROUP DESC, bSTEP) A)
    WHERE RN BETWEEN 2 AND 3;

-- 2. 등록된 글 수
SELECT COUNT(*) FROM FREEBOARD WHERE bDELETEMARK=0;

-- 3. 원글쓰기
INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME,
                bGROUP, bSTEP, bINDENT, bIP)
        VALUES(FREEBOARD_SEQ.NEXTVAL, 'ddd', 'INTJ', 'title', 'content', 'filename',
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
    
-- 2. 댓글 수정
UPDATE REPLY SET rCONTENT='수정 댓글'
            WHERE rNO=3;
            
-- 3. 댓글 삭제
DELETE REPLY WHERE rNO=3;

-- 4. 댓글 리스트 보기
SELECT R.*, M.mNAME FROM REPLY R, FREEBOARD F, MEMBER M
        WHERE R.bNO=F.bNO AND F.bGROUP=33 AND F.bINDENT=0 AND M.mID=R.mID
        ORDER BY R.rRDATE;

SELECT * FROM REPLY;
SELECT * FROM MEMBER;
COMMIT;


