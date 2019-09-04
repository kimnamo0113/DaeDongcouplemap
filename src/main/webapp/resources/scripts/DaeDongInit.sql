
DROP database daedong;
create database daedong;

use daedong;

	
grant all privileges 
on hairshop.* 
to 'user_daedong'@'localhost'
identified by 'rootroot';



grant all privileges 
on hairshop.* 
to 'user_daedong'@'%'
identified by 'rootroot';








-- 덧글
CREATE TABLE `daedong`.`Reply` (
	`r_no`        INT         NOT NULL COMMENT '덧글번호', -- 덧글번호
	`g_no`        INT         NOT NULL COMMENT '손님번호', -- 손님번호
	`b_no`        INT         NULL     COMMENT '리뷰번호', -- 리뷰번호
	`r_content`   TEXT        NOT NULL COMMENT '내용', -- 내용
	`r_writer`    VARCHAR(20) NULL     COMMENT '작성자', -- 작성자
	`r_writetime` DATETIME    NULL     COMMENT '작성일', -- 작성일
	`r_delete`    BOOLEAN     NULL     DEFAULT false COMMENT '삭제여부' -- 삭제여부
)
COMMENT '덧글';

-- 덧글
ALTER TABLE `daedong`.`Reply`
	ADD CONSTRAINT `PK_Reply` -- 덧글 기본키
		PRIMARY KEY (
			`r_no` -- 덧글번호
		);

-- 손님
CREATE TABLE `daedong`.`Guest` (
	`g_no`       INT          NOT NULL COMMENT '번호', -- 번호
	`g_id`       VARCHAR(20)  NULL     COMMENT '아이디', -- 아이디
	`g_password` VARCHAR(50)  NULL     COMMENT '비밀번호', -- 비밀번호
	`g_l_grade`  VARCHAR(10)  NULL     COMMENT '등급', -- 등급
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
	`g_addr3`    VARCHAR(50)  NULL     COMMENT '상세주소' -- 상세주소
)
COMMENT '손님';

-- 손님
ALTER TABLE `daedong`.`Guest`
	ADD CONSTRAINT `PK_Guest` -- 손님 기본키
		PRIMARY KEY (
			`g_no` -- 번호
		);

-- 게시판
CREATE TABLE `daedong`.`Board` (
	`b_no`        INT         NOT NULL COMMENT '번호', -- 번호
	`g_no`        INT         NULL     COMMENT '고객번호', -- 고객번호
	`b_writer`    VARCHAR(20) NULL     COMMENT '글쓴이', -- 글쓴이
	`b_title`     VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
	`b_content`   TEXT        NOT NULL COMMENT '내용', -- 내용
	`b_writetime` DATE        NULL     COMMENT '작성일', -- 작성일
	`b_file`      VARCHAR(50) NULL     COMMENT '사진', -- 사진
	`b_delete`    BOOLEAN     NULL     DEFAULT false COMMENT '삭제여부' -- 삭제여부
)
COMMENT '게시판';

-- 게시판
ALTER TABLE `daedong`.`Board`
	ADD CONSTRAINT `PK_Board` -- 게시판 기본키
		PRIMARY KEY (
			`b_no` -- 번호
		);

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
			`b_no` -- 리뷰번호
		)
		REFERENCES `daedong`.`Board` ( -- 게시판
			`b_no` -- 번호
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