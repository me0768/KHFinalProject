﻿PROMPT FITNESSGROUND 자료입력시작

SET FEEDBACK ON;
SET DEFINE ON;

-- 유저 테이블
DROP TABLE TB_USER CASCADE CONSTRAINTS;
PROMPT DROPPING TB_USER TABLE..

-- 헬스장 테이블
DROP TABLE TB_GYM CASCADE CONSTRAINTS;
PROMPT DROPPING TB_GYM TABLE..

-- 헬스장 일정 테이블
DROP TABLE TB_GYM_SCHEDULE CASCADE CONSTRAINTS;
PROMPT DROPPING TB_GYM_SCHEDULE TABLE..

-- 헬스장 후기 테이블
DROP TABLE TB_GYM_COMMENT CASCADE CONSTRAINTS;
PROMPT DROPPING TB_GYM_COMMENT TABLE..

-- 운동법 동영상 테이블
DROP TABLE TB_VIDEO_BOARD CASCADE CONSTRAINTS;
PROMPT DROPPING TB_VIDEO_BOARD TABLE..

-- 운동법 동영상 댓글 테이블
DROP TABLE TB_VB_COMMENT CASCADE CONSTRAINTS;
PROMPT DROPPING TB_VB_COMMENT TABLE..

-- 커뮤니티 게시판(운동하자)
DROP TABLE TB_MEETING_BOARD CASCADE CONSTRAINTS;
PROMPT DROPPING TB_MEETING_BOARD TABLE..

-- 커뮤니티 게시판 댓글(운동하자)
DROP TABLE TB_MB_COMMENT CASCADE CONSTRAINTS;
PROMPT DROPPING TB_MB_COMMENT TABLE..

-- 커뮤니티 게시판(후기, QNA)
DROP TABLE TB_COM_BOARD CASCADE CONSTRAINTS;
PROMPT DROPPING TB_COM_BOARD TABLE..

-- 커뮤니티 게시판 댓글(후기, QNA)
DROP TABLE TB_CB_COMMENT CASCADE CONSTRAINTS;
PROMPT DROPPING TB_CB_COMMENT TABLE..

-- 마이페이지 스케줄러 테이블
DROP TABLE TB_MYPAGE_SCHEDULE CASCADE CONSTRAINTS;
PROMPT DROPPING TB_MYPAGE_SCHEDULE TABLE..

-- 문의하기 테이블
DROP TABLE TB_QNA CASCADE CONSTRAINTS;
PROMPT DROPPING TB_QNA TABLE..

-- 좋아요 테이블
DROP TABLE TB_LIKE CASCADE CONSTRAINTS;
PROMPT DROPPING TB_LIKE TABLE..




-- 유저 테이블 생성
PROMPT CREATING USER TABLE..
CREATE TABLE TB_USER(
  USER_NO NUMBER CONSTRAINT PK_USER PRIMARY KEY,
  EMAIL VARCHAR2(30) NOT NULL,
  PWD VARCHAR2(30) NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  NICKNAME VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(20) NOT NULL,
  USER_LEVEL NUMBER DEFAULT 0,
  DELETE_DATE DATE DEFAULT NULL,
  TMPPWD_TF NUMBER DEFAULT 0
);
COMMENT ON COLUMN TB_USER.USER_NO IS '유저번호';
COMMENT ON COLUMN TB_USER.EMAIL IS '이메일';
COMMENT ON COLUMN TB_USER.PWD IS '비밀번호';
COMMENT ON COLUMN TB_USER.NAME IS '이름';
COMMENT ON COLUMN TB_USER.NICKNAME IS '닉네임';
COMMENT ON COLUMN TB_USER.PHONE IS '전화번호';
COMMENT ON COLUMN TB_USER.USER_LEVEL IS '권한 0=일반/1=사업자/2=관리자';
COMMENT ON COLUMN TB_USER.DELETE_DATE IS '삭제예정일';
COMMENT ON COLUMN TB_USER.TMPPWD_TF IS '임시비밀번호 여부';


-- 헬스장 테이블 생성
PROMPT CREATING GYM TABLE..
CREATE TABLE TB_GYM(
  GYM_NO NUMBER CONSTRAINT PK_GYM PRIMARY KEY,
  GYM_NAME VARCHAR2(30) NOT NULL,
  ORIGINAL_IMAGE VARCHAR2(4000),
  RENAME_IMAGE VARCHAR2(4000),
  OP_TIME VARCHAR2(100) NOT NULL,
  TEL NUMBER NOT NULL,
  PHONE NUMBER NOT NULL,
  PRICE VARCHAR2(500),
  CATEGORY VARCHAR2(100) NOT NULL,
  DESCRIPTION VARCHAR(4000),
  LOCATION VARCHAR2(100) NOT NULL,
  USER_NO NUMBER NOT NULL,
  DELETE_DATE DATE DEFAULT NULL
);
COMMENT ON COLUMN TB_GYM.GYM_NO IS '헬스장번호';
COMMENT ON COLUMN TB_GYM.GYM_NAME IS '헬스장이름';
COMMENT ON COLUMN TB_GYM.ORIGINAL_IMAGE IS '원래 이미지 이름';
COMMENT ON COLUMN TB_GYM.RENAME_IMAGE IS '바뀐 이미지 이름';
COMMENT ON COLUMN TB_GYM.OP_TIME IS '헬스장 운영시간';
COMMENT ON COLUMN TB_GYM.TEL IS '헬스장번호';
COMMENT ON COLUMN TB_GYM.PHONE IS '핸드폰번호';
COMMENT ON COLUMN TB_GYM.PRICE IS '월회비';
COMMENT ON COLUMN TB_GYM.CATEGORY IS '헬스 카테고리';
COMMENT ON COLUMN TB_GYM.DESCRIPTION IS '헬스장 소개';
COMMENT ON COLUMN TB_GYM.LOCATION IS '헬스장 위치';
COMMENT ON COLUMN TB_GYM.USER_NO IS '사업자 번호';
COMMENT ON COLUMN TB_GYM.DELETE_DATE IS '삭제 예정일';

ALTER TABLE TB_GYM
  ADD CONSTRAINT FK1_GYM FOREIGN KEY(USER_NO) REFERENCES TB_USER;
  

-- 헬스장 일정 테이블 생성
PROMPT CREATING GYM_SCHEDULE TABLE..
CREATE TABLE TB_GYM_SCHEDULE(
  GS_NO NUMBER CONSTRAINT PK_GS PRIMARY KEY,
  GYM_NO NUMBER NOT NULL,
  DAY_TIME DATE NOT NULL,
  TITLE VARCHAR2(20) NOT NULL
);
COMMENT ON COLUMN TB_GYM_SCHEDULE.GS_NO IS '헬스장 일정 번호';
COMMENT ON COLUMN TB_GYM_SCHEDULE.GYM_NO IS '헬스장 번호';
COMMENT ON COLUMN TB_GYM_SCHEDULE.DAY_TIME IS '헬스장 일정';
COMMENT ON COLUMN TB_GYM_SCHEDULE.TITLE IS '헬스장 일정 이름';

ALTER TABLE TB_GYM_SCHEDULE
  ADD CONSTRAINT FK1_GS FOREIGN KEY(GYM_NO) REFERENCES TB_GYM;
  
  
-- 헬스장 후기 테이블 생성
PROMPT CREATING GYM_COMMENT TABLE..
CREATE TABLE TB_GYM_COMMENT(
  GC_NO NUMBER CONSTRAINT PK_GC PRIMARY KEY,
  GYM_NO NUMBER NOT NULL,
  CONTENT VARCHAR2(1000) NOT NULL,
  RATING NUMBER NOT NULL,
  ORIGINAL_IMAGE VARCHAR2(4000),
  RENAME_IMAGE VARCHAR2(4000)
);
COMMENT ON COLUMN TB_GYM_COMMENT.GC_NO IS '헬스장 후기 번호';
COMMENT ON COLUMN TB_GYM_COMMENT.GYM_NO IS '헬스장 번호';
COMMENT ON COLUMN TB_GYM_COMMENT.CONTENT IS '헬스장 후기 내용';
COMMENT ON COLUMN TB_GYM_COMMENT.RATING IS '헬스장 후기 별점';
COMMENT ON COLUMN TB_GYM_COMMENT.ORIGINAL_IMAGE IS '원래 이미지 이름';
COMMENT ON COLUMN TB_GYM_COMMENT.RENAME_IMAGE IS '바뀐 이미지 이름';

ALTER TABLE TB_GYM_COMMENT
  ADD CONSTRAINT FK1_GC FOREIGN KEY(GYM_NO) REFERENCES TB_GYM;
  
  
-- 운동법 동영상 테이블 생성
PROMPT CREATING VIDEO_BOARD TABLE...
CREATE TABLE TB_VIDEO_BOARD(
  V_NO NUMBER CONSTRAINT PK_VB PRIMARY KEY,
  TITLE VARCHAR2(100) NOT NULL,
  CONTENT VARCHAR2(4000) NOT NULL,
  CATEGORY1 VARCHAR2(100) NOT NULL,
  CATEGORY2 VARCHAR2(100) NOT NULL,
  URL VARCHAR2(4000) NOT NULL,
  READCOUNT NUMBER DEFAULT 0
);
COMMENT ON COLUMN TB_VIDEO_BOARD.V_NO IS '운동법 번호';
COMMENT ON COLUMN TB_VIDEO_BOARD.TITLE IS '운동법 이름';
COMMENT ON COLUMN TB_VIDEO_BOARD.CONTENT IS '운동법 내용';
COMMENT ON COLUMN TB_VIDEO_BOARD.CATEGORY1 IS '운동법 분류1';
COMMENT ON COLUMN TB_VIDEO_BOARD.CATEGORY2 IS '운동법 분류2';
COMMENT ON COLUMN TB_VIDEO_BOARD.URL IS '동영상 URL';
COMMENT ON COLUMN TB_VIDEO_BOARD.READCOUNT IS '조회수';


-- 운동법 동영상 댓글 테이블 생성
PROMPT CREATING VB_COMMENT TABLE...
CREATE TABLE TB_VB_COMMENT(
  VB_NO NUMBER CONSTRAINT PK_VBC PRIMARY KEY,
  V_NO NUMBER NOT NULL,
  USER_NO NUMBER NOT NULL,
  CONTENT VARCHAR2(1000) NOT NULL,
  REPLY_DATE DATE DEFAULT SYSDATE
);
COMMENT ON COLUMN TB_VB_COMMENT.VB_NO IS '운동법 댓글 번호';
COMMENT ON COLUMN TB_VB_COMMENT.V_NO IS '운동법 번호';
COMMENT ON COLUMN TB_VB_COMMENT.USER_NO IS '작성자';
COMMENT ON COLUMN TB_VB_COMMENT.CONTENT IS '댓글 내용';
COMMENT ON COLUMN TB_VB_COMMENT.REPLY_DATE IS '작성일자';

ALTER TABLE TB_VB_COMMENT
  ADD CONSTRAINT FK1_VBC FOREIGN KEY(V_NO) REFERENCES TB_VIDEO_BOARD;
ALTER TABLE TB_VB_COMMENT
  ADD CONSTRAINT FK2_VBC FOREIGN KEY(USER_NO) REFERENCES TB_USER;
  

-- 커뮤니티 게시판(운동모임) 테이블 생성
PROMPT CREATING MEETING_BOARD TABLE...
CREATE TABLE TB_MEETING_BOARD(
  MB_NO NUMBER CONSTRAINT PK_MB PRIMARY KEY,
  USER_NO NUMBER,
  TITLE VARCHAR2(200) NOT NULL,
  CONTENT VARCHAR2(4000) NOT NULL,
  MEETING_DATE DATE,
  UPLOAD_DATE DATE DEFAULT SYSDATE,
  READCOUNT NUMBER DEFAULT 0
);
COMMENT ON COLUMN TB_MEETING_BOARD.MB_NO IS '운동모임 게시글 번호';
COMMENT ON COLUMN TB_MEETING_BOARD.USER_NO IS '작성자';
COMMENT ON COLUMN TB_MEETING_BOARD.TITLE IS '게시글 제목';
COMMENT ON COLUMN TB_MEETING_BOARD.CONTENT IS '게시글 내용';
COMMENT ON COLUMN TB_MEETING_BOARD.MEETING_DATE IS '모임날짜';
COMMENT ON COLUMN TB_MEETING_BOARD.UPLOAD_DATE IS '작성일자';
COMMENT ON COLUMN TB_MEETING_BOARD.READCOUNT IS '조회수';

ALTER TABLE TB_MEETING_BOARD
  ADD CONSTRAINT FK1_MB FOREIGN KEY(USER_NO) REFERENCES TB_USER;
  

-- 커뮤니티 게시판(운동모임) 댓글 테이블 생성
PROMPT CREATING MB_COMMENT TABLE...
CREATE TABLE TB_MB_COMMENT(
  MBC_NO NUMBER CONSTRAINT PK_MBC PRIMARY KEY,
  MB_NO NUMBER NOT NULL, 
  CONTENT VARCHAR2(1000) NOT NULL,
  USER_NO NUMBER NOT NULL,
  REPLY_DATE DATE DEFAULT SYSDATE
);
COMMENT ON COLUMN TB_MB_COMMENT.MBC_NO IS '운동모임 게시판 댓글 번호';
COMMENT ON COLUMN TB_MB_COMMENT.MB_NO IS '운동모임 게시글 번호';
COMMENT ON COLUMN TB_MB_COMMENT.CONTENT IS '댓글 내용';
COMMENT ON COLUMN TB_MB_COMMENT.USER_NO IS '작성자';
COMMENT ON COLUMN TB_MB_COMMENT.REPLY_DATE IS '작성일자';

ALTER TABLE TB_MB_COMMENT
  ADD CONSTRAINT FK1_MBC FOREIGN KEY(MB_NO) REFERENCES TB_MEETING_BOARD;
ALTER TABLE TB_MB_COMMENT
  ADD CONSTRAINT FK2_MBC FOREIGN KEY(USER_NO) REFERENCES TB_USER;
  

-- 커뮤니티 게시판(후기,QNA) 테이블 생성
PROMPT CREATING COM_BOARD TABLE...
CREATE TABLE TB_COM_BOARD(
  CB_NO NUMBER CONSTRAINT PK_CB PRIMARY KEY,
  USER_NO NUMBER,
  TITLE VARCHAR2(200) NOT NULL,
  CONTENT VARCHAR2(4000) NOT NULL,
  BOARD_PROPERTY NUMBER,
  UPLOAD_DATE DATE DEFAULT SYSDATE,
  READCOUNT NUMBER DEFAULT 0
);
COMMENT ON COLUMN TB_COM_BOARD.CB_NO IS '커뮤니티게시글 번호';
COMMENT ON COLUMN TB_COM_BOARD.USER_NO IS '작성자';
COMMENT ON COLUMN TB_COM_BOARD.TITLE IS '게시글 제목';
COMMENT ON COLUMN TB_COM_BOARD.CONTENT IS '게시글 내용';
COMMENT ON COLUMN TB_COM_BOARD.BOARD_PROPERTY IS '게시판특성 0=후기/1=QNA';
COMMENT ON COLUMN TB_COM_BOARD.UPLOAD_DATE IS '작성일자';
COMMENT ON COLUMN TB_COM_BOARD.READCOUNT IS '조회수';

ALTER TABLE TB_COM_BOARD
  ADD CONSTRAINT FK1_CB FOREIGN KEY(USER_NO) REFERENCES TB_USER;


-- 커뮤니티 게시판(후기,QNA) 댓글 테이블 생성
PROMPT CREATING CB_COMMENT TABLE...
CREATE TABLE TB_CB_COMMENT(
  CBC_NO NUMBER CONSTRAINT PK_CBC PRIMARY KEY,
  CB_NO NUMBER NOT NULL,
  USER_NO NUMBER NOT NULL,
  CONTENT VARCHAR2(1000) NOT NULL,
  REPLY_DATE DATE DEFAULT SYSDATE
);
COMMENT ON COLUMN TB_CB_COMMENT.CBC_NO IS '커뮤니티게시판 댓글 번호';
COMMENT ON COLUMN TB_CB_COMMENT.CB_NO IS '커뮤니티게시글 번호';
COMMENT ON COLUMN TB_CB_COMMENT.USER_NO IS '작성자';
COMMENT ON COLUMN TB_CB_COMMENT.CONTENT IS '댓글 내용';
COMMENT ON COLUMN TB_CB_COMMENT.REPLY_DATE IS '작성일자';

ALTER TABLE TB_CB_COMMENT
  ADD CONSTRAINT FK1_CBC FOREIGN KEY(CB_NO) REFERENCES TB_COM_BOARD;
ALTER TABLE TB_CB_COMMENT
  ADD CONSTRAINT FK2_CBC FOREIGN KEY(USER_NO) REFERENCES TB_USER;
  

-- 마이페이지 스케줄 테이블 생성
PROMPT CREATING MYPAGE_SCHEDULE TABLE...
CREATE TABLE TB_MYPAGE_SCHEDULE(
  S_NO NUMBER CONSTRAINT PK_MS PRIMARY KEY,
  V_NO NUMBER,
  USER_NO NUMBER NOT NULL,
  CONTENT VARCHAR2(100) NOT NULL,
  UPLOAD_DATE DATE NOT NULL
);
COMMENT ON COLUMN TB_MYPAGE_SCHEDULE.S_NO IS '마이페이지일정 번호';
COMMENT ON COLUMN TB_MYPAGE_SCHEDULE.V_NO IS '운동법 번호';
COMMENT ON COLUMN TB_MYPAGE_SCHEDULE.USER_NO IS '유저번호';
COMMENT ON COLUMN TB_MYPAGE_SCHEDULE.CONTENT IS '내용';
COMMENT ON COLUMN TB_MYPAGE_SCHEDULE.UPLOAD_DATE IS '날짜';

ALTER TABLE TB_MYPAGE_SCHEDULE
  ADD CONSTRAINT FK1_MS FOREIGN KEY(V_NO) REFERENCES TB_VIDEO_BOARD;
ALTER TABLE TB_MYPAGE_SCHEDULE
  ADD CONSTRAINT FK2_MS FOREIGN KEY(USER_NO) REFERENCES TB_USER;
  

-- 문의하기 테이블 생성
PROMPT CREATING QNA TABLE...
CREATE TABLE TB_QNA(
  Q_NO NUMBER CONSTRAINT PK_Q PRIMARY KEY,
  SENDER NUMBER NOT NULL,
  RECEIVER NUMBER NOT NULL,
  TITLE VARCHAR2(100) NOT NULL,
  CONTENT VARCHAR2(4000) NOT NULL,
  ORIGINAL_FILENAME VARCHAR2(4000),
  RENAME_FILENAME VARCHAR2(4000),
  WRITE_DATE DATE DEFAULT SYSDATE,
  Q_LEVEL NUMBER DEFAULT 0,
  REF_NO NUMBER NOT NULL
);
COMMENT ON COLUMN TB_QNA.Q_NO IS '문의하기 번호';
COMMENT ON COLUMN TB_QNA.SENDER IS '보낸이';
COMMENT ON COLUMN TB_QNA.RECEIVER IS '받는이';
COMMENT ON COLUMN TB_QNA.TITLE IS '문의하기제목';
COMMENT ON COLUMN TB_QNA.CONTENT IS '문의하기내용';
COMMENT ON COLUMN TB_QNA.ORIGINAL_FILENAME IS '원래 파일 이름';
COMMENT ON COLUMN TB_QNA.RENAME_FILENAME IS '바뀔 파일 이름';
COMMENT ON COLUMN TB_QNA.WRITE_DATE IS '작성일자';
COMMENT ON COLUMN TB_QNA.Q_LEVEL IS '글레벨';
COMMENT ON COLUMN TB_QNA.REF_NO IS '참조글번호';

ALTER TABLE TB_QNA
  ADD CONSTRAINT FK1_Q FOREIGN KEY(SENDER) REFERENCES TB_USER(USER_NO);
ALTER TABLE TB_QNA
  ADD CONSTRAINT FK2_Q FOREIGN KEY(RECEIVER) REFERENCES TB_USER(USER_NO);
ALTER TABLE TB_QNA
  ADD CONSTRAINT FK3_Q FOREIGN KEY(REF_NO) REFERENCES TB_QNA(Q_NO);
  
  
-- 좋아요 테이블 생성
PROMPT CREATING LIKE TABLE...
CREATE TABLE TB_LIKE(
  V_NO NUMBER NOT NULL,
  USER_NO NUMBER NOT NULL,
  CATEGORY1 VARCHAR2(100) NOT NULL,
  CATEGORY2 VARCHAR2(100) NOT NULL,
  LIKE_DATE DATE DEFAULT SYSDATE
);
COMMENT ON COLUMN TB_LIKE.V_NO IS '운동법 번호';
COMMENT ON COLUMN TB_LIKE.USER_NO IS '좋아요를 누른 회원 번호';
COMMENT ON COLUMN TB_LIKE.CATEGORY1 IS '운동법 카테고리1';
COMMENT ON COLUMN TB_LIKE.CATEGORY2 IS '운동법 카테고리2';
COMMENT ON COLUMN TB_LIKE.LIKE_DATE IS '좋아요를 누른 날짜';

ALTER TABLE TB_LIKE
  ADD CONSTRAINT FK1_L FOREIGN KEY(V_NO) REFERENCES TB_VIDEO_BOARD;
ALTER TABLE TB_LIKE
  ADD CONSTRAINT FK2_L FOREIGN KEY(USER_NO) REFERENCES TB_USER;
  
------------- 시퀀스 생성 ----------------
PROMPT SEQUENCE 생성시작..
-- 유저 시퀀스 --
DROP SEQUENCE USER_SEQ;
CREATE SEQUENCE USER_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 헬스장 시퀀스 --
DROP SEQUENCE GYM_SEQ;
CREATE SEQUENCE GYM_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 헬스장 일정 시퀀스 --
DROP SEQUENCE GS_SEQ;
CREATE SEQUENCE GS_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 헬스장 후기 시퀀스 --
DROP SEQUENCE GC_SEQ;
CREATE SEQUENCE GC_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;
  
-- 마이페이지 스케줄 시퀀스 --
DROP SEQUENCE MS_SEQ;
CREATE SEQUENCE MS_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 운동법 동영상 시퀀스 --
DROP SEQUENCE VB_SEQ;
CREATE SEQUENCE VB_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 운동법 동영상 댓글 시퀀스 --
DROP SEQUENCE VBC_SEQ;
CREATE SEQUENCE VBC_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 문의하기 시퀀스 --
DROP SEQUENCE QNA_SEQ;
CREATE SEQUENCE QNA_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 운동모임 게시판 시퀀스 --
DROP SEQUENCE MB_SEQ;
CREATE SEQUENCE MB_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 운동모임 게시판 댓글 시퀀스 --
DROP SEQUENCE MBC_SEQ;
CREATE SEQUENCE MBC_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 커뮤니티 게시판(QNA, 후기) 시퀀스 --
DROP SEQUENCE CB_SEQ;
CREATE SEQUENCE CB_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

-- 커뮤니티 게시판(QNA, 후기) 댓글 시퀀스 --
DROP SEQUENCE CBC_SEQ;
CREATE SEQUENCE CBC_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;
PROMPT SEQUENCE 생성 끝...
-- 시퀀스 생성 종료 --

-- 회원탈퇴 프로시저 생성 --
CREATE PROCEDURE DEL_USER_PROCEDURE
IS
BEGIN
  DELETE FROM TB_USER 
  WHERE DELETE_DATE = SYSDATE;
  COMMIT;
END;

-- 회원탈퇴 잡 스케줄러 실행 -- 
DECLARE
   J_NO NUMBER;
BEGIN
   DBMS_JOB.SUBMIT (
      J_NO,
      'DEL_USER_PROCEDURE;',
      SYSDATE,
      ‘TRUNC(SYSDATE + 1) + 5 / 24',
      FALSE
   );
END;
 

-- 샘플데이터 삽입 --
INSERT INTO TB_USER VALUES(USER_SEQ.NEXTVAL, 'ADMIN', '1234', '관리자', '관리자', '010-8366-3828', 2, NULL, 0);
INSERT INTO TB_USER VALUES(USER_SEQ.NEXTVAL, 'user11@iei.or.kr', '1234', '양동균', '양뚝', '010-8366-3828', 0, NULL, 0);

COMMIT;
  
PROMPT FITNESSGORUND 자료입력 끝...