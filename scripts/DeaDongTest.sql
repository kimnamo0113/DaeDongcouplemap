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
 

SELECT l_no, b_no, g_no, l_date, l_read
FROM daedong.`like`;

SELECT l.l_no, g.g_no, g.g_id, g.g_image
FROM daedong.`like` l
	join guest g 
	on g.g_no=l.g_no
	where l.b_no=9
;


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
		order by g1_name ASC
		
UPDATE daedong.guest
SET g_image=null
WHERE g_no=1;

		
SELECT count(l_no) 
	FROM daedong.`like` l
join board b
	on b.b_no = l.b_no
join guest g
	on b.g_no = g.g_no
where l_read = 0 and g.g_no=4;



select *
	FROM daedong.`like` l
join board b
	on b.b_no = l.b_no
join guest g
	on l.g_no = g.g_no
where b.g_no=4 and b.b_delete=0
order by l.l_date desc;


select l.b_no, b_title, g.g_no, g.g_name, g.g_id
	FROM daedong.`like` l
join board b
	on b.b_no = l.b_no
join guest g
	on l.g_no = g.g_no
where b.g_no=4 and b.b_delete=0
order by l.l_date desc;


SELECT * FROM `LIKE`;
select * from reply;

	
select r.r_no, r.b_no, b.b_title, r.r_writetime, r.g_no, r.r_read, 'r' flag 
	from reply r
	join board b
		on r.b_no = b.b_no
	where b.g_no=1 and (r.r_read=0 or r.r_read=1)
union
select l.l_no, l.b_no, b.b_title, l.l_date, l.g_no, l.l_read, 'l' flag 
	from `like` l
	join board b
		on l.b_no = b.b_no
	where b.g_no=1 and (l.l_read=0 or l.l_read=1)
order by r_writetime desc, r_no desc
limit 0,10;


select count(r.r_no) r_no,'r'
	from reply r
	join board b
		on r.b_no = b.b_no
	join guest g
		on r.g_no = g.g_no
	where b.g_no=1 and b.g_no!=r.g_no and r.r_read=0
union
select count(l.l_no) r_no,'l'
	from `like` l
	join board b
		on l.b_no = b.b_no
	join guest g
		on l.g_no = g.g_no
	where b.g_no=1 and b.g_no!=l.g_no and l.l_read=0
	
select COUNT(*)
from reply r
where r.b_no=9 and r.r_no >= 45;


	
select r_no
from reply r 
where r.b_no=8
order by r_writetime desc, r_no desc
;

select COUNT(*) 
from reply r
where r.b_no=9 and r.r_no >= 45;

select * from board;

select b_no, b_no,b_title, b_writetime, 'b' b_contents FROM board where g_no=1
	union
select l.l_no, b.b_no, b.b_title, l.l_date, 'l'
	from `like` l
	join board b
	on l.b_no = b.b_no
	where l.g_no=1
	union
select r.r_no, b.b_no, b.b_title, r.r_writetime, 'r'
	from reply r
	join board b
	on r.b_no = b.b_no
	where r.g_no=1
	union
select f.f_no, f.g_follow, f.g_follower, f.f_date, f.f_read from friend f where g_follow=1
	order by b_writetime DESC
	LIMIT 0,10;

select count(b_no),'b' b_contents FROM board where g_no=1
	union
select count(l.l_no),'l'
	from `like` l
	join board b
	on l.b_no = b.b_no
	where l.g_no=1
	union
select count(r.r_no),'r'
	from reply r
	join board b
	on r.b_no = b.b_no
	where r.g_no=1
	union
select count(f.f_no),f.f_read 
from friend f where g_follow=1;


select * from friend where g_follower=1;

SELECT f_no, g_follow, g_follower,g.g_no, g.g_name, g.g_id, g.g_image
FROM daedong.friend f
	join guest g
	on f.g_follow=g.g_no
where g_follower=1 and (f_read=3 or f_read=4) and (g_name LIKE '%z%' or g_id like '%z%');





