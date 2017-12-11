PROMPT FITNESSGROUND 자료입력시작

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
  PWD VARCHAR2(4000) NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  NICKNAME VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(20) NOT NULL,
  USER_LEVEL NUMBER DEFAULT 0,
  DELETE_DATE DATE DEFAULT NULL,
  TMPPWD_TF NUMBER DEFAULT 0,
  ORIGINAL_IMAGE VARCHAR2(4000),
  RENAME_IMAGE VARCHAR2(4000),
  USER_STATE NUMBER DEFAULT 0
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
COMMENT ON COLUMN TB_USER.ORIGINAL_IMAGE IS '원래 이미지명';
COMMENT ON COLUMN TB_USER.RENAME_IMAGE IS '바뀐 이미지명';
COMMENT ON COLUMN TB_USER.USER_STATE IS '유저상태 0=활성화 / 1=비활성화';


-- 헬스장 테이블 생성
PROMPT CREATING GYM TABLE..
CREATE TABLE TB_GYM(
  GYM_NO NUMBER CONSTRAINT PK_GYM PRIMARY KEY,
  GYM_NAME VARCHAR2(60) NOT NULL, -- 30에서 60으로 수정
  ORIGINAL_IMAGE VARCHAR2(4000),
  RENAME_IMAGE VARCHAR2(4000),
  OP_TIME VARCHAR2(100) NOT NULL,
  TEL VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(30) NOT NULL,
  PRICE VARCHAR2(500),
  CATEGORY VARCHAR2(100) NOT NULL,
  DESCRIPTION VARCHAR(4000),
  LOCATION VARCHAR2(100) NOT NULL,
  USER_NO NUMBER NOT NULL,
  DELETE_DATE DATE DEFAULT NULL,
  APPROVAL_STATE NUMBER DEFAULT 0
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
COMMENT ON COLUMN TB_GYM.APPROVAL_STATE IS '헬스장등록 승인여부';

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
  TITLE VARCHAR2(300) NOT NULL,
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
  ADD CONSTRAINT FK2_MS FOREIGN KEY(USER_NO) REFERENCES TB_USER ON DELETE CASCADE;
  

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
MAXVALUE 99999
NOCACHE
ORDER;

-- 헬스장 시퀀스 --
DROP SEQUENCE GYM_SEQ;
CREATE SEQUENCE GYM_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

-- 헬스장 일정 시퀀스 --
DROP SEQUENCE GS_SEQ;
CREATE SEQUENCE GS_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

-- 헬스장 후기 시퀀스 --
DROP SEQUENCE GC_SEQ;
CREATE SEQUENCE GC_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;
  
-- 마이페이지 스케줄 시퀀스 --
DROP SEQUENCE MS_SEQ;
CREATE SEQUENCE MS_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

-- 운동법 동영상 시퀀스 --
DROP SEQUENCE VB_SEQ;
CREATE SEQUENCE VB_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

-- 운동법 동영상 댓글 시퀀스 --
DROP SEQUENCE VBC_SEQ;
CREATE SEQUENCE VBC_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

-- 문의하기 시퀀스 --
DROP SEQUENCE QNA_SEQ;
CREATE SEQUENCE QNA_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

-- 운동모임 게시판 시퀀스 --
DROP SEQUENCE MB_SEQ;
CREATE SEQUENCE MB_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

-- 운동모임 게시판 댓글 시퀀스 --
DROP SEQUENCE MBC_SEQ;
CREATE SEQUENCE MBC_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

-- 커뮤니티 게시판(QNA, 후기) 시퀀스 --
DROP SEQUENCE CB_SEQ;
CREATE SEQUENCE CB_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

-- 커뮤니티 게시판(QNA, 후기) 댓글 시퀀스 --
DROP SEQUENCE CBC_SEQ;
CREATE SEQUENCE CBC_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;
PROMPT SEQUENCE 생성 끝...
-- 시퀀스 생성 종료 --

-- 샘플데이터 삽입 --
INSERT INTO TB_USER VALUES(USER_SEQ.NEXTVAL, 'ADMIN', '$2a$10$Fr8KsAskrldajwgHTaOvWeMfMhbamOVTQ9.1S2LN9M01g67zzd2im', '관리자', '관리자', '010-8366-3828', 2, NULL, 0, NULL, NULL, 0);
INSERT INTO TB_USER VALUES(USER_SEQ.NEXTVAL, 'user11@iei.or.kr', '$2a$10$UWJxBhRjk8rH4CTKattaEOfkcKX20nYKrsImhve/0OLfrRipPRrwG', '양동균', '양뚝', '010-8366-3828', 1, NULL, 0, NULL, NULL, 0);
INSERT INTO TB_USER VALUES(USER_SEQ.NEXTVAL, 'wltjs1796@naver.com', '$2a$10$sghg6nmqBwt1d54SlM0ZfubV5NjS1Iur.59X1.2FF09oWZlNqGnty', '윤지선', '지선짱', '010-6243-6597', 0, NULL, 0, NULL, NULL, 0);
INSERT INTO TB_USER VALUES(USER_SEQ.NEXTVAL, 'dlrbdus02@naver.com', '$2a$10$Xwj2UZ.bbu2RXt2YryO4NOIlnjbo21KVzIgzDCBRGMZIxcQw8Szwe', '일반이규연', '일반이규연', '010-6357-2634', 0, NULL, 0, NULL, NULL, 0);
INSERT INTO TB_USER VALUES(USER_SEQ.NEXTVAL, 'vaseline584@naver.com', '$2a$10$wiMg9.PSdH4akf476MvVR.t6iVEY36conMRdJTJohqZtEU9OQyHnO', '또이규연', '또이규연', '010-2122-6374', 0, NULL, 0, NULL, NULL, 0);
INSERT INTO TB_USER VALUES(USER_SEQ.NEXTVAL, 'vaseline02@naver.com', '$2a$10$s9FRq3HzDIySGlrlbixbXOntOssZNjPDCQuTtmyVxnISRahwohMhO', '사업자이규연', '사업자이규연', '010-6357-2634', 1, NULL, 0, NULL, NULL, 0);

INSERT INTO TB_MYPAGE_SCHEDULE VALUES(MS_SEQ.NEXTVAL, NULL, 3, '운동 스케줄 1', SYSDATE-1);
INSERT INTO TB_MYPAGE_SCHEDULE VALUES(MS_SEQ.NEXTVAL, NULL, 3, '운동 스케줄 2', SYSDATE-1);
INSERT INTO TB_MYPAGE_SCHEDULE VALUES(MS_SEQ.NEXTVAL, NULL, 3, '운동 스케줄 3', SYSDATE-1);
INSERT INTO TB_MYPAGE_SCHEDULE VALUES(MS_SEQ.NEXTVAL, NULL, 3, '운동 스케줄 4', SYSDATE);

INSERT INTO TB_GYM VALUES(14, '테스트용', NULL, NULL,  '테스트용', '010-0000-0000', '010-4111-1111',  NULL, '테스트용',  '설명', '안산', 6, NULL, 1);
commit;
   select user_no, email, name, gym_no, gym_name, location, approval_state 
       from tb_gym  join (select * from tb_user where user_level=1) using(user_no);
     
     
INSERT INTO TB_MEETING_BOARD
VALUES(1,2,'금강산 같이 타실분 구해요','이번 12월 11일날 눈이 많이 온다고들 하네요.. 그때 산 한번 타고 싶은데 같이 타실분 있나요?',
        17/12/11,default,0);
INSERT INTO TB_MEETING_BOARD
VALUES(2,2,'새벽에 같이 운동 하실분','저녁에 운동하다 지금은 가게 직원이 없어서 운동도못한지 삼주쨰.. 새벽이라도 하고 싶네요.. 새벽에 시청 같이 도실분 있나요??',
        '17/12/11',default,0);
INSERT INTO TB_MEETING_BOARD
VALUES(3,3,'구로 부천 같이 운동하실분(일요일만)','원래 월~토 운동했는데 앞으로 일~금 운동으로 바꾸려고 합니다. 일요일에 서울이나 부천에서 멀지 않을 곳으로 일권 끊고 운동 다닐까 하는데 같이 하실분 있었으면 해서요~~ 파트너 운동은 경험없고 혼자 조용히 운동하는편인데 커뮤티니에 운동모임 하시는분들 보면 여러면에서 좋아보이네요 주변에 운동하는 사람들이 없어서..ㅎㅎ',
        default,default,0);
INSERT INTO TB_MEETING_BOARD
VALUES(4,2,'같이 운동하실분','달리기, 걷기, 줄넘기 등.. 같이 운동하실분 계실까요??',
        default,default,0);
INSERT INTO TB_MEETING_BOARD
VALUES(5,3,'같이 탁구나 운동 하실분 찾아요','제 주위에는 운동을 너무 싫어하네요 ㅠㅠ 혼자 신천걷고 뛰는게 싫증이..ㅋㅋ 혹 탁구나 배드민턴 등 아님 신천도 좋지만 .. 무튼 같이 운동하실분 찾아봅니다.! 참고로 저는 수성구 살아요',
        default,default,0);        

INSERT INTO TB_COM_BOARD
VALUES(1,2,'붕어운동 기구 솔직후기!!','평소 허리디스크가 있어서 운동도 많이하고 있는편인데 티비보다 홈쇼핑에서 붕어운동기구를 봤어요 보다보니
뭔가 혹하는?ㅋㅋ 30만원이 넘어서 가격대가 좀 많이 쎄지만 3일 무료체험이 된다고 하니 일단 질렀어용.. 코어운동이 가능하며 몸의 밸런스를 맞춰준다고하니
완전 저한테 엄청 필요한것 ㅋㅋㅋㅋ 사용해봤는데 붕어운동 운동기구 사용해보니 허리가 가벼워지는 느낌이 좋았어요',0,sysdate,0);

INSERT INTO TB_COM_BOARD
VALUES(2,2,'승마운동기구후기 뱃살뺐어요!!','뱃살을 빼는데 좋다는 윗몸일으키기부터 요가자세까지..안해본게 없습니다!! 물론 제가 꾸준히 했다면 효과를 봤겠지요..ㅎㅎ
조금만 힘들면 스스로 만족을 하고 그만두게되는데요..시간을 재어보니 고작 3분??ㅎㅎㅎㅎ 그래서 그냥 포기를 하는게 일수였죠!! 어느날 거울을 보고 안되겠다 싶어 시작한 승마운동기구~~ 뱃살이 조금씩 빠지는걸 보니 계속하게 되더라고요.지금부터 제가 효과 본 승마운동기구후기를 공유할께요!!',0,sysdate,0);

INSERT INTO TB_COM_BOARD
VALUES(3,2,'여자케겔운동기구 사용후기/효과 공개!','사촌 언니가 지난 미즈케어 무료상담 이후 쭉 비공개 프로그램을 진행준입니다. 이는 베리얀3.0이라는
여자 케겔 운동기루를 이용하는 방법으로서, 본 프로그램의 진행전에 들어가는 무료분석이 상당히 도움이 되는데다 성실하게 실천하기만 한다면 최소 2~3주 이후부터는 효과를 볼 수 있다고 하더군요!',0,sysdate,0);

INSERT INTO TB_COM_BOARD
VALUES(4,3,'다이어트운동으로 호날두다운 남자복근 만들기 ok!','쁜 일상 때문에 남자복근 만들기가 어렵다.만약 이런 분이 계신다면 아니라고 말씀드리고 싶어요.왜냐하면 전 다이어트운동으로 남자복근 만들기 쉽게 하고 있거든요.
 저도 사실 식스패드를 만나기 전까지만 해도 핑계 대면서 다이어트운동과 남자복근은 꿈도 못 꿨는데! 가만히만 있어도 운동이 되는 식스패드 덕에 아주 흡족해하고 있답니다.',0,sysdate,0);
INSERT INTO TB_COM_BOARD
VALUES(5,2,'집에서 간편하게 운동할 수 있다는 기구 질렀어요~ㅎㅎ','이름은 콜라쉐이퍼라고 하는데요! 따로 운동할 필요 없어 가만히 있어도 된다는 말에 홀랑 질러버린~^^
홈쇼핑 보고 급 질러버렸어요...ㅎ 배송이 빨라서 담날 바로 받아봤네요 간단하게 사용 후기도 적어볼게요 옆에 전원버튼이 있어요
충전후에 누르면 진동하면서 운동을 시켜준다고 하네요 ㅎㅎ
그 왜 헬스장에 벨트?같은 걸로 복부 진동 마사지 해주는 기구 있잖아요 ㅎㅎ 딱 그느낌이에요~',0,sysdate,0);
INSERT INTO TB_COM_BOARD
VALUES(6,2,'렉스파 운동기구 질렀어요 ㅋㅋ ','티비 홈쇼핑에 나오길래 질러버렸네요~ 렉스파 운동기구 혹 사용하는 맘 계신가요? ㅎㅎ 후기가 궁금~
신랑이 보너스 탄게 있어서 걍 눈감고 질러버렸거든여~ 날씨는 점점 따뜻해지는데 요놈의 뱃살 빠질생각 안하더라고요~~ㅠㅠ 아휴.집에 오면 큰맘먹고 뱃살이랑 이별준비해야겠네요 ㅎㅎ',0,sysdate,0);

INSERT INTO TB_COM_BOARD
VALUES(7,2,'운동전 식사가 더 좋은가요?','제가 헬스를 시작한지 얼마 안되서요 ㅠㅠ 운동전에 밥을 먹어야할지 운동후에 밥을 먹어야할지 모르겠네요..',1,sysdate,0);

INSERT INTO TB_COM_BOARD
VALUES(8,2,'헬스장 등록건에 대해 궁금해서 여쭈어봅니당..','제가 사업자로 헬스장 등록을 하고 싶은데 뭐 따로 신청해야 하는게 있나요?',1,sysdate,0);

INSERT INTO TB_COM_BOARD
VALUES(9,2,'다이어트 중 궁금한게 있어요..','제가 식단 조절은 안하고 다이어트를 하고 싶은데 최대한 저염식으로요.. 어떤식으로 해야 먹을거 먹으면서 살뺄수 있을까요..',1,sysdate,0);

INSERT INTO TB_COM_BOARD
VALUES(10,2,'제가 처음 운동을 시작하는데..','제가 처음 운동을 시작하는데 어떤 운동을 해야 할지 잘 모르겠어요 ㅠ 어떤 운동부터 시작해야 할까요 ㅠㅠ 저는 쫌 마른편입니다..',1,sysdate,0);

--TB_VIDEO_BOARD (요가)샘플데이터 
INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 18회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','이유주의 "VINYASA YOGA" 18회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','요가','다이어트','-O8CI32TpgI',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 17회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','이유주의 "VINYASA YOGA" 17회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','요가','다이어트','HuRgTZf7MlE',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 16회 요가를 통한 다이어트 live 방송 by헬스티비,+헬스tv','이유주의 "VINYASA YOGA" 16회 요가를 통한 다이어트 live 방송 by헬스티비,+헬스tv','요가','다이어트','ZOvINmqdL3k',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 15회 요가를 통한 다이어트 live 방송 by헬스티비,+헬스tv','이유주의 "VINYASA YOGA" 15회 요가를 통한 다이어트 live 방송 by헬스티비,+헬스tv','요가','다이어트','Tph3Q7eV-Mg',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 14회 요가를 통한 다이어트 live 방송 by헬스티비','이유주의 "VINYASA YOGA" 14회 요가를 통한 다이어트 live 방송 by헬스티비','요가','다이어트','tcAmTQ0Cw9o',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 13회 요가를 통한 다이어트 live 방송 by헬스티비','이유주의 "VINYASA YOGA" 13회 요가를 통한 다이어트 live 방송 by헬스티비','요가','다이어트','pZBYuBqR2sE',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 12회 요가를 통한 다이어트 live 방송 by헬스티비','이유주의 "VINYASA YOGA" 12회 요가를 통한 다이어트 live 방송 by헬스티비','요가','다이어트','2OJMTZeH1ag',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 10회 요가를 통한 다이어트 live 방송 by 헬스티','이유주의 "VINYASA YOGA" 10회 요가를 통한 다이어트 live 방송 by 헬스티','요가','다이어트','_E41vfKM2x8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 9회 요가를 통한 다이어트 live 방송 by 헬스티비','이유주의 "VINYASA YOGA" 9회 요가를 통한 다이어트 live 방송 by 헬스티비','요가','다이어트','j7EC5Z2asIk',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 VINYASA YOGA 8회 요가를 통한 다이어트 live 방송','이유주의 VINYASA YOGA 8회 요가를 통한 다이어트 live 방송','요가','다이어트','Qftmd4y_hmQ',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'yoga challenge + physical exercise 7th by healthtv','yoga challenge + physical exercise 7th by healthtv','요가','다이어트','AM6n3o3ApGc',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'yoga workout + yoga challenge 6th','yoga workout + yoga challenge 6th','요가','다이어트','tzYwdV1YaoA',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'vinyasa yoga + yoga challenge 5th','vinyasa yoga + yoga challenge 5th','요가','다이어트','mAaX8k6ySqs',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'휘트니스모델 심으뜸 + 요가강사 이유주 의 콜라보 방송 "JU-DDEUM"','휘트니스모델 심으뜸 + 요가강사 이유주 의 콜라보 방송 "JU-DDEUM"','요가','다이어트','mnN3RYQd6Ss',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 4회 요가를 통한 다이어트 live 방송 by 헬스티비 HTV Healthtv','이유주의 "VINYASA YOGA" 4회 요가를 통한 다이어트 live 방송 by 헬스티비 HTV Healthtv','요가','다이어트','9rd00PcCzU4',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 3회 요가를 통한 다이어트 live 방송 by 헬스티비 HTV Healthtv','이유주의 "VINYASA YOGA" 3회 요가를 통한 다이어트 live 방송 by 헬스티비 HTV Healthtv','요가','다이어트','yCeOneYaH_8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'vinyasa + physical exercise 2회','vinyasa + physical exercise 2회','요가','다이어트','Ftf2oA-3CYM',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'VINYASA YOGA + pilates 1st','VINYASA YOGA + pilates 1st','요가','다이어트','rqKg1UGqBBE',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 20회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','이유주의 "VINYASA YOGA" 20회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','요가','다이어트','R8E1YwxIC6g',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 21회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','이유주의 "VINYASA YOGA" 21회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','요가','다이어트','5XU6b3p4oM8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'이유주의 "VINYASA YOGA" 22회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','이유주의 "VINYASA YOGA" 22회 요가를 통한 다이어트 live 방송 by헬스티비+헬스tv','요가','다이어트','uaQwJVPAz7c',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]초보자를 위한 빈야사 요가 - 블럭','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 초보자분들에게 블럭은 정말 유용한 도구입니다. 하지만 정작 그 쓰임새를 잘 알지 못하시는데요 이번 영상은 블럭을 이용한 가장 기본적인 영상입니다. 이 영상을 바탕으로 블럭을 활용하는데 도움이 되었으면 합니다.','요가','빈야사','03ydrIQxeK4',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]애플힙을 위한 강력한 두번째 빈야사 요가 - 난이도가 조금 있어요','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 여러분!!!!!! 여러분!!!!!! 하하하....T^T 여러분은 오늘 사시나무 떨듯이 떠는 저를 보게 되실 겁니다. 왜이러지;;; 오늘 이상하게 너무 힘들고 몸이 떨리네요. 촬영시간은 기상 후 3시간 정도 후인데 제가 아무것도 안먹었거든요. 그래서 그런지 오늘은 이상하게 덜덜거리네요. 참고하시면서 봐주시길 바라면서 오늘은 애플힙 영상 두번째로 더 강력한 시퀀스를 준비했습니다. 저번 영상에서 집중도가 조금 떨어진거 같은 느낌을 받아 이번에는 완전 집중을 했습니다. 불탈지도 몰라요. 조심하세요~_~ 그리고 동작 난이도가 조금 있습니다. 힘드신분들은 손을 짚은 상태로 하시면 되요. 영상 해보시면 뭔소린지 아실 겁니다. 그럼 지금 바로 시작합니다.','요가','빈야사','GXECrcR-tDc',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]30분 애플힙을 위한 빈야사 요가','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상은 애플힙을 위한 영상입니다. 제가 시퀀스를 짤때는 힙에 집중해서 만들었는데 찍다보니까 후반부에 생각만치 엉덩이가 불타지 않터라고요. 그러므로!!! 최대한 힙에 집중해서 동작을 하세요. 해보면 아시겠지만 힙에 집중을 하였으나 다른곳에 움직임 역시 넘쳐난다는것을 기억하시면서 지금 바로 시작합니다.','요가','빈야사','BUqB9xoIjLU',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]트라이포드 해드스탠드에서 점프백-차투랑가-빈야사 전환','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상은 트라이포드 해드스탠드에서 점프백-차투랑가-빈야사 전환하는 방법에 관한 영상입니다. 단단한 차투랑가와 해드스탠드가 가능하시다면 충분히 가능하십니다. 주저말고 도전하세요.','요가','빈야사','qcEOThGHY9Y',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]23분 새로운 로우런지를 만나는 빈야사 요가','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 제가 뭐에 씌었는지 편집을 엉망으로 해서 다시 올립니다. 배가 너무 고팠나봐요~_~ 로우런지의 다양한 변형동작으로 시퀀스를 구성했습니다. 난이도가 조금있다는건 안비밀! 즐거운 수련되시길 바랍니다. 아참!!!!! 고등학교 후배분이 댓글을 남겨주셨는데 감사합니다. 하지만 이름은 쓰지 말아주세요 ㅠㅜ 왠지 민망해요 하하','요가','빈야사','9B7QnpaGZhc',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]중급자를 위한 24분 빈야사 요가','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상은 오랫만에 중급자 영상을 준비했습니다. 하지만 중급자 영상이라고 해서 전부 어려운 동작을 하는 것이 아니고 타겟동작이 레벨이 있는 것이고 하나씩 쌓아가든 기본 동작으로 타겟포즈까지 간다는것 기억하시면서 준비 되셨다면 지금 바로 시작합니다.','요가','빈야사','S1MZ2MbVsG8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]21분 초보자를 위한 빈야사 요가 - 트라이앵글','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/반갑습니다. 요가 강사 EVA입니다. 이번 영상은 초보자 분들을 위한 영상입니다. 요가를 많이 접하신분들도 고관절의 밖으로 회전에 집중하시면서 트리코나아사나의 변형과 바른 정렬을 수련하기에 좋은 시퀀스라 생각합니다. 땀이 장난이 아닙니다 하하 준비되셨으면 바로 시작합니다.','요가','빈야사','m_cgE75m5Og',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]옆구리살 제거 빈야사 요가','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상은 많은 여성분들의 고민인 옆구리살을 줄이는데 도움이 되는 영상을 준비했습니다. 지금 바로 시작할께요','요가','빈야사','BO3V1MVtuqM',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]겨날 제거 빈야사 요가','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상은 슬림한 팔라인을 위한 빈야사 요가입니다. 지금 바로 시작하세요.','요가','빈야사','5qdJSM2NuD4',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]64분 빈야사 요가','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상 역시 개인교습 영상입니다. 64분 풀 시퀀스 빈야사 요가 지금 함께하세요','요가','빈야사','m9jwDWZh-j4',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]30분 디톡스 빈야사 요가 30min detox vinyasa yoga','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상은 디톡스를 주제로 시퀀스를 준비했습니다. 30분 영상중 선자세가 많은 부분을 차지하여 에너지 소모 역시 엄청나게 될것입니다. 지금 바로 시작합니다.','요가','빈야사','i7IbvLzCmjo',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]중급자를 위한 버드 오브 파라다이스 빈야사 요가 Bird of Paradise vinyasa yoga','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상은 고관절의 유연성이 많이 필요한 버드 오브 파라다이스를 주제로 한 빈야사 요가입니다. 지금 버드 오브 파라다이스에 도전해 보세요.','요가','빈야사','8ZjrAEqoYX8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]15분 당신의 심장을 뛰게 할 초보자를 위한 빈야사 요가 15min cardio vinyasa yoga for beginners','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상은 초보자를 위한 영상입니다. 빈야사만 변경하신다면 중급이상 분들도 즐겁게 수련하실 수 있는 시퀀스 입니다. 테이블탑의 새로운 변형과 반복적인 움직임으로 여러분의 심장을 뛰게 할 것입니다. 준비되셨나요? 바로 시작합니다.','요가','빈야사','8LM6W3G5Bns',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]15분 중급자를 위한 댄스포즈 빈야사 요가 15min natarajasana vinyasa yoga','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 반갑습니다. 요가 강사 EVA입니다. 이번 영상은 가슴열기와 약간의 트위스트가 포함된 빈야사 플로우입니다. 타겟포즈는 나타라자사나, 댄스포즈 입니다. 준비되셨나요? 바로 시작합니다.','요가','빈야사','JEYWv1p8G5Y',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]하체의 힘이 코어의 힘! 초보자를 위한 코어 빈야사 요가 core vinyasa yoga for beginner','반갑습니다. 요가 강사 EVA입니다. 이번 영상은 블럭을 이용하여 빈야사를 수련합니다. 하체의 힘이 코어의 힘 임을 다시 한번 기억하시면서 즐거운 수련되시기 바랍니다.','요가','빈야사','-v8ezWv7zu8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]시르샤사나를 위한 10분 빈야사요가 10min vinyasa yoga for sirsiasana','반갑습니다. 요가 강사 EVA입니다. 이번 영상은 시르샤아사나 해드스텐드를 준비하는 빈야사 입니다. 어깨를 모아주고 전굴로 자세를 유지합니다. 그것에만 그치지 않고 앞으로만 굽혔던 상체를 펴는 동작까지 포함했습니다. 준비되셨나요? 바로 시작할께요','요가','빈야사','lv5QEThEO6I',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]중급자를 위한 내 몸에 활력을 주는 19분 빈야사 요가 19 min energizing vinyasa yoga','반갑습니다. 요가 강사 EVA입니다. 이번 영상은 중급자를 위한 19분 빈야사 요가입니다. 이번 시퀀스에는 박카사나 점프백이 포함되어 있는데 점프백에 아주 간단히 팁을 알려드렸습니다. 너무 별거아니지만 딱 맞는 팁입니다. 하하;;; 또한 박카사나 점프백 빈야사를 제외하고는 전부 플랭크 차투랑가 푸쉬업 다운독의 변형된 빈야사로 플로우를 진행했습니다. 많은 팔힘이 요구됩니다. 준비되셨나요? 바로 시작합니다.','요가','빈야사','eSWZbJJkzvQ',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]더 유연한 몸을 위한 16분 빈야사 요가 16min vinyasa yoga for flexibility','반갑습니다. 요가 강사 EVA입니다. 오늘은 하체의 유연성에 도움이 되는 시퀀스를 준비했습니다. 긴말 필요없겠죠? 바로 시작합니다.','요가','빈야사','U7socaRfnf8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]중급자를 위한 트위스트와 암발란스 빈야사 요가 twist + arm balance vinyasa yoga','반갑습니다. 요가 강사 EVA입니다. 이번 영상은 트위스트와 아주 간단한 암발란스가 포함된 빈야사 요가입니다. 초보자 분들은 암발란스 동작에서 발을 바닥에서 띄우지 않고 자세를 유지하셔도 좋습니다. 매트 준비되셨나요 바로 시작합시다^^','요가','빈야사','TcPzxobF2KQ',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]17분 데일리 빈야사 요가 Daily vinyasa yoga','반갑습니다. 요가 강사 EVA입니다. 이번 영상은 매일 꾸준히 수련하시면 근력과 유연성을 모두잡을수 있는 시퀀스로 준비했습니다. 전체적으로 부담없는 아사나들로 구성했습니다. 준비되셨나요? 바로 시작합니다.','요가','빈야사','xHlTj9b9hBY',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]초보자를 위한 26분 숩타쿠루마사나 빈야사 요가','반갑습니다. 요가 강사 EVA입니다. 특별히 시퀀스 제목을 숩타쿠루마사나라고 쓰긴했지만 이 영상은 앞전의 중급자의 시퀀스를 초보자의 시퀀스로 바꾸어 천천히 진행하며 기본적인 자세의 설명을 추가로 하여 처음 요가를 접하셔도 충분히 수련하실수 있도록 만들어보았습니다. 덧붙여 동영상별 레벨에 대해 말씀드리자면 뭔가 확실한 구분선을 가지고 이건 초보자용 이건 중급자용 이건 고급자용으로 나누면 좋겠지만 직접 수련을 하고 가르치다 보니 여러가지 고려해야할 사항들이 있어 명확한 구분이 쉽지 않습니다. 외국과는 조금 다른 요가에 대한 생각정도 라고 간단히 쓰겠습니다. 또한 제가 도전적인 자세를 좋아라해서 난이도 있는 자세를 주제로 수업을 해봤는데요 많은 시간 티칭 해본 결과 어려운거 해봐야 좋아하시는 분들이 몇몇 없으시더라고요....흠흠;;; 하지만 정확한 것은 초보자용은 진짜 초보자들이 하실수 있게 찍었습니다. 또한 요가 경험이 어느정도 있더라도 나의 자세를 좀더 정렬에 집중해서 수련하고 싶을때 초보자용으로 수련하시면 도움이 되실 겁니다. 특별히 쿠루마사나 같은 경우는 매우 도전적인 자세라 앞에 중급자 이상이란 말을 붙였습니다. 그러니까 초보자라고 쓴건 진짜 초보자용이고 나머지는 요가를 어느정도 수련하신분들이 하시면 좋은 영상입니다. 그렇다고 초보자가 다른 영상을 수련할수 없는 것은 아닙니다. 아;;;; 제가 옆에서 알려드리고 싶은맘이 ... 하하 블럭과 스트랩을 기본으로 요가 도구를 사용하시면 초보자분들도 모든 영상을 하실수 있습니다. 이건 시간이 지나면 다 아실테니 앞으로 꾸준히 같이 수련해보시길 바랍니다. 말이 길었네요. 준비되셨다면 지금 바로 시작합니다.','요가','빈야사','AQDAqlMLER8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA] 17분 파워 빈야사 요가','반갑습니다. 요가 강사 EVA입니다. 오늘은 힘이 넘치는 시퀀스를 준비했습니다. 많은 활동적인 아사나가 포함되어 있습니다. 준비되셨나요? 바로 시작합니다.','요가','빈야사','pei_YV6atvg',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]중급자 이상을 위한 숩타쿠루마사나 + 쿠루마사나 빈야사 요가','반갑습니다. 요가 강사 EVA입니다. 오늘은 중급자 이상을 위한 빈야사를 준비했습니다. 숩타쿠루마사나와 쿠루마사나는 허리에 아주 깊은 전굴이 일어납니다. 허리 부상에 주의하시면서 천천히 같이 수련해 보시길 바랍니다.','요가','빈야사','bwWHjlehJGo',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]건강한 허리를 위한 빈야사 요가 2.','반갑습니다. 요가 강사 EVA입니다. 이번 영상 역시 건강한 허리를 위한 빈야사입니다. 첫번째 영상과 연결해서 수련하셔도 좋습니다 그럼 바로 시작하세요^^','요가','빈야사','lrx9i2fZFm0',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]건강한 허리를 위한 빈야사 요가 1.','반갑습니다. 요가 강사 EVA입니다. 이번 동영상은 건강한 허리를 위한 빈야사 요가를 준비했습니다. 많은 사람들이 허리통증을 겪을때 허리를 비틀거나 꺽는 동작을 합니다. 이것은 상태를 악화시킬뿐 전혀 도움이 되지 않습니다. 통증이 심할때는 휴식을 취하시고 통증이 어느 정도 완화되었을때 허리근력강화 동작을 꾸준히 해주신다면 허리통증없는 건강한 생활을 하실수 있습니다. 준비되셨나요? 바로 시작합니다.','요가','빈야사','EWm26T7x-zg',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]강한! 슬림한! 균형잡힌! 하체를 위한 빈야사 요가','반갑습니다. 요가 강사 EVA입니다. 이번 영상은 하체강화를 위한 빈야사입니다. 다른 말이 필요할까요? 바로 시작하시면 됩니다.^^','요가','빈야사','FX3FqWw2KC0',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]강한! 슬림한! 균형잡힌! 상체를 위한 빈야사 요가','반갑습니다. 요가 강사 EVA입니다. 이번영상은 상체를 단단! 슬림하게 만들어주는 빈야사로 준비했습니다. 바로 시작하세요! 이곳은 3월 4월 5월이 가장 덥습니다. 제가 있는 곳은 소음이 심한 곳이라 창문을 닫고 촬영하며 좋은 장비를 갖추어 촬영하는 것이 아니라 에어컨와 선풍기도 사용하지 않고 촬영을 합니다.(소음이 심할까봐요^^;) 땀도 많이 흘리고 숨소리도 많이 거친부분 이해해주시길 바랍니다.','요가','빈야사','9EWGqVs--kQ',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA] 요가 빈야사에 대하여(for 초보자)','반갑습니다. 요가 강사 EVA입니다. 이번에는 빈야사에 대하여 다루어봤습니다. 이미 다른 동영상에서 여러번 소개를 했지만 아직 잘모르시는 분들을 위해 따로 동영상을 준비했습니다. 초보자분들이 차투랑가 단다사나, 업워드페이싱독을 하기엔 무리가 있지요. 그런분들을 위해 쉬운버전의 모디퐈이 차투랑가, 로우코브라 등을 소개합니다.','요가','빈야사','gDI2nKKWFY8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]하누만아사나를 위한 20분 빈야사 요가','반갑습니다. 요가 강사 EVA입니다. 오늘은 하누만아사나를 위한 빈야사를 준비했습니다. 흔히 다리찢기라고 하죠? 차근차근 준비해서 하누만아사나를 완성하는 시퀀스. 블럭만 있으시면 초보자분들도 충분히 도전하실수 있습니다. 자 지금 바로 시작합니다.','요가','빈야사','yGe3bx2qKrA',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]튼튼한 척추를 위한 18분 빈야사 요가 ver.2','반갑습니다. 요가 강사 EVA입니다. 저번 시간에 이어 오늘도 튼튼한 척추를 위한 시퀀스를 마련했습니다. 원래는 두개의 시퀀스가 연결된 것인데 인터넷 사정상 길면 업로딩이 잘안되서 하나의 시퀀스를 두개로 만들었습니다. 여러분은 두개를 같이 수련하시면 좋으실겁니다.^^ 준비되셨으면 지금바로 시작하세요.','요가','빈야사','G1l51wugMXw',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]튼튼한 척추를 위한 17분 빈야사 요가','안녕하세요. 요가 강사 EVA입니다. 척추를 감싸고 있는 많은 근육들을 강화하여 척추를 더 단단하게 잡아주게 하고 늘림으로 척추의 유연성을 도모하여 척추 건강에 도움이 되는 시퀀스를 만들어봤습니다. 허리에서 일어나는 백밴딩이 아닌 흉추과 요추가 만나는 부분에서의 백밴딩을 집중하여 노려보세요^^ 허리는 나의 척추가 그리고 근육들이 튼튼해진 다음에 하는 도전적인 수련이라는 것을 항상 기억하시기 바랍니다. 지금 바로 시작합니다.','요가','빈야사','jiUXOhDCiFI',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]내몸의 체온을 빨리 올리는 퀵히트 quick heat 13분 빈야사 요가','안녕하세요 요가 강사 EVA입니다. 오늘은 짧은 시간에 몸의 체온이 확 올라갈 만한 시퀀스를 준비했습니다. 매일 하는 아사나도 방법을 조금 바꾸면 전혀 다른 근육이 쓰이는데요 전 이런게 재미있습니다 하하. 저만 그런가요+_+ 여튼 자 이제 시작합니다','요가','빈야사','aBxUmn1iL5U',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]내 몸의 정렬을 찾는 19분 빈야사 요가','반갑습니다. 요가 강사 EVA입니다. 오늘은 블럭을 이용하여 몸의 정확한 정렬을 찾는 19분 빈야사요가 시퀀스입니다. 요즘 요가블럭 저렴하죠? 유연성이 부족하신분 초보준들은 블럭이 아주 유용합니다. 하지만 블럭이 없으시더라도 충분히 즐길수 있으니 걱정은 마시고요 지금 바로 시작합니다^^','요가','빈야사','OAYCQr6uzxc',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]이글포즈를 위한 10분 빈야사 요가','반갑습니다 요가 강사 EVA입니다. 오늘은 이글포즈 가루다아사나를 주제로 빈야사요가를 해보겠습니다 균형을 잘잡기 위해서는 아사나의 많은 반복과 다리근력이 필요합니다 전...연습을 게을리한탓인지 자꾸 흔들리네요 하하하하....더 열심히 수련하겠습니다! 매트 준비되셨죠?? 지금 바로 시작하세요','요가','빈야사','XpjBIXK_b1Q',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]20분 초보자를 위한 빈야사 요가','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 요가 초보자들을 위한 빈야사 요가 입니다. 매트만 있다면 간편하게 시작하실수 있습니다.','요가','빈야사','9gzi2VVswwo',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]중급자이상을 위한 빈야사 요가, vinyasayoga','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 차투랑가단다사나-업독-다운독이 포함된 빈야사 입니다. 우리나라 여성분들은 근력이 약해서 요가 를 오래 수련하신분들을 제외하고 이 빈야사를 정확히 하시는 분들이 많지 않습니다. 또한 힘든걸 싫어하십니다. ㅠ.ㅜ 어쩌죠?ㅋㅋ 아니 왜죠??? 누구한테 묻는지;;;; 만일 정확한 빈야사 구사가 힘드시다면 쉬운버전으로 같이 해보셔도 좋을거 같습니다. 매트준비되셨으면 지금 바로 시작하세요.','요가','빈야사','X7gywDrrsPk',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]16분 슬림벅지를 위한 빈야사 요가','구독! 좋아요! 많이 부탁드립니다. 구독은 클릭▶https://goo.gl/1nWbJv 슬림한 허벅지를 위한 빈야사 요가입니다. 허벅지 앞,뒤,안 전체 근육을 움직이고 이완시켜 날씬한 허벅지 라인에 도전해보세요^^','요가','빈야사','qtFQRdeI5HY',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]두번째 초보자를 위한 빈야사 요가','초보자를 위한 빈야사 요가 두번째 입니다. 역시 매트만 준비하세요.','요가','빈야사','TU_Bygb2570',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVAYOGA]슬림옆구리 빈야사,하이런지트위스트빈야사, 사이드밴드+트위스트 ver.2','하이런지 트위스트 빈야사 시퀀스의 또 다른 버전입니다. 즐거운 수련되세요~_~','요가','빈야사','JGlX-7nJoXQ',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]가슴+어깨 열기 빈야사 요가','가슴열기 그리고 어깨열기를 위한 빈야사 요가 입니다. 차투랑가 업독 다운독이 포함된 빈야사입니다. 초보이신 분들은 쉬운 빈야사로 플로우를 이어가세요. 만일 힘드시다면 빈야사할때 차투랑가 대신 곧바로 다운독 그후 플로우를 이어가셔도 좋습니다. 즐거운 수련되세요^^','요가','빈야사','SBCN4iE-TN0',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]초보자를 위한 골반열기 빈야사 요가','초보자 분들도 쉽게 따라 하실수 있는 빈야사 요가입니다. 이번 시퀀스의 주제는 바로 고관절 열기^^ 다리를 양옆으로 심하게 넓히는 것이 아닌 초보들도 쉽게 하실수 있는 선자세에서의 골반열기 입니다. 지금 시작합니다.','요가','빈야사','DmZzizTvbbs',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]15분 디톡스 빈야사 요가','트위스트 동작이 포함된 빈야사 요가, 내 몸의 독소를 제거한다! 15분 빈야사요가 함께하세요^^','요가','빈야사','oxPTnv2QJ2Y',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]박카사나를 위한 빈야사 요가','도전적인 자세인 박카사나를 위한 빈야사 요가입니다. 조금 난이도가 있는 동작이지만 재미있게 수련해보아요^^','요가','빈야사','_RtBNOuvQh0',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVA YOGA]슬림옆구리 빈야사 요가,하이런지트위스트 빈야사, 사이드밴드+트위스트 ver.1','하이런지 트위스트를 이용한 빈야사 요가 시퀀스 입니다. 힘차게 시작합니다.','요가','빈야사','sjbQRstRNC8',0);

INSERT INTO TB_VIDEO_BOARD VALUES(vb_seq.nextval,'[EVAYOGA]바시스타아사나 사이드플랭크를 위한 빈야사 요가','바시스타아사나, 사이드플랭크로 도달하는 빈야사 요가 입니다. 이 아사나는 복부강화에 아주 효과적입니다. 특히 옆구리에 아주 많은 힘이 필요합니다. 지금 부터 시작합니다.','요가','빈야사','gTG1MbgxVB0',0);

--헬스 네이버 동영상 샘플 데이터 삽입
-- 가슴 운동
insert into tb_video_board values(vb_seq.nextval,'벤치 프레스 - 머신','머신 벤치 프레스는 바벨이 머신에 고정되어 있어서 초보자들도 쉽게 컨트롤할 수 있는 운동방법입니다. 바벨이나 덤벨 벤치 프레스 운동 전에 자세를 교정하고 대흉근의 긴장감을 미리 느껴보는 연습을 하기에는 최적의 운동입니다. 벤치에 앉아 엉덩이와 견갑골을 등받이에 최대한 붙입니다. 허리는 10cm가량 아치형을 만들어줍니다. 바와 전환이 수직이 되는 곳에 손을 위치시킵니다. 발걸이와 바를 동시에 밀어 팔꿈치가 펴진 상태에서 시작합니다. 바가 몸쪽으로 오는 것과 동시에 가슴을 턱 쪽으로 들고 가슴이 압막하는 느낌을 받도록 하면서 바와 가슴이 수평이 될 때까지 내립니다. 바를 겨드랑이 사이에 힘을 준다는 느낌으로 다시 밀어줍니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=31479A5CD8B2B74D5D6E021DC9E8493B2099^outKey=V128e2483d923e7fcc55066fb526a2c868b1e4b800fa344a8341066fb526a2c868b1e^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'벤치 프레스 - 바벨, 플랫', '바벨 벤치 프레스는 가슴운동을 하는 프리웨이트 운동 중에서 가장 기본이 되는 운동방법입니다. 대흉근의 전체적인 크기를 키워주고 대흉근, 삼각근, 상완삼두근의 참여를 유도해서 강하면서도 균형 있는 상체를 만드는 데 효과적입니다. 벤치에 누워 엉덩이와 견갑골을 등받이에 붙입니다. 허리는 10cm가량 아치형을 만들어줍니다. 어깨 두 배 너비로 바를 잡고 눈이 바벨과 수직이 되도록 합니다. 바를 들어 가슴 중앙과 바가 수직이 되도록 위치시킨 후 팔꿈치를 살짝 구부려 고정시킵니다. 가슴과 바가 자석처럼 서로 만나는 느낌으로 가슴 위쪽 5~10cm까지 저항을 느끼면서 당겨줍니다. 겨드랑이에 힘을 준다는 느낌으로 다시 밀어줍니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=ABD5295DF4C8FEF06D992BDF3FAC6A9B59F0^outKey=V12927b731d923dec7869d4b48883e32cea9e3a0c31c90033a026d4b48883e32cea9e^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'벤치 프레스 - 덤벨, 플랫', '덤벨 벤치 프레스는 가슴근육 중 중앙과 외측 부 근육 크기를 키우는 운동입니다. 덤벨을 들었을 때 균형을 잡기 위한 근육들을 같이 발달시킬 수 있는 장점이 있습니다. 넓은 가동범위로 대흉근에 더 강한 자극을 줄 수 있어서 강하고 안정된 상체를 만드는 데 가장 효과적인 운동입니다. 벤치에 앉아 덤벨을 들어 가슴 옆에 붙입니다. 벤치에 누우면서 덤벨을 들어 눈높이와 수직이 되도록 만듭니다. 가슴 중앙 부분과 수직이 되게 덤벨을 위치시키면서 팔꿈치를 살짝 구부립니다. 가슴이 양옆으로 늘어나는 느낌을 느끼면서 덤벨이 가슴과 평행이 될 때까지 당깁니다. 겨드랑이에 힘을 준 상태에서 가슴을 모아주는 느낌으로 덤벨을 밀어줍니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=FEFE68A19375F3E8492399353788887A0D33^outKey=V122b2368e56e71efa9a16ac265f0176e6eccd78b55f7da859ace6ac265f0176e6ecc^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'벤치 프레스 - 바벨, 인클라인', '인클라인 바벨 벤치 프레스는 대흉근 상부와 전면 삼각근의 크기와 힘을 발달시키기 위한 운동입니다. 인클라인 벤치 각도가 커질수록 어깨 삼각근의 갭이 많아지기 때문에 가슴 상부를 발달시키려면 벤치 각도를 30~40도 정도로 유지하는 것이 중요합니다. 벤치에 누워 엉덩이와 견갑골을 등받이에 최대한 붙이고 아치형을 만들어줍니다. 어깨 두 배 너비로 바를 잡고 바벨을 들어올립니다. 쇄골 아랫부분과 수직이 되게 바를 위치시키면서 팔꿈치를 살짝 구부립니다. 손목은 꺾이지 않도록 주의하면서, 가슴과 바가 자석처럼 서로 만나는 느낌으로 바벨을 쇄골 아랫부분과 약간 떨어진 정도까지 당깁니다. 겨드랑이에 힘을 주는 느낌으로 바벨을 밀어줍니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=4BBA293D04B0C1EA952064BAEDD96BED6A22^outKey=V129b8312e77221140cd7021dc9e8493b2099ca1adb6bb74a767c021dc9e8493b2099^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'벤치 프레스 - 덤벨, 인클라인', '인클라인 덤벨 벤치 프레스는 동작의 범위를 최대화시켜 가슴을 훈련시키는 운동입니다. 밋밋해지기 쉬운 가슴 상부를 단련하고 균형감각을 키울 수 있습니다. 여성들이 인클라인 벤치 프레스를 하면 가슴 모양과 탄력을 더욱 좋게 할 수 있습니다. 초보자의 경우에는 30도의 벤치 각도에서 운동하는 것이 적당합니다. 덤벨을 가슴 옆에 붙입니다. 벤치에 누우면서 덤벨을 들어 눈높이와 수직이 되도록 합니다. 쇄골 아랫부분과 수직이 되게 덤벨을 위치시키면서 팔꿈치를 살짝 구부려 고정시킵니다. 가슴이 양옆으로 늘어나는 느낌을 느끼면서 평행이 될 때까지 당깁니다. 겨드랑이에 힘을 주면서 가슴을 모아주는 느낌으로 덤벨을 밀어줍니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=B1B01005FEC07087339C435062D06D374CFC^outKey=V12470e2c08a28beef29a837c2969c4d1dbf814159bab9c1c30ae837c2969c4d1dbf8^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'플라이 - 덤벨, 인클라인', '인클라인 덤벨 플라이는 가슴 근육 상부의 데피니션 곧, 근육의 선명도와 크기를 확장시켜 대흉근을 강화시키는 운동입니다. 가벼운 중량으로 동작을 실시하는 것이 무엇보다 중요하고 가슴 상부 안쪽을 발달시키는 데 최적의 운동입니다. 벤치에 앉아 덤벨을 무릎 위에 올립니다. 양손에 덤벨을 들어 눈높이와 수직을 만들고 손바닥을 마주보게 합니다. 쇄골 아랫부분과 덤벨이 수직이 되도록 하고 팔꿈치를 살짝 구부려 고정시킵니다. 어깨관절만을 사용해 반원을 그리며 가슴 윗부분이 늘어나는 느낌으로 가슴과 평행할 때까지 내려갑니다. 겨드랑이에 힘을 주고 안아주는 느낌으로 반원을 그리며 모아줍니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=A6D8EEEC4D987A1E4C52D96732A009E527A9^outKey=V124497288b098e81cb9df50a90352df3e3d1134d5ab3caa7d9f7f50a90352df3e3d1^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'벤치 프레스 - 바벨, 디클라인', '디클라인 바벨 벤치 프레스는 딥스 운동과 함께 주로 가슴 하부를 발달시키기 위한 운동입니다. 가슴 하부 바깥쪽 근육의 크기를 만드는 데 효율적이며 디클라인 덤벨 벤치 프레스보다 많은 중량을 들 수 있는 것이 장점입니다. 벤치의 각도는 30~45도가 적당합니다. 경사진 벤치 발걸이에 두 발을 걸치고 눈과 바벨이 수직이 되도록 눕습니다. 견갑골과 엉덩이를 최대한 붙이고 허리는 10cm가량 아치형을 만듭니다. 어깨너비 두 배 정도로 바를 잡고 바벨을 들어 가슴과 수직이 되도록 위치시킵니다. 손목이 꺾이지 않도록 주의하면서, 바벨을 가슴 바로 위까지 당깁니다. 겨드랑이에 힘을 준다는 느낌으로 다시 밀어줍니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=B3A057CC5DBD562FB715C6C8BCBD22996D1D^outKey=V1293fceb0af2196fc53ad4469a561fe57da6e116bf754005c443d4469a561fe57da6^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'벤치 프레스 - 덤벨, 디클라인', '디클라인 덤벨 벤치 프레스는 가슴 하부의 라인을 만들어주는 운동입니다. 이 운동은 디클라인 바벨 벤치 프레스보다 동작의 가동범위가 크다는 차이점이 있습니다. 덤벨을 들었을 때 균형을 잡기 위한 근육들을 함께 발달시키기에 효과적인 운동입니다. 경사진 벤치 발걸이에 두 발을 걸치고 덤벨을 가슴 옆에 붙입니다. 엉덩이와 견갑골을 벤치에 최대한 붙이고 허리는 10cm가량 아치형을 만들어줍니다. 덤벨을 들어 눈 바로 위에 덤벨이 수직이 되도록 위치시킵니다. 가슴이 양옆으로 스트레칭되는 느낌을 가지면서 덤벨이 가슴과 수평이 될 때까지 당겨줍니다. 겨드랑이에 힘을 준 상태에서 가슴을 모아주는 느낌으로 밀어줍니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=F83D366568A3D6D62651BB16F34AC9175D92^outKey=V122621e628e57787519e04cc676647dae467dc052bb71424401404cc676647dae467^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'플라이 - 덤벨, 플랫', '덤벨 플라이는 남성들의 가슴 안쪽 라인을 발달시키기 위해 필수적인 운동으로 근육의 유연성 향상에도 효과가 있습니다. 초급자가 이 훈련을 할 때에는 정확한 동작으로 집중적으로 실시하는 것이 중요합니다. 벤치에 앉아 가슴 옆에 덤벨을 붙입니다. 벤치에 누우면서 덤벨을 들어 눈높이와 수직이 되게 만들고 손바닥을 마주 보게 합니다. 가슴 중앙과 덤벨이 수직이 되도록 위치시키고 팔꿈치를 살짝 구부려 고정시킵니다. 어깨관절만을 사용해 반원을 그리며 가슴이 늘어나는 느낌으로 가슴과 덤벨이 평행이 될 때까지 당깁니다. 겨드랑이에 힘을 준 상태에서 안아주듯이 반원을 그리며 원위치합니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=A7CFF3D94DA52B16EBAE693FC12A4E395EB3^outKey=V1268585725237d10a88cc1e41183920b199204091959ddf6ad7fc1e41183920b1992^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'풀오버 - 덤벨, 플랫', '덤벨 풀오버는 흉곽을 전체적으로 발달시키기 위한 운동입니다. 대흉근을 운동시키고 전거근을 강화할 뿐 아니라 상완삼두근과 광배근까지 자극하여 흉곽 전체 운동이 됩니다. 짧은 시간 안에 상체 전반을 발달시키는 데 아주 효과적입니다. 벤치에 앉아 두 손으로 덤벨을 포개어 듭니다. 벤치에 누우면서 덤벨을 가슴과 수직이 되게 위치시킵니다. 견갑골과 엉덩이를 최대한 붙이고 허리는 10cm가량 아치형을 만듭니다. 팔꿈치를 바깥쪽으로 살짝 구부려 고정시킨 후 머리 위쪽으로 포물선을 그리면서 양팔이 귀 옆에 오는 지점까지 내려줍니다. 다시 가슴 쪽으로 포물선을 그리면서 원위치시킵니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=D846B87DFA4386077BBEE77B8BF50C066627^outKey=V122b287dfa4386077bbee77b8bf50c066627c8553c7467f0051ce77b8bf50c066627^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'플라이 - 펙 덱 머신', '머신 펙 덱 플라이는 가슴 중간부 근육의 크기를 키우고 대흉근의 데피니션 곧 근육의 선명도와 스트리레이션 다시 말해 가로로 갈라지는 근육선을 만들기 위한 운동입니다. 운동을 시작하는 초보자들이 집중하기에 좋은 운동이며 정확한 자세로 반복 횟수를 늘리는 것이 가장 중요합니다. 견갑골와 엉덩이를 등받이에 최대한 붙이고 허리는 10cm가량 아치형을 만듭니다. 팔꿈치를 90도 정도 구부려 팔꿈치가 가슴 중앙과 수평이 되도록 하면서 전완을 패드에 밀착시킵니다. 겨드랑이에 힘을 주고 패드를 가슴 안쪽으로 모아줍니다. 저항을 느끼면서 처음 자세로 돌아옵니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=F29C898A9695B4198D699B4AE236E28DA6E2^outKey=V1280808c7423232834cd4304ca058cc3ad522dcc12ffce36e9204304ca058cc3ad52^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'크로스 오버 - 케이블', '케이블 크로스 오버는 대흉근 중간부와 하부 흉근을 발달시키는 운동입니다. 흉근 중앙부를 자극하여 데피니션 즉 근육의 선명도와 스트리레이션 다시 말해 근육의 줄무늬를 만드는 전문적인 운동입니다. 각도에 따라 구체적으로 세분화할 수 있으며 동작 내내 지속적인 케이블의 저항이 유지되는 장점이 있습니다. 케이블의 양쪽 손잡이를 잡고 기구 중앙에 서서 엉덩이 너비만큼 발을 벌립니다. 무릎과 팔꿈치를 약간 굽히고 상체를 앞으로 살짝 숙여 중심을 잡습니다. 케이블을 잡은 양손이 가슴과 평행선이 되도록 최대한 팔을 벌려줍니다. 겨드랑이에 힘을 주고 가슴 안쪽이 모아지게 하면서 안아주는 느낌으로 손잡이를 당겨줍니다. 가슴 근육이 스트레칭 되는 느낌을 느끼며 다시 서서히 팔을 벌리며 원위치합니다. 동작을 반복합니다.','헬스','가슴 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=35F50E6CA1E13AE236CE8880C6DFA2B1982A^outKey=V1263686c2d50ae3387000d4b5694a46b23bf9aab519f089429120d4b5694a46b23bf^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

-- 어깨 운동
insert into tb_video_board values(vb_seq.nextval,'숄더 프레스 - 머신', '머신 숄더 프레스는 전면 삼각근과 측면 삼각근을 훈련함으로써 삼각근의 근 볼륨을 키울 수 있는 복합관절 운동입니다. 머신을 이용하기 때문에 동작을 아주 정확하게 실시하는 데 도움이 되고 프리웨이트와 비교해 보다 안전하다는 장점이 있습니다. 머신에 앉아 엉덩이와 어깨를 벤치에 밀착시킵니다. 어깨너비 두 배 정도로 양손을 벌린 상태에서 손바닥이 앞을 향하도록 바를 잡습니다. 손으로 밀지 말고 어깨로 드는 느낌으로 중량을 밀어 올려줍니다. 저항을 느끼면서 서서히 바가 귀와 평행하게 될 때까지 내립니다. 동작을 반복합니다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=5BF32C0E3A4127086F1A2B4BAD29B44FDF70^outKey=V124c2b2c4ff8348cf846cf9d6590de2d43b1672ad3414bd1c1e9cf9d6590de2d43b1^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'비하인드 넥 프레스 - 스미스 머신', '스미스 머신 비하인드 넥 프레스는 바를 머리 뒤로 넘겨 전면 삼각근을 고립시키고 측면 삼각근과 후면 삼각근을 발달시키기 위해 하는 운동입니다. 고정된 머신에서 안정적으로 운동한다는 점에서 초보자에게 추천할 만한 운동입니다. 보조자의 도움을 받으면 더욱 효과적입니다. 벤치에 앉아 허리, 어깨와 바를 수직으로 맞춥니다. 어깨너비 두 배 정도로 바벨을 잡고 잠금장치를 풀어 바벨을 어깨와 수직이 되게 들어올립니다. 뒷머리를 스치듯이 귀와 평행이 될 때까지 저항을 느끼면서 바를 내립니다. 어깨를 들어올리는 느낌으로 머리 위로 바를 밀어줍니다. 동작을 반복합니다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=A6A18F4F1582721916D6220AAC8B20039869^outKey=V1255ac6271bc6e0e10ba4f3d181e67d1bf1e26f5e689f76a36c24f3d181e67d1bf1e^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'숄더 프레스 - 바벨', '바벨 숄더 프레스는 전면 삼각근과 측면 삼각근을 훈련하고 신체 전반적인 밀도와 파워를 강화하기 위한 운동입니다. 어깨, 승모근, 등 근육, 척추기립근 등을 발달시켜 몸의 균형을 유지하는 데 도움을 줍니다. 측면 삼각근의 크기를 키워 어깨가 넓어지도록 도움을 주는 중요한 운동입니다. 어깨너비 두 배 정도로 바벨을 잡습니다. 가슴 위쪽으로 바벨을 올립니다. 가슴에서부터 머리 위로 바벨을 들어올립니다. 어깨에 저항을 느끼면서 바가 귀와 평행이 될 때까지 바벨을 내립니다. 가슴에서 머리까지 바벨을 들어올리고 내리는 동작을 반복합니다. 동작을 반복합니다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=3D41CDCEC3616FF895AE08BA95D58F5A04AF^outKey=V1212cc71f489a4d05e213f89c3c85cae8cab034aca8cc15b3ab13f89c3c85cae8cab^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'비하인드 넥 프레스 - 바벨', '바가 목 뒤로 넘어가도록 동작하여 전면 삼각근만을 고립시켜 선택적으로 자극을 가하는 운동이다. 어깨 관절 운동 범위의 한계점에서 동작하기 때문에 자세의 유지는 쉬우나 그만큼 상해의 위험성이 크다. 스미스 머신 비하인드 넥 프레스에 비해 안정성은 많이 떨어지나 전후 방향의 자극에 추가적으로 저항하게 되어 근육 발달의 효과는 크다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=E04E71EBE26895EF1BAF285572F2E8ADBC70^outKey=V12671ebe226895ef1baf285572f2e8adbc70d603c638436c14cc285572f2e8adbc70^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

insert into tb_video_board values(vb_seq.nextval,'숄더 프레스 - 덤벨', '삼각근의 전면과 측면의 볼륨과 선명도를 증가시킬 수 있는 운동이다. 바벨 프레스에 비해 어깨의 완전한 가동 범위로 운동할 수 있는 장점이 있다. 전후 또는 좌우 방향의 힘이 추가되어 삼각근의 균형적인 발달을 극대화시킬 수 있다. 하지만 그만큼 컨트롤이 어려워 중량을 많이 다룰 수 없기 때문에 근육 크기 발달에 있어서는 바벨 운동이 더 효과적이다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=25FBA6789BB6312F6DDE0DFA6DEBDBCA80B1^outKey=V12961b8a7a628438fc83f0b5dbcebab16a42aaf571d850f2e4baf0b5dbcebab16a42^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'아놀드 프레스', '아놀드 슈왈제네거가 고안해낸 삼각근 운동으로 전면 삼각근의 수축으로 시작하여 측면 삼각근 수축으로 동작이 마무리되는 기능 향상 운동이라고 할 수 있다. 넓은 가동 범위로 어깨 전체를 운동할 수 있다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=CFA67703ABFEB7C3CD917E788E22A210D8B9^outKey=V1212e93b790db437f313b915120ecaa4c9cfe0cd5c7ebd7cb1cbb915120ecaa4c9cf^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

insert into tb_video_board values(vb_seq.nextval,'프런트 레이즈 - 덤벨', '삼각근의 선명도를 높일 수 있는 단관절 운동 중 전면 삼각근을 발달시키기 위한 운동이다. 프레스 동작과 달리 자극시키는 근육의 범위를 제한할 수 있고, 목표 부위의 수축에 집중할 수 있다는 장점이 있다. 낮은 저항에 반응하는 근섬유들을 자극하기 위해 저중량, 고반복으로 실시한다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=ED92642A367A49F50F3CB72C661A49DA1D0B^outKey=V1259ae82887348a8f058743ee8d8ffac934661f9eb74912a9ea2743ee8d8ffac9346^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'래터럴 레이즈 - 덤벨', '삼각근의 선명도를 높일 수 있는 단관절 운동 중 측면 삼각근을 발달시키기 위한 운동이다. 프레스 동작과 달리 자극시키는 근육의 범위를 제한할 수 있고, 목표 부위 수축에 집중할 수 있다는 장점이 있다. 낮은 저항에 반응하는 근섬유들을 자극하기 위해 저중량, 고반복으로 실시한다. 동작 간 항상 팔꿈치가 손목보다 높게 유지되어야 측면 삼각근의 동원을 최대화할 수 있다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=7D003D1B8C80E2616ABADEE11D67F75BD088^outKey=V12127ec7615e1374d58b0c4a847e6965a4ed418ddd141c40d0b40c4a847e6965a4ed^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'래터럴 레이즈 - 덤벨, 벤트 오버', '삼각근의 선명도를 높일 수 있는 단관절 운동 중 후면 삼각근을 발달시키기 위한 운동이다. 프레스 동작과 달리 자극시키는 근육의 범위를 제한할 수 있고 목표 부위 수축에 집중할 수 있다는 장점이 있다. 낮은 저항에 반응하는 근섬유들을 자극하기 위해 저중량, 고반복으로 운동한다. 견갑골(날개뼈)이 움직이지 않도록 고정한 상태에서 동작이 이루어져야 후면 삼각근을 최대로 자극할 수 있다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=419CB9754298C1346CF59B4AE236E28DA6E2^outKey=V1296130f1642d606823dde968239e66eade4f0b76a93088c52a6de968239e66eade4^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'업라이트 로우 - 바벨', '승모근과 전면 및 측면 삼각근을 발달시키는 데 좋은 운동이다. 볼륨을 키우는 프레스 계열의 운동과 선명도를 높이는 레이즈 계열 운동의 중간 타입의 운동으로 볼 수 있다. 그립을 좁게 잡으면 전면 삼각근을 강조하여 어깨와 가슴의 경계를 뚜렷하게 하는 효과가 있고, 바를 넓게 잡게 되면 측면 삼각근의 동원 비율을 좀 더 높일 수 있다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=F8687F944DF158984AF6BAF69329C2F58BAF^outKey=V12496b29c58aaefa4c9042c104a4cf3f0b5a89a1f1a65f092d7042c104a4cf3f0b5a^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'쉬러그 - 덤벨', '승모근 상부를 발달시키기 위한 운동이다. 승모근은 높은 중량에 반응하여 발달하므로 고중량을 이용해 운동하도록 한다. 어깨너비나 근육에 비해 지나치게 발달하게 되면 산 모양의 어깨를 형성하게 되므로 운동량을 조절할 필요가 있다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=0A2EF98299C817C17FBD99D13273824B0A59^outKey=V129ca8b66a628553658d625a4546defa8a1d222da58e03f04967625a4546defa8a1d^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'이지 클린', '근육을 강화함과 동시에 유산소 운동 효과까지 볼 수 있는 상체 유산소성 근력 운동이다. 누구나 쉽게 따라 할 수 있는 동작으로, 특히 상체 근력이 약한 분들에게 추천한다. 동작을 반복하여 상체 근력을 전반적으로 늘려준 다음에 상체 부위별 근육 운동을 실시하면 매우 효과적이다.','헬스','어깨 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=A901F66B9555422530C44BB787E326D1CC69^outKey=V125778620b988a76170f5b6d9c178be30775207cba5d1dbe880f5b6d9c178be30775^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

--위팔 앞(이두)
insert into tb_video_board values(vb_seq.nextval,'컬 프레스 - 덤벨','덤벨 컬과 덤벨 숄더 프레스 운동을 결합한 형태의 운동으로 상완과 어깨근육이 동원되어 이루어지는 복합 운동이다.','헬스','위팔 앞(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=9318662AEB6429EBCE258BCD56F24A4E0B38^outKey=V128a227ff4281278b0258388fad0cec37a19b0a824a70038275a8388fad0cec37a19^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'컬 - 덤벨, 인클라인','경사진 벤치에 누워서 실시하는 운동이다. 상완이두근의 위쪽 부위를 더욱 자극하고 선명도를 발달시키는 데 효과적인 운동이다.','헬스','위팔 앞(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=C378A335B1AA4B9ECE0320B7933A170CBA14^outKey=V127735cba2d47f67accaea4c9675785b57f08507cbc18f649267ea4c9675785b57f0^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'컬 - 바벨','대표적인 상완이두근 운동으로 선 자세에서 스트레이트 바 또는 이지바(ez-bar)를 이용해서 실시할 수도 있다. 상완이두근의 근육의 크기를 증가시키는 데 효과적이다.','헬스','위팔 앞(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=2FE3D84C332CB41A76DB64038139B1DA06D8^outKey=V129867197d22050fc81064baedd96bed6a22deb3d8c28abfc14964baedd96bed6a22^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'리버스 컬 - 바벨','상완이두근의 바깥쪽 부위를 발달시킬 수 있는 동작이다. 전완 신전근과 손목의 힘을 강화하는 데도 도움이 된다.','헬스','위팔 앞(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=AE875FB468BA117B302519E3EE1BB08EFD89^outKey=V125743721ce79892b98f463c2458197e492aead9d9d71f7dfea6463c2458197e492a^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'컬 - 덤벨','바벨 컬에 비해 상완이두근의 선명도를 높일 수 있는 운동이다. 선 자세와 앉은 자세(벤치, 짐볼)에서 운동이 가능하며, 그립을 잡는 방향에 따라 발현되는 근육이 달라지며, 양팔을 동시에 운동하거나 한 팔씩 번갈아가며 운동을 할 수도 있다.','헬스','위팔 앞(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=F2FAA18401F961D5ED803085F98A0721F1D2^outKey=V1270dc1ff2982b871c6281e760f310062bc742f6d335436303d181e760f310062bc7^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'해머 컬 - 덤벨','상완이두근을 발달시키는 운동이다. 벤치에 앉아서 실시하면 상완이두근을 좀 더 고립할 수 있다. 양팔을 동시에 운동하거나 팔을 번갈아가며 운동할 수 있다.','헬스','위팔 앞(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=F37A4BD1028AE76660E6BF9B52E126037E1B^outKey=V125a9982696d052f591d56e9be4b1ee33e3df30bb38a4867aba056e9be4b1ee33e3d^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'프리쳐 컬 - 바벨','상완이두근의 완전한 고립 운동을 목적으로 실시한다. 다른 상완이두근 운동에 비해 상완이두근 안쪽 중간 부분을 좀 더 자극시킬 수 있다.','헬스','위팔 앞(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=9FC756CB3953A1F2CFFF2780974B2E7A6B6B^outKey=V1292eb9c1562f048d86656c0bba4fcce1b93261de945024d75b156c0bba4fcce1b93^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'콘센트레이션 컬 - 덤벨','상완이두근을 집중적으로 발달시키는 운동이다. 천천히 실시하는 것이 매우 중요하며 상완이두근의 중간 부위를 돋보이게 하는 데 효과적이다.','헬스','위팔 앞(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=2DEE8D991DF7C1D356A5DD0041249FEABAF1^outKey=V1272ee7b3262354db4854aaac45aa20d9c99cb715bee107ad0874aaac45aa20d9c99^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'컬 - 케이블','케이블의 저항이 운동 시작 지점과 끝 지점까지 지속적으로 전해져 상완이두근의 근긴장을 유지하게 함으로서 더욱 큰 운동의 효과를 볼 수 있다. 더불어 다른 상완이두근 운동에 비해 선명도를 강화시킬 수 있다.','헬스','위팔 앞(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=DCDCE03E364285DEE13207E7A73015357CFF^outKey=V128a21061324b9d5b4ad828627e38ca11429f7d81a8460b55fd1828627e38ca11429^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'컬 - 이지 바','직선 형태의 바(bar)에 비해 손목에 가해지는 부담이 적다. 따라서 무거운 중량을 들 때에도 무리 없이 조금 더 집중할 수 있으며, 상완이두근의 크기와 근력 증진에 효과적이다.','헬스','위팔 앞(이두)(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=7FF666D77BBEA60936728DCC24F4535C9BC3^outKey=V122a2c5a8ef3e2261e489dd4d454c53821e10caba961a2eed2cb9dd4d454c53821e1^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'컬 - 밴드','상완이두근의 근력을 강화하고 크기를 키워주는 대표적인 팔 운동이다. 선 자세로 실시하기 때문에 동작 범위 전체에 걸쳐 상완이두근을 강하게 자극할 수 있다. 탄력 있는 팔 라인을 만들고 싶다면 소위 ‘팔뚝’이라고 부르는 팔 뒤쪽만이 아니라 팔 앞쪽도 함께 근력을 키워줘야 효과적이다. 밴드를 이용한 이 동작은 근력이 약한 여성들이 비교적 쉽게 탄력 있는 팔라인을 만들 수 있도록 도와준다.','헬스','위팔 앞(이두)(이두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=268D8A89C5AA5DFF5F2C1AB575D276BEF723^outKey=V127fcc3fa253517775a509a50cb4c302d8f96e8a9ea36463d5c409a50cb4c302d8f9^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

--위팔 뒤(삼두)
insert into tb_video_board values(vb_seq.nextval,'트라이셉스 익스텐션 - 바벨,라잉','팔 뒤쪽 상완삼두근의 근력을 증가시키고 삼두근의 안쪽 모양을 선명하게 만들어주는 운동이다. 상완삼두근의 전체적인 근매스 증대에 효과적이기 때문에 정확한 자세로 운동해야 한다.','헬스','위팔 뒤(삼두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=2FA8E80A7681CDDF3A7FB640F66FCC68C3BB^outKey=V129679d31432486791b4141b435665847e883f145bb4df175aab141b435665847e88^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'트라이셉스 익스텐션 - 덤벨,라잉','팔 뒤쪽 상완삼두근의 근력을 증가시키는 운동으로 삼두근의 안쪽 모양을 선명하게 만들어준다. 고중량보다는 자신에게 맞는 중량을 설정하여 정확한 자세로 반복적으로 실시한다.','헬스','위팔 뒤(삼두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=551B6C1DF48CEC9AB28CE1BA3B0B8A0CB96C^outKey=V1274a365d2b206357d48dc00affc85ae5e03b180f41baf657a7cdc00affc85ae5e03^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'트라이셉스 익스텐션 - 덤벨, 오버헤드','상완삼두근 중 특히 장두 부분을 발달시키기에 좋은 운동이다. 벤치에 앉아서도 가능하고 일어서서도 가능하며, 상체가 덤벨의 반동으로 인해 흔들리지 않도록 하는 것이 중요하다. 탄력 있는 팔을 만들고 싶어하는 여성에게 추천하는 운동이다.','헬스','위팔 뒤(삼두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=15964C8CCFD67F7DC7C266FB526A2C868B1E^outKey=V1223211208895a2566aed8bf371c689db4c70828fd3359218730d8bf371c689db4c7^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'트라이셉스 익스텐션 - 덤벨,원 암','상완삼두근 중 특히 장두 부분을 발달시키는 운동으로 중량 설정 시에는 고중량보다 저중량을 설정하여 반복횟수를 늘리는 것이 중요하다. 탄력 있는 팔을 원하는 여성에게 추천되는 운동이다. 어깨에 힘이 과도하게 들어가지 않도록 주의하여 실시한다. 벤치에 앉아서 실시하거나 또는 서서 하는 두 가지 방법 모두 가능하다.','헬스','위팔 뒤(삼두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=56E53B1FD6FC74093B5ED9F1FA455BD42406^outKey=V1297438b98f21b3eed78c2df706c10187fa3903c251f7be49499c2df706c10187fa3^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'트라이셉스 프레스 다운 - 케이블','상완삼두근 운동의 가동 범위를 최대로 활용하여 삼두근의 외측두를 발달시키는 데 효과적인 운동이다. 상완삼두근 운동 중 가장 안정적인 자세로 실시할 수 있으며 다른 상완삼두근 운동과 비교했을때 고중량에서도 안정된 자세를 유지하기에 최적의 운동이다.','헬스','위팔 뒤(삼두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=4732B518FE2E1023BC236BD75D0411BDC493^outKey=V125296329191af4d1af2693fc12a4e395eb3c07233da984e3b94693fc12a4e395eb3^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'킥 백 - 덤벨','상완삼두근의 상부, 특히 바깥쪽 부분을 발달시키는 데 효과적인 운동이다. 가벼운 중량으로 반복횟수를 늘려 정확한 자세로 근육의 긴장과 수축에 집중하는 것이 중요하다. 양손으로 실시하거나 벤치에 엎드려서 실시할 수 있으며, 보다 확실한 긴장과 수축으로 상완삼두근의 발달을 도모하기 위해서는 한 팔씩 교대로 실시하는 방법이 추천된다.','헬스','위팔 뒤(삼두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=4F083DF8594B9C148D43928155487839090E^outKey=V1265432f27dc68ef05079b09557fb349de0b60e078d2e532df8e9b09557fb349de0b^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'벤치 프레스 - 바벨, 클로즈 그립','상완삼두근의 전체적인 크기를 키우기 위한 운동이다. 다른 삼두근 운동에 비해 무거운 중량을 들 수 있는 장점이 있고, 허리와 등의 부담을 최소화시켜 서서 하는 동작보다 비교적 안정적으로 실시할 수 있다.','헬스','위팔 뒤(삼두)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=224303B14F69354A3F2532FEC71C79DAE748^outKey=V122028d7db7a1b98c1e77af05fc51be5b87ad6d888245da372c87af05fc51be5b87a^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

--아래팔 운동(전완근)
insert into tb_video_board values(vb_seq.nextval,'리스트 컬 - 바벨', '전완의 안쪽 근육을 발달시키는 운동이다. 벤치 가장자리나 무릎 위에 전완부를 고정시키고 손목의 움직임만으로 운동한다.','헬스','아래팔 운동(전완근)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=668C8619377479DFC77404CC676647DAE467^outKey=V127d2622a2b442b58f9ed96732a009e527a9b2b4bb041b4ce957d96732a009e527a9^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'리스트 컬 - 덤벨', '전완의 안쪽 근육을 발달시키는 운동이다. 벤치 가장자리나 무릎 위에 전완부를 고정시키고 손목의 움직임만으로 운동한다. 바벨로 운동할 때보다 손목의 가동 범위가 넓은 것이 장점이다.','헬스','아래팔 운동(전완근)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=5F5E0CC2581785A9775E6ADFD10800810E81^outKey=V122a2d9fcd74e4f23e800911b1a8bfa391d4b437153ed9fc123d0911b1a8bfa391d4^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'리버스 리스트 컬 - 바벨', '전완의 바깥쪽 근육을 발달시키는 운동이다. 벤치 가장자리나 무릎 위에 전완부를 고정시키고 손목의 움직임만으로 동작을 실시한다. 테니스 엘보를 예방하는 데 추천되는 운동이다.','헬스','아래팔 운동(전완근)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=C12197708679A1EF6B5DA26D7F39FD5EFBC1^outKey=V1232b20e21357b298d3f0fc3b833223888e9a489cfa676b22b860fc3b833223888e9^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'리버스 리스트 컬 - 덤벨', '전완의 바깥쪽 근육을 발달시키는 운동이다. 벤치 가장자리나 무릎 위에 전완부를 고정시키고 손목의 움직임만으로 동작을 실시한다. 테니스 엘보를 예방하는 데 추천되는 운동이다.','헬스','아래팔 운동(전완근)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=A3408BE5AE6A020730B932F11E394E911E1A^outKey=V121248fbd33d3886c44bc98dacd33ffcc762baf9b6f975c51304c98dacd33ffcc762^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'조트맨 컬 - 덤벨', '상완이두근과 전완근의 힘을 키우는 운동이다. 이두근 힘으로 덤벨을 올리고, 상완요골근의 힘을 이용해 이완한다. 이두근과 상완요골근을 동시에 운동함으로써 운동 시간을 절약할 수 있다. 부담 없이 할 수 있어 여성에게 추천되는 운동이다.','헬스','아래팔 운동(전완근)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=DDBC513279304973BE3831FF155762E00EB5^outKey=V12714b3d92642b7d897a757bd6f9e80411aa0bd5847a7880382f757bd6f9e80411aa^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'프로네이션 - 덤벨', '전완근을 돌리는 데(손바닥을 위로 가게 하는 데) 동원되는 근육의 힘을 발달시키며 특히 손목 부상 후 재활 시 많이 사용되는 운동이다. 팔꿈치의 각도를 90도로 유지하고 팔꿈치나 팔이 움직이지 않도록 해야 관련 근육의 발달을 최대화할 수 있다. 덤벨 슈피네이션과 함께 해주면 손목의 근육을 강화하는 데 한층 더 효과적이다.','헬스','아래팔 운동(전완근)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=04628D3C624C7F871A64D4A9E7DF87EBB3EB^outKey=V128f40215c28c3ee19e4675b389fa5c322ed4bc5d220b39aefdd675b389fa5c322ed^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'슈피네이션 - 덤벨', '전완근을 돌리는 데(손등을 위로 가게 하는 데) 동원되는 근육의 힘을 발달시키며 특히 손목 부상 후 재활 시 많이 사용되는 운동이다. 팔꿈치 각도를 90도로 유지하고 팔꿈치나 팔을 움직이지 않도록 해야 관련 근육의 발달을 극대화할 수 있다. 덤벨 프로네이션과 함께 해주면 손목의 근육을 강화하는 데 한층 더 효과적이다.','헬스','아래팔 운동(전완근)','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=1B99CBEC5528A60FCE5319ADF714F5FDC957^outKey=V123ad2799dc12706f37ea4327f8225649cd4bd129217cb3affc5a4327f8225649cd4^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);


--등운동
insert into tb_video_board values(vb_seq.nextval,'랫 풀 다운- 머신','광배근을 발달시키기 위한 대표적인 운동이다. 턱걸이를 하기 어려운 초보자들에게 좋은 운동이다. 팔만 이용하여 바(bar)를 잡아당기면 이두근의 참여도가 지나치게 높아지므로 동작을 시작하는 시점에서 견갑골(날개뼈)을 우선적으로 내리도록 한다.','헬스','등 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=047478A6E4FA2730D265B9B3B443633ADF9C^outKey=V122227df820ae173ac14093fd66a6df2158fefe1546ef2d28bd7093fd66a6df2158f^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'로우 - 바벨, 벤트 오버','등 전체의 근육을 발달시키는 대표적인 운동이다. 상체 전면과 후면 근육들의 협응을 통해 운동이 이루어짐으로써 상체를 보다 단단하게 만들어준다.','헬스','등 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=D4A2CDC4BC6B8F79A9A04304CA058CC3AD52^outKey=V126334ed22f4e883971ffbaa2b7e032d7ae72c9d79d308209ab3fbaa2b7e032d7ae7^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'로우 - 덤벨, 벤트 오버','가동 범위가 넓어 몸의 중심선(척추)에 가까운 등의 근육까지 발달시킬 수 있는 운동이다. 허리 근육이 약할 경우 인클라인 벤치에 엎드린 상태에서 동작을 실시하면 부담을 줄일 수 있다. 한 방향씩 실시하면 동작의 가동 범위를 넓힐 수 있고 목표 근육에 자극을 증가시킬 수 있다.','헬스','등 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=D2918AEA8E3F65040E7920D7D30B15428276^outKey=V121236395a4fd57b13bbe23dfabd5d92cf3acb368e8376f21a21e23dfabd5d92cf3a^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'로우 - 덤벨, 원 암','몸의 중심선(척추)에 가까운 등의 근육을 집중적으로 발달시키고 선명도를 증가시킬 수 있는 운동이다. 허리에 대한 부담이 적고 등 근육을 한쪽씩 집중시킬 수 있다. 한 방향씩 실시하면 동작의 가동 범위를 넓힐 수 있고 목표 근육에 자극을 증가시킬 수 있다.','헬스','등 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=68C5768CE8A37864D768094D0787416655BF^outKey=V128df6114e24f5d8bebe346ff3fb11fe605a22a03ff6a151cb8d346ff3fb11fe605a^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'로우 - 케이블, 시티드','벤트 오버 로우 동작을 앉아서 케이블을 이용해 하는 운동이다. 등 근육의 선명도를 높이기 위해서는 반복횟수를 높여 실시한다.','헬스','등 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=03D861C765527658547AD96732A009E527A9^outKey=V1252ce12ba81ee4cedaa3178fbb26b867bb06d5d98c6af7392283178fbb26b867bb0^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'로우 - 티바','등 근육의 중간부와 외측을 발달시키는 운동이다. 지지대의 위치를 조절해 손의 위치를 달리함으로써 목표로 하는 근육을 바꿀 수 있다. 지지대가 있어 허리의 부담 없이 벤트 오버 바벨 로우와 거의 동일한 효과를 얻을 수 있다.','헬스','등 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=7123810294B7B96142595D241B37B14007B5^outKey=V128ae1b5d7215fb60e0a330172fed5d63b43970130546a708981330172fed5d63b43^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'풀업 - 어시스티드','머신의 플레이트 무게만큼 체중의 부담을 줄여서 할 수 있는 턱걸이 운동이다. 등 근육을 넓게 만들어주는 운동으로서 특히 광배근의 근력이 약한 사람에게 필수적인 운동이다.','헬스','등 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=381B1528F60501F23B969A646D5027F75302^outKey=V12262b307c94ce5cd82456e96dadafe82e80e652d34aca4b9e3c56e96dadafe82e80^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'로우 - 밴드, 시티드','등의 근력을 키우고 군살을 없애는 데 효과적인 운동법이다. 밴드를 당길 때는 단순하게 팔로만 당기는 느낌이 아니라 등을 접어 준다는 느낌으로 당겨주어야 효과적이다. 헬스클럽에서 머신을 이용한 시티드 케이블 로우와 같은 운동 효과를 가져다주는데, 밴드를 이용해 언제 어디서나 간편하게 실시할 수 있다는 장점이 있다.','헬스','등 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=A5FF0F066A502A7CEDE8F5421DC9B965DB0A^outKey=V126b63842d3604f2cecedab11339240bfdb220ce019034902a03dab11339240bfdb2^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

--허리 운동
insert into tb_video_board values(vb_seq.nextval,'데드리프트 - 바벨','둔근, 대퇴 후면 근육 등 전신 근육 발달에 중요한 영향을 끼치는 운동이다. 신체의 파워를 기를 수 있고, 몸통을 둘러싸고 있는 근육들의 근력을 전반적으로 향상시킬 수 있는 운동이다.','헬스','허리 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=B510DCF1EDCEABC18F09D3B5591FFA52D207^outKey=V123a82d04129bc15d864909de1f3d56a1de78e141d3225c9a96c909de1f3d56a1de7^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'데드리프트 - 덤벨','둔근, 대퇴 후면 근육 등 전신 근육 발달에 중요한 영향을 끼치는 운동이다. 신체의 파워를 기를 수 있고, 몸통을 둘러싸고 있는 근육들의 근력을 전반적으로 향상시킬 수 있는 운동이다. 바벨 데드리프트에 비해 무거운 중량을 들기는 힘들지만 밸런스를 위한 협응성을 기를 수 있다. 특히 무거운 중량의 바벨을 사용하기 어려운 여성들에게 권장되는 운동이다.','헬스','허리 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=E2A7BCB3AD80DF3E56784F3D181E67D1BF1E^outKey=V124b952efad4f24d3b9beaeefb71a5bd30bfb47382978cc24902eaeefb71a5bd30bf^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'굿모닝 - 바벨','등과 허리를 강화시키고 둔근과 대퇴이두근을 발달시키는 데 효과적인 운동이다. 무거운 무게를 들기보다는 정확한 자세로 실시하는 것이 중요하다.','헬스','허리 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=1E27E84853F444B0D6F9DD124553F3D34FA2^outKey=V121267d828c582ef8c4684ace80e287a3c87d4ab048f9b92dce884ace80e287a3c87^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'백 익스텐션','벤치나 짐볼을 이용하거나 맨바닥에서 실시할 수 있는 운동이다. 동작을 천천히 실시하여 집중하는 것이 효과적이다. 복부 운동 다음에는 백 익스텐션을 해주는 것이 좋다.','헬스','허리 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=82D0510CE22335EEA0F1539917A6A68D3809^outKey=V12712df022de9a30639629717e6f14f6a6fa1253669a3aa3bef929717e6f14f6a6fa^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'굿모닝','상체를 숙여 인사하는 듯한 동작 때문에 ‘굿모닝’이라고 이름 붙여졌다. 맨손으로 손쉽게 따라할 수 있는 동작으로 전신 후면에 탄력적인 라인을 만들어주는 데 효과적이다. 또한 요통이 있는 경우에도 많은 도움이 되는 운동이다. 이 동작은 처음에 허리에 자극을 느끼고 이어 엉덩이, 다리 뒤쪽까지 근육이 늘어나는 것을 느끼면서 실시하는 것이 포인트다.','헬스','허리 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=748278BC5421DBE776F0ABF9117740A550A4^outKey=V127e7515d20ff7e1aef47e48f7778b839e761904d77b79ca5cb87e48f7778b839e76^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'굿모닝 - 덤벨','덤벨을 이용한 굿모닝 동작이다. 등과 허리를 강화시키고 둔근과 대퇴이두근을 발달시키는 데 효과적인 운동이다. 무거운 무게를 들기보다는 정확한 자세로 실시하는 것이 중요하다.','헬스','허리 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=450C99A70447DB363A24E4F9350BA109F6B9^outKey=V1212364495fd6e4c07462110a47682ed43d4fdcaf57da808db832110a47682ed43d4^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

--복근 운동
insert into tb_video_board values(vb_seq.nextval,'싯업','가장 일반적으로 할 수 있는 복근 운동이다. 앉았다 누웠다를 반복하는 동작이므로 복근과 다리를 들어올리는 근육을 발달시킬 수 있다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=BA39794B940470B8E2D8AD2A057C1FB91465^outKey=V127cbba952888106b118d2a0111826c28d3099036505e33f70a5d2a0111826c28d30^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'크런치','복직근 중 상부를 강화하는 운동이다. 허리 부분이 바닥에서 떨어지지 않는다는 것이 싯업과 다른 점이다. 근육을 수축시킬 때뿐만 아니라 이완될 때도 복부에 긴장을 유지하는 것이 중요하다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=928AB90213AC6C37B73A6E39FAF4C3E5B461^outKey=V123e3237dd3f624a569b198b8c5f07a0d6fb85f7b9d495c5ee1c198b8c5f07a0d6fb^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'리버스 크런치','복직근 중 하부를 단련시키는 운동이다. 크런치와 반대되는 동작으로 상체를 들어올리는 대신 다리를 들어올림으로써 하복부를 강화할 수 있다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=2DB1A5D3C08CFA15DDC5EB99D63E183ED696^outKey=V126952fa204fff27b972788e63201f8d332e959ddf9f1491361d788e63201f8d332e^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'크런치 - 케이블','체중을 이용해 부하를 주는 크런치와 달리 케이블의 저항을 이용해 상복부를 단련시킬 수 있는 운동이다. 동작 간 일정한 저항이 지속적으로 주어지는 케이블의 특성을 이용한 운동으로 동작이 끝날 때까지 복근의 힘을 유지할 수 있는 장점이 있다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=EBB4BF79D64248A3220C2EBCFB537213FC5C^outKey=V129076c697e26d3d9bdfc6c8bcbd22996d1d78e7486fa431792ec6c8bcbd22996d1d^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'레그 레이즈','하복부를 단련하는 대표적인 운동이다. 다리를 들어올리는 근육의 힘을 이용하여 동작하는 운동이다. 복근의 힘이 약한 상태에서 운동하게 되면 허리가 지나치게 바닥에서 떨어지게 되어 무리가 될 수 있으므로 사전에 복근의 힘을 키워 놓은 상태에서 실시하는 것이 바람직하다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=18C6E3B20858CDD6CA9AD66DCF3FD802F944^outKey=V12222ce06f84ab47033dd9da3dc67eb9f2d6b1b0f5ad8d0f03fed9da3dc67eb9f2d6^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'레그 레이즈 - 서포티드','행잉 레그 레이즈와 유사한 동작이나 상체가 패드에 고정된 상태에서 복부의 심부 근육에 집중적인 자극을 주는 운동이다. 누워서 실시하는 리버스 크런치를 수직으로 공중에 뜬 상태에서 실시하는 것으로 이해하면 된다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=4B622E09C388A70F0404D5891A08AA7F1536^outKey=V125e5df2568f5cfb66aa466fa353a44d68db2edd68896ca51e5d466fa353a44d68db^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'레그 레이즈 - 행잉','하복부의 단련을 위해 실시하는 강도가 높은 운동 방법 중 하나이다. 몸 전체가 매달려 있는 상태이기 때문에 몸의 균형을 유지하는 것이 중요하다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=1453AC700B87FCA025670F9F794B57B559E6^outKey=V1252ac929f20380533ccad3353e1c88b77321f8a3c25e623fcccad3353e1c88b7732^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'V업','상체와 하체를 동시에 들어올리는 동작으로 균형 감각이 요구된다. 짧은 시간 안에 상복부와 하복부를 동시에 발달시키기에 효과적인 운동이다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=A63D5815F1D20998A191BB16F34AC9175D92^outKey=V121281434eab6af077fd4e921a05ee4af55ad14e88e22d5ce75e4e921a05ee4af55a^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'니업 - 시티드','브이업 동작에서 상체 동작을 배제한 것으로 이해하면 된다. 벤치에 앉아서 실시하는 동작으로 팔로 상체를 지지한 상태에서 다리를 가슴 쪽으로 끌어당겨 하복부를 발달시킨다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=3395533CFC607CEE6324B542E11F54CF4A23^outKey=V1288f24b2921b82f024283f8e684714dbb7cf830cc0407d551b683f8e684714dbb7c^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'오블리크 크런치','내복사근과 외복사근을 발달시킬 수 있는 운동이다. 발을 붙이고 무릎을 90도 정도 구부린 기본적인 크런치 자세에서 무릎을 한 방향으로 넘겨 바닥에 붙인 상태로 크런치와 동일한 방법으로 실시한다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=6DC9484D90835EBE75AB4AAAC45AA20D9C99^outKey=V1295972a0ef21ecefe2a7e788e22a210d8b945214708d0c20ef37e788e22a210d8b9^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'사이드 벤드 - 덤벨','내복사근과 외복사근을 발달시킬 수 있는 운동이다. 한쪽 손에 덤벨을 들고 실시하며, 덤벨을 든 쪽으로 상체를 구부렸다가 펴는 동작으로 되어 있다. 여성에게 추천되는 운동이다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=08DBAA8D2DD68A991E53675B389FA5C322ED^outKey=V1212cc32617a54dc4d8b56c6a3282113cd28cb2aaee2d475f94556c6a3282113cd28^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'리버스 트렁크 트위스트','내·외복사근을 발달시키는 운동이다. 다리를 내릴 때 균형을 잡기 위한 근육들이 동원되며, 운동 강도가 매우 높은 운동으로서 복근이 어느 정도 강해졌을 때 실시하는 것이 효율적이다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=5BC603C06F33F3ABD8F7ACD8EEF98134C5E2^outKey=V128de3fb7323d4c781bf43e26bf95345df21158101681f3da36943e26bf95345df21^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'크로스 크런치','상복부와 외복사근을 동시에 발달시키기 위한 운동이다. 기본적인 크런치 자세에서 시작하여 한쪽 어깨가 대각선 방향의 무릎을 향하도록 복근을 수축시킨다. 이완 시 동작 범위를 어깨가 바닥에 닿기 전까지로 제한하는 것이 옆구리에 긴장감을 계속 유지하여 최적의 효과를 볼 수 있다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=565808581ED825FB34E366803B05BA9ECC15^outKey=V1277ad2cf2cd0db4554b57aa820458275cd7c722d60b9dd2021257aa820458275cd7^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'러시안 트위스트','내·외복사근을 발달시키는 운동이다. 상체를 뒤로 기울여 복직근을 수축한 상태에서 어깨가 좌우로 돌아갈 수 있도록 동작한다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=005C98B0ECFF70B4B8C54A1F2B97A848C258^outKey=V125d5c32e81214b28590ba6b3d1a47100729e654f1a08d5c0fd7ba6b3d1a47100729^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'사이드 크런치','외복사근을 발달시킬 수 있는 운동이다. 복사근 중 외복사근에만 선택적으로 집중할 수 있는 운동이다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=B3951DE54BF6692302A712F4191FBB87FA56^outKey=V1282949dfc29149d1b735508428f425ce66c2d05e37950b07f255508428f425ce66c^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'사이드 벤드 - 밴드','외복사근과 내복사근을 강화하는 코어 근육 운동이다. 덤벨 사이드 벤드와 자세는 같지만, 밴드를 이용하기 때문에 힘을 주는 방향이나 각도를 자유롭게 조절할 수 있고 운동강도도 잡아당기는 가동범위에 따라 직접 조절할 수 있다는 장점이 있다. 옆구리 군살을 제거하고 허리 곡선을 잘록하게 만드는 데 효과적인 동작으로 특히 여성들에게 추천하며, 무게의 부담이 없어서 노약자들에게도 권장한다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=B90EAAA51E2FAA6FDB92C475946AE30A0D89^outKey=V125d1d726652cab0ad075d241b37b14007b550a63ea6d3e3db455d241b37b14007b5^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'양손 다리 모으기','복부를 중심으로 팔다리를 활발히 움직임으로써 여러 근육들을 동시에 사용하는 동작으로 칼로리 소모에 아주 효과적이다. 특히 복부의 지방을 빨리 빼고 싶다면 복부 근력 운동 후에 이 동작을 실시해주면 효과 만점이다. 운동할 시간이 없는 경우에 간편 다이어트 운동으로 추천한다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=6E4807F454C97B0ED4061189C90436F3A626^outKey=V123112807b9c50a87d372657b04d1f7193fbc39c5198028e84de2657b04d1f7193fb^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'엎드려 점프','하복부 지방을 태우고 근력을 키우는 데 효과적인 유산소성 근력 운동이다. 엎드려 점프는 상체를 고정시킨 자세에서 양쪽 다리를 벌려 앞뒤로 뛰는 동작으로 아랫배에 지방이 많은 여성들에게 추천한다. 대표적인 하복부 운동 중 하나인 레그 레이즈 동작을 실시한 다음에 이어서 진행하면 더욱 만족스러운 효과를 얻을 수 있다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=F025012E3B5D79440EE2B1B943DB31A9A2C7^outKey=V1266052425c9d0c6ea53880ae4db2f78ed65a635a112b48ffe61880ae4db2f78ed65^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'다리 교차 뛰기','하체 근력을 키우고 칼로리 소모도 높여주는 유산소성 근력 운동이다. 엎드린 상태로 양발을 교차하는 동작은 복부 근육에 자극을 주어 뱃살을 빼는 데도 큰 도움을 준다.','헬스','복근 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=89F3E6409EB48BA9799FC5F813DE2C5F8848^outKey=V1237921717c7ffbd327cf363a22434702f1e80578c26c12802e9f363a22434702f1e^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

--엉덩이 운동
insert into tb_video_board values(vb_seq.nextval,'덩키 킥','엉덩이를 힙업하고 탄력 있게 만드는 데 탁월한 동작이다. 스쿼트, 런지 등 엉덩이 큰 근육을 강화하는 운동 다음에 실시하면 효과를 배가시킬 수 있다.','헬스','엉덩이 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=E0F796027A982BF9134A062E833F97B7DA2E^outKey=V12129bcf4c6fe8bc49a6249f3de3ce0953e933f2eb5d3ea98ba6249f3de3ce0953e9^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'브릿지','엉덩이 근육을 발달시켜 힙업에 효과적인 동작이다. 등 근육 발달에도 도움이 된다. 특히 요통이 있거나 장시간 책상에 앉아 있는 경우에 수시로 이 동작을 반복해주면 뭉친 허리 근육을 시원하게 풀 수 있다.','헬스','엉덩이 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=609E153EDF2AE76767A16AA1942D6ADBD386^outKey=V12570ba2f1138edc1dec0e798e7b382bb0e83a818b5cc2d9e9c90e798e7b382bb0e8^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'사이드 힙 킥','측면 엉덩이 근육인 중둔근, 소둔근을 발달시켜 군살 없는 힙라인을 만들어준다. 다리를 높이 올릴수록 옆구리의 근육들이 더 강하게 자극되어 보디라인의 탄력을 향상시킬 수 있다.','헬스','엉덩이 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=BF5DA628EE8D96C398A5463C2458197E492A^outKey=V1247632281ab97ffd1235508428f425ce66cdfeafcca6f0798405508428f425ce66c^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'멀티힙- 밴드','밴드를 이용하여 허벅지 바깥쪽 근육과 엉덩이 근육을 강화하는 운동법이다. 탄력적이고 볼륨 있는 엉덩이 라인을 살리는 데 효과적이다. 특히 골반관절을 튼튼하게 만들어주어 여성들에게 추천된다.','헬스','엉덩이 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=A29ACBD6719F604FB24B788E63201F8D332E^outKey=V123e12993871e63c8394a20a5a63669510402b53a232fa0e6daba20a5a6366951040^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'볼 워킹','짐볼 운동은 다른 기구를 사용했을 때보다 안전하게 운동할 수 있는 장점이 있다. 이 동작은 짐볼을 이용한 후면 근육 운동으로 등, 엉덩이, 허벅지 근육들을 자극하여 탄력적인 엉덩이와 허벅지 라인을 가꿔준다. 음악에 맞춰 실시하면 더욱 재미있게 운동할 수 있다.','헬스','엉덩이 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=979FAC721CE58FFBC6434DA3D98F08673DD3^outKey=V128e5cdee3215e1ec7e16706a694ecc318e5c3bcd2402eb246066706a694ecc318e5^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

--허벅지 앞 운동
insert into tb_video_board values(vb_seq.nextval,'스쿼트 - 바벨','하체 운동 중 가장 기본이 되는 운동이다. 운동 전에 체중을 이용한 스쿼트 동작으로 자세를 정확히 인지한 후 실시하는 것이 좋다. 등 하부, 엉덩이, 허벅지 전체, 종아리 부위의 근육을 협응적으로 훈련함으로써 에너지 소모가 가장 많은 대표적인 하체 운동이다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=E303B587CF6BB77100C6B5F82999A5DE53C1^outKey=V1271b13d121e500d0e8d928155487839090ee3269c0d0bafd5e1928155487839090e^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'스쿼트 - 덤벨','바벨 스쿼트와 함께 대퇴사두근과 둔근의 근력과 크기 증가를 위한 운동이다. 바벨 스쿼트에 비해 균형을 잡기 쉬운 운동으로 등을 곧게 편 상태에서 전방을 주시하면서 의자에 앉듯이 천천히 몸을 낮추면서 실시하면 더욱 균형감 있게 실시할 수 있다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=8FDA6E715AF90A9E340339952609AE5BD81B^outKey=V126db213292a1aea1631f6cff91b91f7aaeca5e6cb192903340ef6cff91b91f7aaec^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'스쿼트 - 스미스 머신','바벨 스쿼트 운동에 비해 고립된 운동으로 대퇴부와 둔부 크기를 증가시키기 위한 운동이다. 무릎과 등 하부에 부담을 줄이고 대퇴를 강도 높게 자극할 수 있다. 초보자들이 쉽고 안전하게 할 수 있는 장점이 있지만 등과 허리에 통증이 있는 경우엔 레그 프레스 운동으로 대체해서 실시하는 것이 바람직하다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=C3917D3464358E0F34D520D7D30B15428276^outKey=V127dc4e482b8b86617fe185d84c55718ae3e63c633eebe5902b2185d84c55718ae3e^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'레그 프레스','대퇴사두근과 둔근을 강화시켜주는 대표적이고 필수적인 하체 운동이다. 초보자가 실시하기에 가장 적당한 하체 운동이며 스쿼트에 비해 허리에 가해지는 부하가 적어 비교적 무거운 무게로 운동을 할 수 있는 장점이 있다. 또한 발판의 지지 위치에 변화를 줄 경우 좀 더 집중적인 근력 향상을 꾀할 수 있다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=129E69E1C78E97E22262832982540E6962DA^outKey=V1212ae1a841503d825ceee89a3859039b1054c95cd096bad90d9ee89a3859039b105^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'런지 - 바벨','대퇴 전면과 둔근을 발달시키기 위한 운동이다. 바벨 대신 덤벨을 이용해 실시할 수도 있다. 또한 다리의 위치 변화를 통해 walking lunge, side lunge등 다양하게 실시할 수 있으며 런지운동 초기엔 다리를 앞으로 내민 상태에서 지속적으로 up/down을 실시하여 균형감과 근육의 동원능력을 숙달시키는 것이 필요하다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=28B42ABC6021972B972598E5F0D92FB69BDC^outKey=V124865208e36f12789688a9a757270f0af7b390629f3560ac8ec8a9a757270f0af7b^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'레그 익스텐션','허벅지 전면 근육을 발달시키는 운동이다. 여성의 경우, 적당한 무게로 횟수를 늘려 실시하면 탄력 있는 허벅지를 만드는 데 효과적이다. 또한 두 다리의 근력 수준 차이를 극복하기 위해 한 발씩 실시해도 좋은 운동이 될 수 있다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=A6152D777863734B9B5EBF3D908AD1EE3C84^outKey=V125fbb72a96eae5d874fded0b06bbc892e14448161645b6152f6ded0b06bbc892e14^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'스텝업 - 덤벨','서킷 트레이닝(circuit training)에 사용하기에 적합한 운동으로서 민첩성 및 운동 수행 능력을 향상시킬 수 있다. 유산소 운동과 대퇴의 자극을 동시에 유도할 수 있다는 장점이 있다. 초보자의 경우 체중을 이용한 스텝업 동작을 지속적으로 반복한 후 실시한다. 특히 허리 통증으로 인해 바벨 또는 덤벨 스쿼트나 데드리프트를 실시하지 못하는 경우 대체할 수 있는 하체 운동이다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=7F5AA74FD1AB751A0E7284CDC3890E29C76B^outKey=V1286686a0b2ba65b4109c10964006b52b35c2d31d56fb230cf29c10964006b52b35c^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'사이드 런지','허벅지를 비롯한 다리 근육을 발달시키는 동시에 유산소 운동의 효과도 볼 수 있는 운동이다. 심박수를 증가시켜 심폐지구력 및 다리의 근지구력을 키우는 데 효과적이다. 하체 비만인 경우, 횟수를 늘려 실시하면, 다리의 지방을 빠른 시간 내에 없앨 수 있다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=FFC7E771B5004189DF122780974B2E7A6B6B^outKey=V1226206c219e96161171d8d53f1e437babc0351f40da1bed4c8fd8d53f1e437babc0^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'점프 스쿼트','하체의 체지방은 연소하고 탄력을 향상시키는 데 효과적인 운동이다. 자기 체중을 갖고 하는 근력 운동으로 하체 근력이 어느 정도 있는 경우에는 이 동작 하나로도 강한 운동 효과를 얻을 수 있다. 지속적으로 실시하면 탄력 있는 다리 라인을 만들 수 있다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=81B339891F4E87F950A10E798E7B382BB0E8^outKey=V126b1e7f254f238ef9d956d4dc4d275e34f99cd64c412a7b25d956d4dc4d275e34f9^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'와이드 스쿼트','다리, 엉덩이, 허벅지 안쪽을 다양하게 자극하는 스쿼트이다. 이 동작은 특히 여성들에게 추천하는 운동으로 허벅지 안쪽과 엉덩이 옆 라인을 탄력적으로 다듬는 데 효과적이다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=AF98BDEEAD9955915D0F0A6DD4AD13278429^outKey=V121220effa6dc2bd93e5d3f93ecf7ae6a1c7d020c553eaf16f55d3f93ecf7ae6a1c7^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'런지','대표적인 다리 운동 중 하나로 허벅지와 엉덩이에 탄력을 주며 하체 근력을 강화하는 운동이다. 자신의 체중을 이용해 실시하더라도 충분한 자극을 느낄 수 있지만, 더 강한 운동 효과를 원한다면 덤벨이나 바벨을 이용하여 천천히 운동하는 것이 좋다.','헬스','허벅지 앞 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=DA32C37D3E8213BA245DE59CEB5A0F33F6BE^outKey=V1293c76d2e6217fd5ca2fb61069c631327d184296a3d8422a42efb61069c631327d1^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
 
-- 허벅지 뒤 운동
insert into tb_video_board values(vb_seq.nextval,'레그컬 - 스탠딩','허벅지 뒤쪽 슬굴곡근을 발달시키기 위한 운동이다. 한 번에 한쪽 하체만 훈련이 가능하여 양쪽 다리의 균형을 맞출 수 있는 장점이 있다. 허벅지를 패드에 대고 움직이지 않게 고정시켜주면 더욱 효과적으로 실시할 수 있다.','헬스','허벅지 뒤 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=AD1CE743C7AE496B88E71B6811099841C5E0^outKey=V1273222982a231a917ac216fddaa4e7ce47823a7195df65df828216fddaa4e7ce478^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'레그컬 - 라잉','대퇴후면의 슬굴곡근을 발달시키기 위한 운동이다. 스탠딩 레그 컬보다 많은 중량을 들 수 있는 것이 장점으로, 하체 근력이 약한 사람에게 필수적인 운동이다. 단순관절 운동인 만큼 정확한 자세를 유지하는 것이 중요하다.','헬스','허벅지 뒤 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=11E758A8B2C66AF2386D43A3B8D82C4C0D5D^outKey=V122f2070b0149a8bf82f75e039b2df855a6197fd50b36ca289b875e039b2df855a61^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'멀티 힙','힙 주변 근육을 다양하게 운동할 수 있는 최적의 장비이다. 다리를 앞뒤로 또는 좌우로 운동하면 하복부와 힙 주변을 탄력 있게 만들 수 있는 효과적인 운동이다. 특히 여성에게 추천되는 운동이다.','헬스','허벅지 뒤 운동','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=EDBF2FBA2E063BFEB78559498E28E4722CA9^outKey=V1292655bb80234b1d59799759bc5ed28566cc3aef748f103b0bc99759bc5ed28566c^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

--종아리 운동
insert into tb_video_board values(vb_seq.nextval,'카프레이즈 - 스탠팅','가장 기본이 되는 종아리 운동으로 뒤꿈치를 들어 체중을 올리는 역할을 하는 근육을 발달시킨다. 지구력이 높은 근육의 특성상 고반복이 필수적이다. 스미스 머신을 이용해 실시할 수도 있다.','헬스','종아리','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=F7B52B93E55DDE5886CC1D496879EB567A69^outKey=V12292e0f2aad58729dd65d241b37b14007b597cbed8c0a4e593e5d241b37b14007b5^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'카프레이즈 - 시티드','가자미근이라고 하는 종아리의 심부근육을 발달시키기 위한 운동이다. 비복근의 참여를 줄이기 위해 앉아서 실시하며 여성들에게 추천된다.','헬스','종아리','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=D1EA4778CB010D224508EAEEFB71A5BD30BF^outKey=V123da2e00a3135d4eaeb2bb390108ba95d9b5e98eb4ae44ae1862bb390108ba95d9b^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'카프레이즈 - 싱글 레그','약한 쪽 종아리를 운동함으로써 양쪽 발의 균형을 맞추는 데 유용한 운동이다. 장소에 구애 받지 않고 어디서나 쉽게 할 수 있다는 장점이 있다.','헬스','종아리','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=DD8C1DF3E7B7AD31333404CC676647DAE467^outKey=V1212bbbb649de919f5e7f82aaab48539591afb218bfa5ad44b7ff82aaab48539591a^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);
insert into tb_video_board values(vb_seq.nextval,'카프레이즈 - 머신','레그 프레스 머신에서 실시하는 종아리 운동이다. 스탠딩 자세에서 하는 운동과 달리 허리의 추가적인 스트레스를 피할 수 있다는 장점이 있다. 종아리 근육에 대한 집중을 더욱 느낄 수 있고, 자신의 몸무게만큼 고중량으로 실시할 수 있다.','헬스','종아리','http://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=1255934BC7773B6B927EBA51898851D750DA^outKey=V127f754232dc7ea041a47e48f7778b839e76aa9da2ab5e7c22977e48f7778b839e76^controlBarMovable=true^jsCallable=true^isAutoPlay=false^skinName=tvcast_white',default);

-- TB_GYM 샘플 데이터
INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE) 
VALUES (gym_seq.nextval, '우노 휘트니스클럽', NULL, NULL, 'AM 06:00', '02-790-6776', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 보광동 260-8번지 지상3층', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE) 
VALUES (gym_seq.nextval, 'AK운동맞춤센터', NULL, NULL, 'AM 06:00', '02-777-3579', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 용산동2가 23번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE) 
VALUES (gym_seq.nextval, '웰니스짐', NULL, NULL, 'AM 06:00', '02-795-9966', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 이태원동 226-3번지 지하1층', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE) 
VALUES (gym_seq.nextval, '그랜드 남여헬스클럽', NULL, NULL, 'AM 06:00', '02-795-5511', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 보광동 216-96번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE) 
VALUES (gym_seq.nextval, '동국 스포츠', NULL, NULL, 'AM 06:00', '02-715-5588', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 원효로4가 142-1번지 2.3층', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE) 
VALUES (gym_seq.nextval, '한강헬스', NULL, NULL, 'AM 06:00', '02-795-9333', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 이촌동 300-15번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '그램 휘트니스', NULL, NULL, 'AM 06:00', '02-794-6010', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 한남동 657-201번지', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'J헬스클럽', NULL, NULL, 'AM 06:00', '02-796-5176', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 한남동 631-5번지 4층', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'B AND B 휘트니스', NULL, NULL, 'AM 06:00', '02-794-5600', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 이태원동 21-1번지 태광빌딩 207호', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '스카이 휘트니스클럽', NULL, NULL, 'AM 06:00', '02-797-3993', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 남영동 127-1번지 3층', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '상떼휘트니스', NULL, NULL, 'AM 06:00', '02-778-7496', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 동자동 22-3번지 지하1층', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '해밀톤 휘트니스센터', NULL, NULL, 'AM 06:00', '02-6393-1375', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 이태원동 116-1번지 지하2층', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '드래곤힐스파휘트니스클럽', NULL, NULL, 'AM 06:00', '02-792-0002', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 한강로3가 40-713번지 4층', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '엠파이어휘트니스', NULL, NULL, 'AM 06:00', '02)705-0039', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 한강로3가 16-85번지 GS한강 에클라트(지하1층)', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '한남레포츠종합타운', NULL, NULL, 'AM 06:00', '02)793-6394', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 한남동 96-3번지 신성미소시티 지하1층', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '태영헬스', NULL, NULL, 'AM 06:00', '02-703-6377', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 청파동3가 111-9번지 캠퍼스프라자 4층', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '몽키짐휘트니스', NULL, NULL, 'AM 06:00', '02-3215-8200', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 한강로2가 2-8번지', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '와이짐', NULL, NULL, 'AM 06:00', '02-797-7304', '010-1234-5678', NULL, '헬스장', NULL, '서울특별시 용산구 이촌동 300-18번지 유일빌딩 지하1층', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '킴스짐헬스크럽', NULL, NULL, 'AM 06:00', '02-749-9995', '010-1234-5678', NULL, '헬스장', NULL, '서울특별시 용산구 이태원동 124-3번지 지하1층', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'Studio-X-Fitness', NULL, NULL, 'AM 06:00', '02-123-4567', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 이태원동 651번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'With Gym', NULL, NULL, 'AM 06:00', '02-749-9690', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 한남동 653-95번지 2층', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '센티넬 크로스핏 한남', NULL, NULL, 'AM 06:00', '02-6431-0802', '010-1234-5678', NULL, '크로스핏', NULL, '서울특별시 용산구 한남동 635-1번지 지하1층', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '동서 골프and휘트니스', NULL, NULL, 'AM 06:00', '02-714-2011', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 청파동1가 180-24번지', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '위너핏PT스튜디오', NULL, NULL, 'AM 06:00', '02-792-1031', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 남영동 61-4번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '스포짐', NULL, NULL, 'AM 06:00', '02-701-0011', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 문배동 40-31번지 ', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '프라이빗 웰니스', NULL, NULL, 'AM 06:00', '02-123-4567', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 한남동 740-1번지 ', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'H 퍼스널트레이닝', NULL, NULL, 'AM 06:00', '02-123-4567', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 한남동 79-3번지 ', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '반트짐', NULL, NULL, 'AM 06:00', '02-123-4567', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 이촌동 302-52번지 ', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'Fit In Cool', NULL, NULL, 'AM 06:00', '02-123-4567', '010-2662-0828', NULL, '피트니스', NULL, '서울특별시 용산구 한남동 657-45번지', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '팀레드', NULL, NULL, 'AM 06:00', '02-703-8378', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 원효로1가 39-6번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'wunderbar GYM', NULL, NULL, 'AM 06:00', '02-790-7175', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 이촌동 300-27번지 307호', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '리복 크로스핏 센티널 원', NULL, NULL, 'AM 06:00', '02-790-0801', '010-1234-5678', NULL, '크로스핏', NULL, '서울특별시 용산구 한남동 76-42번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'Fit Club', null, null, 'AM 06:00', '02-123-4567', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 이태원동 646-204번지', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '유(U)PT', NULL, NULL, 'AM 06:00', '02-796-7978', '010-1234-5678', NULL, '피트니스', NULL, '서울특별시 용산구 한남동 261-6번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'Beautiful Evolution', NULL, NULL, 'AM 06:00', '02-123-4567', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 보광동 216-88번지', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '에스퍼스널트레이닝', NULL, NULL, 'AM 06:00', '02-797-0324', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 용산동5가 24-1번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, 'PENTACLE', NULL, NULL, 'AM 06:00', '02-727-5000', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 동자동 12번지', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '레브트레이닝', NULL, NULL, 'AM 06:00', '02-796-9600', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 한남동 1-307번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '스포벡', NULL, NULL, 'AM 06:00', '02-123-4567', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 갈월동 101-45번지', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '와가짐', NULL, NULL, 'AM 06:00', '070-4794-6591', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 이촌동 300-301번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '시크모어 웰니스 스튜디오', NULL, NULL, 'AM 06:00', '02-792-1710', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 한남동 722-3번지 은성빌딩 2층', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '패스트앤슬로우 컨설팅그룹', NULL, NULL, 'AM 06:00', '02-123-4567', '010-8664-1340', NULL, '헬스', NULL, '서울특별시 용산구 갈월동 69-109번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '서울체대입시', NULL, NULL, 'AM 06:00', '02-797-6530', '010-1234-5678', NULL, '체대입시', NULL, '서울특별시 용산구 남영동 17-1번지', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '칼라퍼스널트레이닝', NULL, NULL, 'AM 06:00', '02-711-4013', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 원효로1가 39-10번지', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '랜스앤제이 퍼스널 트레이닝 스튜디오', NULL, NULL, 'AM 06:00', '02-749-7498', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 한남동 258번지 ', 2, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '유즈웰(USEWELL)', NULL, NULL, 'AM 06:00', '02-749-2260', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 한남동 72-1번지 ', 3, NULL, DEFAULT);

INSERT INTO TB_GYM (GYM_NO, GYM_NAME, ORIGINAL_IMAGE, RENAME_IMAGE, OP_TIME, TEL, PHONE, PRICE, CATEGORY, DESCRIPTION, LOCATION, USER_NO, DELETE_DATE, APPROVAL_STATE)
VALUES (gym_seq.nextval, '제이 스튜디오', NULL, NULL, 'AM 06:00', '02-792-8281', '010-1234-5678', NULL, '헬스', NULL, '서울특별시 용산구 보광동 217-21번지 ', 2, NULL, DEFAULT);

COMMIT;

-- 회원탈퇴 프로시저 생성 --
PROMPT 회원탈퇴 프로시저 생성...
CREATE OR REPLACE PROCEDURE DEL_USER_PROCEDURE
IS
BEGIN
  DELETE FROM TB_USER 
  WHERE  to_char(DELETE_DATE,'rr/MM/dd')=to_char(sysdate, 'rr/MM/dd');
  COMMIT;
END;
/

-- 회원탈퇴 잡 스케줄러 실행 -- 
PROMPT 회원탈퇴 잡 스케줄러 실행....
DECLARE
   J_NO NUMBER;
BEGIN
   DBMS_JOB.SUBMIT (
      J_NO,
      'DEL_USER_PROCEDURE;',
      SYSDATE,
      'TRUNC(SYSDATE + 1) + 5 / 24',
      FALSE
   );
END;
/
  
COMMIT;

PROMPT FITNESSGORUND 자료입력 끝...