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
			r.r_no , r.b_no as r_b_no, r.g_no as r_g_no, r.m_no as r_m_no, r.r_content, r.r_good,r.r_writetime 
		from (select * from board order by b_no desc limit 11,10) as b 
		left join content c
			on c.b_no = b.b_no
		left join reply r
			on r.b_no = b.b_no
		
		
		
