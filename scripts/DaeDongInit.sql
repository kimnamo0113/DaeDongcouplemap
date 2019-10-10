-- 댓글
DROP TABLE IF EXISTS `daedong`.`Reply` RESTRICT;

-- 회원
DROP TABLE IF EXISTS `daedong`.`Guest` RESTRICT;

-- 게시판
DROP TABLE IF EXISTS `daedong`.`Board` RESTRICT;

-- 관리자
DROP TABLE IF EXISTS `daedong`.`Manager` RESTRICT;

-- 친구목록
DROP TABLE IF EXISTS `daedong`.`Friend` RESTRICT;

-- 메세지
DROP TABLE IF EXISTS `daedong`.`Message` RESTRICT;

-- 채팅방
DROP TABLE IF EXISTS `daedong`.`Chating` RESTRICT;

-- 게시판내용
DROP TABLE IF EXISTS `daedong`.`Content` RESTRICT;

-- 좋아요
DROP TABLE IF EXISTS `daedong`.`Like` RESTRICT;

-- 대동연애지도
DROP SCHEMA IF EXISTS `daedong`;

-- 대동연애지도
CREATE SCHEMA `daedong`;

-- 댓글
CREATE TABLE `daedong`.`Reply` (
	`r_no`        INT      NOT NULL COMMENT '덧글번호', -- 덧글번호
	`b_no`        INT      NULL     COMMENT '게시판번호', -- 게시판번호
	`g_no`        INT      NULL     COMMENT '손님번호', -- 손님번호
	`m_no`        INT      NULL     COMMENT '관리자번호', -- 관리자번호
	`r_content`   TEXT     NULL     COMMENT '내용', -- 내용
	`r_writetime` DATETIME NULL     DEFAULT now() COMMENT '작성일', -- 작성일
	`r_delete`    BOOLEAN  NULL     COMMENT '삭제여부', -- 삭제여부
	`r_good`      INT      NULL     COMMENT '좋아요', -- 좋아요
	`r_read`      INT(1)   NULL     DEFAULT 0 COMMENT '읽음' -- 읽음
)
COMMENT '댓글';

-- 댓글
ALTER TABLE `daedong`.`Reply`
	ADD CONSTRAINT `PK_Reply` -- 댓글 기본키
		PRIMARY KEY (
			`r_no` -- 덧글번호
		);

ALTER TABLE `daedong`.`Reply`
	MODIFY COLUMN `r_no` INT NOT NULL AUTO_INCREMENT COMMENT '덧글번호';

-- 회원
CREATE TABLE `daedong`.`Guest` (
	`g_no`            INT          NOT NULL COMMENT '회원번호', -- 회원번호
	`g_id`            VARCHAR(30)  NULL     COMMENT '아이디', -- 아이디
	`g_password`      VARCHAR(50)  NULL     COMMENT '비밀번호', -- 비밀번호
	`g_name`          VARCHAR(10)  NULL     COMMENT '이름', -- 이름
	`g_tel`           VARCHAR(15)  NULL     COMMENT '연락처', -- 연락처
	`g_email`         VARCHAR(50)  NULL     COMMENT '이메일', -- 이메일
	`g_birth`         DATE         NULL     COMMENT '생일', -- 생일
	`g_gender`        BOOLEAN      NULL     COMMENT '성별', -- 성별
	`g_join`          DATETIME     NULL     DEFAULT now() COMMENT '가입일', -- 가입일
	`g_memo`          VARCHAR(100) NULL     COMMENT '메모', -- 메모
	`g_delete`        BOOLEAN      NULL     DEFAULT false COMMENT '탈퇴여부', -- 탈퇴여부
	`g_addr`          VARCHAR(10)  NULL     COMMENT '우편번호', -- 우편번호
	`g_addr2`         VARCHAR(50)  NULL     COMMENT '주소', -- 주소
	`g_addr3`         VARCHAR(50)  NULL     COMMENT '상세주소', -- 상세주소
	`g_image`         VARCHAR(200) NULL     COMMENT '사진', -- 사진
	`g_certification` VARCHAR(20)  NULL     COMMENT '회원인증' -- 회원인증
)
COMMENT '회원';

-- 회원
ALTER TABLE `daedong`.`Guest`
	ADD CONSTRAINT `PK_Guest` -- 회원 기본키
		PRIMARY KEY (
			`g_no` -- 회원번호
		);

ALTER TABLE `daedong`.`Guest`
	MODIFY COLUMN `g_no` INT NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 게시판
CREATE TABLE `daedong`.`Board` (
	`b_no`        INT          NOT NULL COMMENT '게시판번호', -- 게시판번호
	`g_no`        INT          NULL     COMMENT '고객번호', -- 고객번호
	`m_no`        INT          NULL     COMMENT '매니저번호', -- 매니저번호
	`b_title`     VARCHAR(50)  NULL     COMMENT '제목', -- 제목
	`b_place`     VARCHAR(100) NULL     COMMENT '장소', -- 장소
	`b_hash`      VARCHAR(200) NULL     COMMENT '해시태그', -- 해시태그
	`b_contents`  TEXT         NULL     COMMENT '내용', -- 내용
	`b_writetime` DATETIME     NULL     DEFAULT now() COMMENT '작성일', -- 작성일
	`b_delete`    BOOLEAN      NULL     COMMENT '삭제여부', -- 삭제여부
	`b_flat`      INT          NULL     COMMENT '구분', -- 구분
	`b_good`      INT          NULL     COMMENT '좋아요' -- 좋아요
)
COMMENT '게시판';

-- 게시판
ALTER TABLE `daedong`.`Board`
	ADD CONSTRAINT `PK_Board` -- 게시판 기본키
		PRIMARY KEY (
			`b_no` -- 게시판번호
		);

ALTER TABLE `daedong`.`Board`
	MODIFY COLUMN `b_no` INT NOT NULL AUTO_INCREMENT COMMENT '게시판번호';

-- 관리자
CREATE TABLE `daedong`.`Manager` (
	`m_no`       INT         NOT NULL COMMENT '번호', -- 번호
	`m_id`       VARCHAR(30) NULL     COMMENT '아이디', -- 아이디
	`m_password` VARCHAR(40) NULL     COMMENT '비밀번호', -- 비밀번호
	`m_name`     VARCHAR(20) NULL     COMMENT '이름' -- 이름
)
COMMENT '관리자';

-- 관리자
ALTER TABLE `daedong`.`Manager`
	ADD CONSTRAINT `PK_Manager` -- 관리자 기본키
		PRIMARY KEY (
			`m_no` -- 번호
		);

ALTER TABLE `daedong`.`Manager`
	MODIFY COLUMN `m_no` INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 친구목록
CREATE TABLE `daedong`.`Friend` (
	`f_no`       INT      NOT NULL COMMENT 'count', -- count
	`g_follow`   INT      NULL     COMMENT '팔로우', -- 팔로우
	`g_follower` INT      NULL     COMMENT '팔로워', -- 팔로워
	`f_date`     DATETIME NULL     DEFAULT now() COMMENT '친추날짜', -- 친추날짜
	`f_read`     INT(1)   NULL     DEFAULT false COMMENT '0:안읽음 1:읽음 2:삭제' -- 읽음
)
COMMENT '친구목록';

-- 친구목록
ALTER TABLE `daedong`.`Friend`
	ADD CONSTRAINT `PK_Friend` -- 친구목록 기본키
		PRIMARY KEY (
			`f_no` -- count
		);

ALTER TABLE `daedong`.`Friend`
	MODIFY COLUMN `f_no` INT NOT NULL AUTO_INCREMENT COMMENT 'count';

-- 메세지
CREATE TABLE `daedong`.`Message` (
	`ms_no`      INT          NOT NULL COMMENT '메신저번호', -- 메신저번호
	`ms_content` VARCHAR(200) NULL     COMMENT '내용', -- 내용
	`ms_date`    DATETIME     NULL     COMMENT '날짜', -- 날짜
	`ch_no`      INT          NULL     COMMENT '채팅방번호', -- 채팅방번호
	`g_no`       INT          NULL     COMMENT '회원번호' -- 회원번호
)
COMMENT '메세지';

-- 메세지
ALTER TABLE `daedong`.`Message`
	ADD CONSTRAINT `PK_Message` -- 메세지 기본키
		PRIMARY KEY (
			`ms_no` -- 메신저번호
		);

ALTER TABLE `daedong`.`Message`
	MODIFY COLUMN `ms_no` INT NOT NULL AUTO_INCREMENT COMMENT '메신저번호';

-- 채팅방
CREATE TABLE `daedong`.`Chating` (
	`ch_no` INT NOT NULL COMMENT '채팅방번호', -- 채팅방번호
	`g_no`  INT NULL     COMMENT '회원번호' -- 회원번호
)
COMMENT '채팅방';

-- 채팅방
ALTER TABLE `daedong`.`Chating`
	ADD CONSTRAINT `PK_Chating` -- 채팅방 기본키
		PRIMARY KEY (
			`ch_no` -- 채팅방번호
		);

ALTER TABLE `daedong`.`Chating`
	MODIFY COLUMN `ch_no` INT NOT NULL AUTO_INCREMENT COMMENT '채팅방번호';

-- 게시판내용
CREATE TABLE `daedong`.`Content` (
	`c_no`       INT          NOT NULL COMMENT '내용번호', -- 내용번호
	`b_no`       INT          NULL     COMMENT '게시판번호', -- 게시판번호
	`c_contents` VARCHAR(500) NULL     COMMENT '내용', -- 내용
	`c_image`    VARCHAR(200) NULL     COMMENT '이미지' -- 이미지
)
COMMENT '게시판내용';

-- 게시판내용
ALTER TABLE `daedong`.`Content`
	ADD CONSTRAINT `PK_Content` -- 게시판내용 기본키
		PRIMARY KEY (
			`c_no` -- 내용번호
		);

ALTER TABLE `daedong`.`Content`
	MODIFY COLUMN `c_no` INT NOT NULL AUTO_INCREMENT COMMENT '내용번호';

-- 좋아요
CREATE TABLE `daedong`.`Like` (
	`l_no`   INT      NOT NULL COMMENT '좋아요번호', -- 좋아요번호
	`b_no`   INT      NULL     COMMENT '게시판번호', -- 게시판번호
	`g_no`   INT      NULL     COMMENT '회원번호', -- 회원번호
	`l_date` DATETIME NULL     DEFAULT now() COMMENT '좋아한날짜', -- 좋아한날짜
	`l_read` INT(1)   NULL     DEFAULT 0 COMMENT '읽음' -- 읽음
)
COMMENT '좋아요';

-- 좋아요
ALTER TABLE `daedong`.`Like`
	ADD CONSTRAINT `PK_Like` -- 좋아요 기본키
		PRIMARY KEY (
			`l_no` -- 좋아요번호
		);

ALTER TABLE `daedong`.`Like`
	MODIFY COLUMN `l_no` INT NOT NULL AUTO_INCREMENT COMMENT '좋아요번호';

-- 댓글
ALTER TABLE `daedong`.`Reply`
	ADD CONSTRAINT `FK_Board_TO_Reply` -- 게시판 -> 댓글
		FOREIGN KEY (
			`b_no` -- 게시판번호
		)
		REFERENCES `daedong`.`Board` ( -- 게시판
			`b_no` -- 게시판번호
		);

-- 댓글
ALTER TABLE `daedong`.`Reply`
	ADD CONSTRAINT `FK_Manager_TO_Reply` -- 관리자 -> 댓글
		FOREIGN KEY (
			`m_no` -- 관리자번호
		)
		REFERENCES `daedong`.`Manager` ( -- 관리자
			`m_no` -- 번호
		);

-- 댓글
ALTER TABLE `daedong`.`Reply`
	ADD CONSTRAINT `FK_Guest_TO_Reply` -- 회원 -> 댓글
		FOREIGN KEY (
			`g_no` -- 손님번호
		)
		REFERENCES `daedong`.`Guest` ( -- 회원
			`g_no` -- 회원번호
		);

-- 게시판
ALTER TABLE `daedong`.`Board`
	ADD CONSTRAINT `FK_Guest_TO_Board` -- 회원 -> 게시판
		FOREIGN KEY (
			`g_no` -- 고객번호
		)
		REFERENCES `daedong`.`Guest` ( -- 회원
			`g_no` -- 회원번호
		);

-- 게시판
ALTER TABLE `daedong`.`Board`
	ADD CONSTRAINT `FK_Manager_TO_Board` -- 관리자 -> 게시판
		FOREIGN KEY (
			`m_no` -- 매니저번호
		)
		REFERENCES `daedong`.`Manager` ( -- 관리자
			`m_no` -- 번호
		);

-- 친구목록
ALTER TABLE `daedong`.`Friend`
	ADD CONSTRAINT `FK_Guest_TO_Friend` -- 회원 -> 친구목록
		FOREIGN KEY (
			`g_follow` -- 팔로우
		)
		REFERENCES `daedong`.`Guest` ( -- 회원
			`g_no` -- 회원번호
		);

-- 친구목록
ALTER TABLE `daedong`.`Friend`
	ADD CONSTRAINT `FK_Guest_TO_Friend2` -- 회원 -> 친구목록2
		FOREIGN KEY (
			`g_follower` -- 팔로워
		)
		REFERENCES `daedong`.`Guest` ( -- 회원
			`g_no` -- 회원번호
		);

-- 메세지
ALTER TABLE `daedong`.`Message`
	ADD CONSTRAINT `FK_Chating_TO_Message` -- 채팅방 -> 메세지
		FOREIGN KEY (
			`ch_no` -- 채팅방번호
		)
		REFERENCES `daedong`.`Chating` ( -- 채팅방
			`ch_no` -- 채팅방번호
		);

-- 메세지
ALTER TABLE `daedong`.`Message`
	ADD CONSTRAINT `FK_Guest_TO_Message` -- 회원 -> 메세지
		FOREIGN KEY (
			`g_no` -- 회원번호
		)
		REFERENCES `daedong`.`Guest` ( -- 회원
			`g_no` -- 회원번호
		);

-- 채팅방
ALTER TABLE `daedong`.`Chating`
	ADD CONSTRAINT `FK_Guest_TO_Chating` -- 회원 -> 채팅방
		FOREIGN KEY (
			`g_no` -- 회원번호
		)
		REFERENCES `daedong`.`Guest` ( -- 회원
			`g_no` -- 회원번호
		);

-- 게시판내용
ALTER TABLE `daedong`.`Content`
	ADD CONSTRAINT `FK_Board_TO_Content` -- 게시판 -> 게시판내용
		FOREIGN KEY (
			`b_no` -- 게시판번호
		)
		REFERENCES `daedong`.`Board` ( -- 게시판
			`b_no` -- 게시판번호
		);

-- 좋아요
ALTER TABLE `daedong`.`Like`
	ADD CONSTRAINT `FK_Board_TO_Like` -- 게시판 -> 좋아요
		FOREIGN KEY (
			`b_no` -- 게시판번호
		)
		REFERENCES `daedong`.`Board` ( -- 게시판
			`b_no` -- 게시판번호
		);

-- 좋아요
ALTER TABLE `daedong`.`Like`
	ADD CONSTRAINT `FK_Guest_TO_Like` -- 회원 -> 좋아요
		FOREIGN KEY (
			`g_no` -- 회원번호
		)
		REFERENCES `daedong`.`Guest` ( -- 회원
			`g_no` -- 회원번호
		);