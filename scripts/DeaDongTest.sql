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

