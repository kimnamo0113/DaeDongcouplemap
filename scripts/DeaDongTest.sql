select * from guest where g_email = 'klnver@naver.com';



/* 1. id,pw
 * 2. id,Temp
 * 3. email,pw
 * 4. email,Temp
 * 
 */*/
 
 select * 
 from guest
 where g_id='namo' and g_password='1234';
 
 select *
 from guest
 where (g_id='test' or g_email='') and (g_password='1234' or g_temp_password='');
 




select g_password,length(g_password) from guest;
select password('TTTTT1'), length(password('1234'));

select * from board;

select b.b_no, b.g_no, b.m_no, b_title, b_place, b_hash, b_contents, b_writetime, b_delete, b_flat, b_good, r.r_no,r.g_no, r.m_no,r.r_content,
	c_no, c_contents, c_image,
	r.r_good,r.r_writetime 
from (select * from board order by b_no desc limit 0,10) as b 
left join content c
on c.b_no = b.b_no
left join reply r
on r.b_no = b.b_no
;


select b.b_no, g_no, m_no, b_title, b_place, b_hash, b_contents, b_writetime, b_delete, b_flat, b_good
		from board b
		limit 0,10
		;
	
select count(*) from board b left join content c on c.b_no = b.b_no;
		

select b.b_no, b.g_no, b.m_no, b_title, b_place, b_hash, b_contents, b_writetime, b_delete, b_flat, b_good,
		c_no, c_contents, c_image,
		 r.r_no,r.g_no, r.m_no, r.r_content,r.r_good,r.r_writetime
	from (select * from board order by b_no desc limit 0,10) as b 
	left join content c
		on c.b_no = b.b_no
	left join reply r
		on r.b_no = b.b_no;
	
select b.b_no, b.g_no, b.m_no, b_title, b_place, b_hash, b_contents, b_writetime, b_delete, b_flat, b_good,
			c.c_no, c.c_contents, c.c_image,
			r.r_no , r.b_no as r_b_no, r.g_no as r_g_no, r.m_no as r_m_no, r.r_content, r.r_good,r.r_writetime,
			g.g_id
		from (select * from board order by b_no desc limit 0,10) as b 
		left join content c
			on c.b_no = b.b_no
		left join reply r
			on r.b_no = b.b_no
		left join guest g
			on g.g_no=r.g_no
		order by b.b_no desc,r_no desc;
	
select b.b_no, b.g_no, b.m_no, b_title, b_place, b_hash, b_contents, b_writetime, b_delete, b_flat, b_good,
			c.c_no, c.c_contents, c.c_image
		from (select * from board order by b_no desc limit 0,10) as b 
		left join content c
			on c.b_no = b.b_no
		order by b.b_no desc;
	
	
	
	SELECT r_no, b_no, r.g_no, m_no, r_content, r_writetime, r_delete, r_good
		FROM reply r
		join guest g
		on g.g_no=r.g_no
		where b_no=32
		order by r_no desc
		limit 0,5;
	
	select count(r_no)
		FROM reply r
		where b_no=32
		order by r_no desc
		
		
select * from reply 
where b_no = 32
order by r_no desc
limit #{cri.pageStart},#{cri.perPageNum}
;

SELECT * FROM guest;
select * from guest where g_id='test' or g_email='dasd' and g_password='1234';

select b.b_no, b.g_no, b.m_no, b_title, b_place, b_hash, b_contents, b_writetime, b_delete, b_flat, b_good,
			c.c_no, c.c_contents, c.c_image
		from (select * from board order by b_no desc limit 1,24) as b 
		left join content c
			on c.b_no = b.b_no
		where g_no=1
		order by b.b_no desc;

	
SELECT * FROM guest;

INSERT INTO daedong.guest
(g_id, g_password, g_name, g_tel, g_email, g_birth, g_gender, g_certification)
VALUES('test2', password(1234), 'namo', '01012341234', 'klnver@naver.com', '940113', 0, 'true');

select f_no, g_follow, g_follower, f_date, f_read ,
	g2.g_no g2_no, g2.g_name g2_name, g2.g_email g2_email, g2.g_image g2_image  
from friend f 
join guest g2
	on f.g_follower = g2.g_no
where g_follower=2 && (f_read=0 || f_read=1);



select f_no, g_follow, g_follower, f_date, f_read ,
			g1.g_no g1_no, g1.g_id g1_id, g1.g_name g1_name, g1.g_email g1_email, g1.g_image g1_image  
		from friend f 
		join guest g1
			on f.g_follow = g1.g_no
		where g_follower=2
		order by g1_name asc