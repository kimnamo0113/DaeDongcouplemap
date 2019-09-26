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


select b.b_no, g_no, m_no, b_title, b_place, b_hash, b_contents, b_writetime, b_delete, b_flat, b_good from 
(select * from board limit 0,10) as b left join content c on c.b_no = b.b_no;


select b.b_no, g_no, m_no, b_title, b_place, b_hash, b_contents, b_writetime, b_delete, b_flat, b_good
		from board b
		limit 0,10
		;
	
select count(*) from board b left join content c on c.b_no = b.b_no;
		
