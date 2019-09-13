
DROP database if exists daedong;
create database daedong;

use daedong;

	
grant all privileges 
on daedong.* 
to 'user_daedong'@'localhost'
identified by 'rootroot';



grant all privileges 
on daedong.* 
to 'user_daedong'@'%'
identified by 'rootroot';








-- 덧글
CREATE TABLE `daedong`.`Reply` (
	`r_no`        INT      NOT NULL COMMENT '덧글번호', -- 덧글번호
	`g_no`        INT      NOT NULL COMMENT '손님번호', -- 손님번호
	`m_no`        INT      NULL     COMMENT '관리자번호', -- 관리자번호
	`b_no`        INT      NULL     COMMENT '게시판번호', -- 게시판번호
	`r_content`   TEXT     NOT NULL COMMENT '내용', -- 내용
	`r_writetime` DATETIME NULL     COMMENT '작성일', -- 작성일
	`r_delete`    BOOLEAN  NULL     DEFAULT false COMMENT '삭제여부', -- 삭제여부
	`r_good`      INT      NULL     COMMENT '좋아요' -- 좋아요
)
COMMENT '덧글';

-- 덧글
ALTER TABLE `daedong`.`Reply`
	ADD CONSTRAINT `PK_Reply` -- 덧글 기본키
		PRIMARY KEY (
			`r_no` -- 덧글번호
		);

ALTER TABLE `daedong`.`Reply`
	MODIFY COLUMN `r_no` INT NOT NULL AUTO_INCREMENT COMMENT '덧글번호';

-- 손님
CREATE TABLE `daedong`.`Guest` (
	`g_no`       INT          NOT NULL COMMENT '번호', -- 번호
	`g_id`       VARCHAR(30)  NULL     COMMENT '아이디', -- 아이디
	`g_password` VARCHAR(50)  NULL     COMMENT '비밀번호', -- 비밀번호
	`g_name`     VARCHAR(10)  NULL     COMMENT '이름', -- 이름
	`g_tel`      VARCHAR(15)  NULL     COMMENT '연락처', -- 연락처
	`g_email`    VARCHAR(50)  NULL     COMMENT '이메일', -- 이메일
	`g_birth`    DATE         NULL     COMMENT '생일', -- 생일
	`g_join`     DATE         NULL     COMMENT '가입일', -- 가입일
	`g_point`    INT          NULL     COMMENT '적립포인트', -- 적립포인트
	`g_memo`     VARCHAR(100) NULL     COMMENT '메모', -- 메모
	`g_delete`   BOOLEAN      NULL     DEFAULT false COMMENT '탈퇴여부', -- 탈퇴여부
	`g_addr`     VARCHAR(10)  NULL     COMMENT '우편번호', -- 우편번호
	`g_addr2`    VARCHAR(50)  NULL     COMMENT '주소', -- 주소
	`g_addr3`    VARCHAR(50)  NULL     COMMENT '상세주소', -- 상세주소
	`g_image`    LONGBLOB     NULL     COMMENT '사진' -- 사진
)
COMMENT '손님';

-- 손님
ALTER TABLE `daedong`.`Guest`
	ADD CONSTRAINT `PK_Guest` -- 손님 기본키
		PRIMARY KEY (
			`g_no` -- 번호
		);

ALTER TABLE `daedong`.`Guest`
	MODIFY COLUMN `g_no` INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 게시판
CREATE TABLE `daedong`.`Board` (
	`b_no`        INT          NOT NULL COMMENT '번호', -- 번호
	`g_no`        INT          NULL     COMMENT '고객번호', -- 고객번호
	`m_no`        INT          NULL     COMMENT '매니저번호', -- 매니저번호
	`b_place`     VARCHAR(500) NULL     COMMENT '장소', -- 장소
	`b_title`     VARCHAR(50)  NOT NULL COMMENT '제목', -- 제목
	`b_content`   TEXT         NOT NULL COMMENT '내용', -- 내용
	`b_writetime` DATE         NULL     COMMENT '작성일', -- 작성일
	`b_delete`    BOOLEAN      NULL     DEFAULT false COMMENT '삭제여부', -- 삭제여부
	`b_flat`      INT          NULL     COMMENT '구분', -- 구분
	`b_good`      INT          NULL     COMMENT '좋아요' -- 좋아요
)
COMMENT '게시판';

-- 게시판
ALTER TABLE `daedong`.`Board`
	ADD CONSTRAINT `PK_Board` -- 게시판 기본키
		PRIMARY KEY (
			`b_no` -- 번호
		);

ALTER TABLE `daedong`.`Board`
	MODIFY COLUMN `b_no` INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 파일
CREATE TABLE `daedong`.`File` (
	`f_no`   INT         NOT NULL COMMENT '파일번호', -- 파일번호
	`b_no`   INT         NULL     COMMENT '게시판 번호', -- 게시판 번호
	`f_path` LONGBLOB    NULL     COMMENT '파일경로', -- 파일경로
	`f_name` VARCHAR(50) NULL     COMMENT '파일명칭' -- 파일명칭
)
COMMENT '파일';

-- 파일
ALTER TABLE `daedong`.`File`
	ADD CONSTRAINT `PK_File` -- 파일 기본키
		PRIMARY KEY (
			`f_no` -- 파일번호
		);

-- 관리자
CREATE TABLE `daedong`.`Manager` (
	`m_no`       INT         NOT NULL COMMENT '번호', -- 번호
	`m_id`       VARCHAR(30) NULL     COMMENT '아이디', -- 아이디
	`m_password` VARCHAR(40) NULL     COMMENT '비밀번호', -- 비밀번호
	`m_name`     VARCHAR(10) NULL     COMMENT '이름' -- 이름
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

-- 메세지
CREATE TABLE `daedong`.`Message` (
	`ms_no`      INT          NOT NULL COMMENT '메신저번호', -- 메신저번호
	`f_no`       INT          NULL     COMMENT 'count', -- count
	`ms_content` VARCHAR(200) NULL     COMMENT '내용' -- 내용
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

-- 친구
CREATE TABLE `daedong`.`Friend` (
	`f_no`  INT NOT NULL COMMENT 'count', -- count
	`g_no`  INT NULL     COMMENT '본인', -- 본인
	`g_no2` INT NULL     COMMENT '친구' -- 친구
)
COMMENT '친구';

-- 친구
ALTER TABLE `daedong`.`Friend`
	ADD CONSTRAINT `PK_Friend` -- 친구 기본키
		PRIMARY KEY (
			`f_no` -- count
		);

ALTER TABLE `daedong`.`Friend`
	MODIFY COLUMN `f_no` INT NOT NULL AUTO_INCREMENT COMMENT 'count';

-- 덧글
ALTER TABLE `daedong`.`Reply`
	ADD CONSTRAINT `FK_Guest_TO_Reply` -- 손님 -> 덧글
		FOREIGN KEY (
			`g_no` -- 손님번호
		)
		REFERENCES `daedong`.`Guest` ( -- 손님
			`g_no` -- 번호
		);

-- 덧글
ALTER TABLE `daedong`.`Reply`
	ADD CONSTRAINT `FK_Board_TO_Reply` -- 게시판 -> 덧글
		FOREIGN KEY (
			`b_no` -- 게시판번호
		)
		REFERENCES `daedong`.`Board` ( -- 게시판
			`b_no` -- 번호
		);

-- 덧글
ALTER TABLE `daedong`.`Reply`
	ADD CONSTRAINT `FK_Manager_TO_Reply` -- 관리자 -> 덧글
		FOREIGN KEY (
			`m_no` -- 관리자번호
		)
		REFERENCES `daedong`.`Manager` ( -- 관리자
			`m_no` -- 번호
		);

-- 게시판
ALTER TABLE `daedong`.`Board`
	ADD CONSTRAINT `FK_Guest_TO_Board` -- 손님 -> 게시판
		FOREIGN KEY (
			`g_no` -- 고객번호
		)
		REFERENCES `daedong`.`Guest` ( -- 손님
			`g_no` -- 번호
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

-- 파일
ALTER TABLE `daedong`.`File`
	ADD CONSTRAINT `FK_Board_TO_File` -- 게시판 -> 파일
		FOREIGN KEY (
			`b_no` -- 게시판 번호
		)
		REFERENCES `daedong`.`Board` ( -- 게시판
			`b_no` -- 번호
		);

-- 메세지
ALTER TABLE `daedong`.`Message`
	ADD CONSTRAINT `FK_Friend_TO_Message` -- 친구 -> 메세지
		FOREIGN KEY (
			`f_no` -- count
		)
		REFERENCES `daedong`.`Friend` ( -- 친구
			`f_no` -- count
		);

-- 친구
ALTER TABLE `daedong`.`Friend`
	ADD CONSTRAINT `FK_Guest_TO_Friend` -- 손님 -> 친구
		FOREIGN KEY (
			`g_no` -- 본인
		)
		REFERENCES `daedong`.`Guest` ( -- 손님
			`g_no` -- 번호
		);

-- 친구
ALTER TABLE `daedong`.`Friend`
	ADD CONSTRAINT `FK_Guest_TO_Friend2` -- 손님 -> 친구2
		FOREIGN KEY (
			`g_no2` -- 친구
		)
		REFERENCES `daedong`.`Guest` ( -- 손님
			`g_no` -- 번호
		);