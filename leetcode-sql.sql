create table tree
(
id int,
p_id int
);

insert into TREE VALUES (1, null);
insert into TREE VALUES (2, 19);
insert into TREE VALUES (3, 17);
insert into TREE VALUES (4, 18);
insert into TREE VALUES (5, 34);

  
##insert values to payment
INSERT INTO payment VALUES
  ('2017-03-01','A',13.9
  );
INSERT INTO payment VALUES
  ('2017-03-01','B',31.9
  );
INSERT INTO payment VALUES
  ('2017-03-01','C',24.9
  );
INSERT INTO payment VALUES
  ('2017-03-01','A',23.6
  );
INSERT INTO payment VALUES
  ('2017-03-01','D',13.6
  );
INSERT INTO payment VALUES
  ('2017-03-01','E',19.8
  );
INSERT INTO payment VALUES
  ('2017-03-01','B',33.4
  );
INSERT INTO payment VALUES
  ('2017-03-01','A',23.9
  );
  
  
#602， Friend request
create table request_accepted(
requester_id int,
accepter_id int,
accept_date datetime
);


insert into request_accepted values
(1,5,'2016-06-03');
insert into request_accepted values
(1,6,'2016-06-03');
insert into request_accepted values
(1,2,'2016-06-03');
insert into request_accepted values
(1,3,'2016-06-08');
insert into request_accepted values
(2,3,'2016-06-08');
insert into request_accepted values
(3,4,'2016-06-09');
insert into request_accepted values
(3,5,'2016-06-10');


select distinct id, count(id) num
from
(select accepter_id id
from request_accepted
union all
select requester_id
from request_accepted) n
group by n.id
order by num desc
limit 1;


select id, count(id) num 
from
(select requester_id as id from request_accepted
union all
select accepter_id from request_accepted) 
group by id
order by num desc
limit 1;

select requester_id as id from request_accepted
union all
select accepter_id from request_accepted;

select ID, num from
(select id, count(id) num
from
(select requester_id as id from request_accepted
union all
select accepter_id from request_accepted) t
group by id) t2
order by num desc
limit 1;


select * from request_accepted;


select id, count(id) num
from
(select requester_id as id from request_accepted
union all
select accepter_id from request_accepted) t1
group by id
having num = (select max(num) from
(select id, count(id) num
from
(select requester_id as id from request_accepted
union all
select accepter_id from request_accepted) t1
group by id) t2);

create table student 
(Id integer primary key auto_increment, 
 Name varchar(15), 
 Score integer, 
 ClassId integer);

insert into student(Name, Score, ClassId) values("lqh", 60, 1);
insert into student(Name, Score, ClassId) values("cs", 99, 1);
insert into student(Name, Score, ClassId) values("wzy", 60, 1);
insert into student(Name, Score, ClassId) values("zqc", 88, 2);
insert into student(Name, Score, ClassId) values("bll", 100, 2);

drop table student;

create table test  
(  
    id int not null auto_increment,  
    name varchar(20) not null default '',  
    score int not null default 0,  
    primary key(id)  
)engine=InnoDB CHARSET=UTF8; 

#579
create table employee(
id int,
Month int,
Salary int);

insert into employee values(1,1,20);
insert into employee values(2,1,20);
insert into employee values(1,2,30);
insert into employee values(2,2,30);
insert into employee values(3,2,40);
insert into employee values(1,3,40);
insert into employee values(3,3,60);
insert into employee values(1,4,60);
insert into employee values(3,4,70);











select e1.id, e1.month, e1.salary 
from employee e1 left join employee e2
on e1.Month = e2.month -1 and e1.id = e2.id
where e2.id is not null
order by e1.id, e1.month desc;


SELECT
    id, MAX(month) AS month
FROM
    Employee
GROUP BY id
having count(*)>1;

create table tree
(id int,
p_id int);

insert into tree values (1,null);
insert into tree values (2,1);
insert into tree values (3,1);
insert into tree values (4,2);
insert into tree values (5,2);

select t.id, 
case
when p_id is null then 'root' 
when t.id not in (select distinct t1.p_id from tree t1 where p_id is not null) then 'Leaf'
else 'Inner' end
from tree t;


select distinct t1.p_id from tree t1;
select t2.id from tree t2 where t2.p_id is null;

create table bst
(n int,
p int);


insert into bst values (1,2);
insert into bst values (6,8);
insert into bst values (9,8);
insert into bst values (3,2);
insert into bst values (2,5);
insert into bst values (5,null);
insert into bst values (8,5);

SELECT N, 
CASE 
WHEN P IS NULL THEN 'Root' 
WHEN (SELECT COUNT(*) FROM BST WHERE P=B.N)>0 THEN 'Inner'
ELSE 'Leaf' END 
FROM BST AS B 
ORDER BY N;



SELECT N, 
CASE 
WHEN P IS NULL THEN 'Root' 
WHEN N not in (SELECT P FROM BST WHERE P is not null)>0 THEN 'Leaf'
ELSE 'Inner' END 
FROM BST AS B 
ORDER BY N;

#leetcode---613
create table point(
x int);

insert into point values (-1);
insert into point values (0);
insert into point values (-2);
insert into point values (4);
insert into point values (2);

select abs(p1.x - p2.x) shortest
from point p1, point p2
where p1.x != p2.x
order by shortest
limit 1;

select min(abs(p1.x - p2.x)) shortest
from point p1, point p2
where p1.x != p2.x;

#leetcode---584

create table customer(
id int,
name varchar(15),
referee_id int
);

insert into customer values(1, 'Will', null);
insert into customer values(2, 'Jane', null);
insert into customer values(3, 'Alex', 2);
insert into customer values(4, 'Bill', null);
insert into customer values(5, 'Zack', 1);
insert into customer values(6, 'Mark', 2);



select name from customer 
where  referee_id != 2 or referee_id is null;


#leetcode---607
create table salesperson(
sales_id int,
name varchar(15),
salary int,
commission_rate int,
hire_date date);

create table company(
com_id int,
name varchar(15),
city varchar(15)
);

create table orders(
order_id int,
date date,
com_id int,
sales_id int,
amount int);

insert into company values(1,'Red','Boston');
insert into company values(2,'Orange','New York');
insert into company values(3,'Yellow','Boston');
insert into company values(4,'Green','Austin');

insert into orders values(1, '2014-1-1',3,4,100000);
insert into orders values(2, '2014-1-2',4,5,5000);
insert into orders values(3, '2014-1-3',1,1,50000);
insert into orders values(4, '2014-1-4',1,4,25000);

insert into salesperson values(1,'John',100000, 6, '2006-4-1');
insert into salesperson values(2,'Amy',120000, 5, '2010-5-1');
insert into salesperson values(3,'Mark',65000, 12, '2008-12-25');
insert into salesperson values(4,'Pam',25000, 25, '2005-1-1');
insert into salesperson values(5,'Alex',50000, 10, '2006-2-3');


select name 
from salesperson
where sales_id not in
(select o.sales_id
from company c, orders o
where c.com_id = o.com_id
and c.name = 'Red');


#leetcode-603
create table cinema(
seat_id int,
free int);

insert into cinema values(1,1);
insert into cinema values(2,0);
insert into cinema values(3,1);
insert into cinema values(4,1);
insert into cinema values(5,1);


select distinct c1.seat_id
from
cinema c1, cinema c2
where ((c1.seat_id = c2.seat_id + 1)
or (c1.seat_id = c2.seat_id - 1))
and c1.free = 1 and c2.free = 1
order by c1.seat_id;


select c1.seat_id
from cinema c1, cinema c2
where c1.seat_id = c2.seat_id - 1
and c1.free = 1 and c1.free = c2.free
union
select c2.seat_id
from cinema c1, cinema c2
where c1.seat_id = c2.seat_id - 1
and c1.free = 1 and c1.free = c2.free;

SELECT distinct seat_id
FROM cinema
WHERE free = 1 AND
(seat_id - 1 in (select seat_id FROM cinema WHERE free = 1) OR
seat_id + 1 in (select seat_id FROM cinema WHERE free = 1))
ORDER BY seat_id;

#---------619
create table num (num int);

insert into num values(8);
insert into num values(8);
insert into num values(3);
insert into num values(3);
insert into num values(1);
insert into num values(4);
insert into num values(5);
insert into num values(6);
insert into num values(1);
insert into num values(4);
insert into num values(5);
insert into num values(6);

select ifnull(
(select num
from num
group by num
having count(num) = 1
order by num desc
limit 1), null) as num;


SELECT
    MAX(num) AS num
FROM
    (SELECT
        num
    FROM
        num
    GROUP BY num
    HAVING COUNT(num) = 1) AS t;


#----597
create table friend_request(
sender_id int,
send_to_id int,
request_date date);

insert into friend_request values(1,2,'2016-06-01');
insert into friend_request values(1,3,'2016-06-01');
insert into friend_request values(1,4,'2016-06-01');
insert into friend_request values(2,3,'2016-06-02');
insert into friend_request values(3,4,'2016-06-09');

insert into request_accepted values(3,4,'2016-06-10' );

select * from request_accepted;
delete from request_accepted where accepter_id in (5,6);


select round(ifnull(
(select count(*) from 
(select distinct requester_id, accepter_id 
from request_accepted) a1)
/
(select count(*) from 
(select distinct sender_id, send_to_id 
from friend_request) a2), 0),2) as accept_rate;


select 
count(*)/
(select count(*) from 
(select distinct sender_id, send_to_id 
from friend_request) a2)
from 
(select distinct requester_id, accepter_id 
from request_accepted) a1;



#196---
create table person
(id int,
email varchar(50));

insert into person values(1,'john@example.com');
insert into person values(2,'bob@example.com');
insert into person values(3,'john@example.com');

SELECT MIN(Id) as Id, Email
FROM Person
group BY Email;

create table insurance(
pid integer(11),
tiv_2015 numeric(15,2),
tiv_2016 numeric(15,2),
lat numeric(5,2),
lon numeric(5,2));

insert into insurance values(1,10, 5,10,10);
insert into insurance values(2,20, 20,20,20);
insert into insurance values(3,10, 30,20,20);
insert into insurance values(4,10, 40,40,40);

select *
from insurance
where pid not in
(select i1.pid from insurance i1, insurance i2
where (i1.lon = i2.lat and i1.lat = i2.lat));



select sum(tiv_2016)
from insurance
where tiv_2015 = 
(select tiv_2015 
from insurance
group by tiv_2015
order by count(tiv_2015) desc
limit 1)
and 
pid not in (select i1.pid
from insurance i1, insurance i2
where i1.lat = i2.lat and i1.lon = i2.lon
and i1.pid != i2.pid);


#178
create table Scores(
id int,
score float);

insert into Scores values(1,3.50);
insert into Scores values(2,3.65);
insert into Scores values(3,4.00);
insert into Scores values(4,3.85);
insert into Scores values(5,4.00);
insert into Scores values(6,3.65);

select * from scores;

select s1.score, count(distinct s2.score) as rank
from scores s1,scores s2
where s1.score <= s2.score
group by s1.score, s1.id
order by s1.score desc;



select s1.score, count(distinct s2.score) as rank
from scores s1, scores s2
where s1.score <= s2.score
group by s1.score, s1.id
order by rank;


select s1.Score, 
(select count(distinct s.Score) from Scores s where s.Score >= s1.Score) as Rank
from Scores s1
order by s1.Score desc;

create table music
(date date,
user_id int,
song_id int,
count_sg int);

create table day_sg
(date datetime,
user_id int,
song_id int,
num_sg int);

insert into music values('2016-06-01',3,1,100);
insert into music values('2016-06-01',3,5,200);
insert into music values('2016-06-01',1,5,80);
insert into music values('2016-06-01',2,2,160);
insert into music values('2016-06-01',2,3,120);
insert into music values('2016-06-01',2,4,100);
insert into music values('2016-06-01',2,6,95);
insert into music values('2016-06-01',1,4,120);


insert into day_sg values('2016-06-02',3,2,1);
insert into day_sg values('2016-06-02',3,2,1);
insert into day_sg values('2016-06-02',3,2,1);
insert into day_sg values('2016-06-02',3,2,1);
insert into day_sg values('2016-06-02',1,5,1);
insert into day_sg values('2016-06-02',1,5,1);
insert into day_sg values('2016-06-02',1,5,1);
insert into day_sg values('2016-06-02',1,2,1);
insert into day_sg values('2016-06-02',1,2,1);
insert into day_sg values('2016-06-02',3,2,1);
insert into day_sg values('2016-06-02',2,2,1);
insert into day_sg values('2016-06-02',2,2,1);
insert into day_sg values('2016-06-02',2,2,1);
insert into day_sg values('2016-06-02',2,2,1);
insert into day_sg values('2016-06-02',2,2,1);
insert into day_sg values('2016-06-02',2,2,1);



select ifnull(n.date, '2016-06-02') date,
ifnull(n.uid2, n.uid1) user_id,
ifnull(n.sid2, n.sid1) song_id,
case when n.count_sg is null
then n.num_sg else (n.count_sg+n.num_sg) end count_sg
from
(select t.user_id uid1, t.song_id sid1, t.num_sg num_sg,
m.date date, m.user_id uid2, m.song_id sid2, m.count_sg count_sg
from
(select user_id, song_id, count(num_sg) num_sg
from day_sg d
group by user_id, song_id) t
left join music m
on t.user_id = m.user_id
and t.song_id = m.song_id) n
union
select n.date,n.uid2 user_id, n.sid2 song_id,
n.count_sg count_sg
from
(select t.user_id uid1, t.song_id sid1, t.num_sg num_sg,
m.date date, m.user_id uid2, m.song_id sid2, m.count_sg count_sg
from
(select user_id, song_id, count(num_sg) num_sg
from day_sg d
group by user_id, song_id) t
right join music m
on t.user_id = m.user_id
and t.song_id = m.song_id) n
where n.uid1 is null;


select current_date();

select subdate(current_date(),1);

create table attend(
date date,
student_id int,
attendance varchar(15));

insert into attend values('2018-05-11',2,'yes');
insert into attend values('2018-05-11',3,'yes');
insert into attend values('2018-05-11',5,'yes');
insert into attend values('2018-05-11',1,'yes');
insert into attend values('2018-05-11',4,'no');
insert into attend values('2018-05-11',6,'yes');
insert into attend values('2018-05-11',7,'yes');
insert into attend values('2018-05-11',8,'no');
insert into attend values('2018-05-11',9,'yes');
insert into attend values('2018-05-12',2,'yes');
insert into attend values('2018-05-12',3,'no');
insert into attend values('2018-05-12',5,'no');
insert into attend values('2018-05-12',1,'yes');

select 
count(case when attendance = 'yes' then attendance else null end)
/
count(distinct date)
from attend;

update attend set date = '2018-05-11' where date = '2016-05-11';
update attend set date = '2018-05-12' where date = '2016-05-12';


select count(student_id) 
/
(select count(*) from attend where date = subdate('2018-05-12',1)) 
from attend where date = subdate('2018-05-12',1)
and attendance = 'yes';

select count(*) from attend where date = subdate('2018-05-12',1);

select count(case when attendance = 'yes' then student_id else null end)
/count(student_id) as rate
from attend 
where date = subdate('2018-05-12',1);

create table demo(
student_id int,
school_id int,
grade_level int,
date_of_birth date,
hometown varchar(20));

insert into demo values(2,1,3,'2008-05-11','Fremont');
insert into demo values(3,1,3,'2008-05-11','Fairfax');
insert into demo values(5,1,3,'2008-03-11','Fairfax');
insert into demo values(1,1,5,'2008-02-11','Fairfax');
insert into demo values(4,2,5,'2008-01-11','Fairfax');
insert into demo values(6,2,3,'2008-03-21','Fairfax');
insert into demo values(7,2,4,'2008-03-27','Fairfax');
insert into demo values(9,2,4,'2008-03-27','Fremont');
insert into demo values(10,2,4,'2008-03-27','Fremont');
insert into demo values(11,3,4,'2008-03-27','Fremont');
insert into demo values(12,3,4,'2008-03-27','Fremont');



select school_id
from
(select a.date, a.student_id, a.attendance, d.school_id 
from attend a right join demo d
on a.student_id = d.student_id 
where a.date = '2018-5-11') n
group by school_id
having (count(case when attendance = 'yes' then school_id else null end)/count(school_id)) = 
(select
count(case when attendance = 'yes' then school_id else null end)/ count(school_id) as attend_rate
from
(select a.date, a.student_id, a.attendance, d.school_id 
from attend a right join demo d
on a.student_id = d.student_id 
where a.date = '2018-5-11') n
group by school_id
order by attend_rate desc
limit 1);


create table content_action(
user_id int,
content_id int,
content_type varchar(15),
target_id int);

insert into content_action values(12,3,'comment', 15);
insert into content_action values(18,4,'comment', 15);
insert into content_action values(19,5,'comment', 15);
insert into content_action values(20,23,'comment', 15);
insert into content_action values(118,45,'comment', 15);
insert into content_action values(68,13,'comment', 15);
insert into content_action values(45,15,'post',  null);
insert into content_action values(129,14,'comment', 35);
insert into content_action values(120,24,'comment', 35);
insert into content_action values(118,34,'comment', 35);
insert into content_action values(90,29,'comment', 35);
insert into content_action values(45,35,'post', null);
insert into content_action values(29,6,'comment', 36);
insert into content_action values(20,7,'comment', 36);
insert into content_action values(218,8,'comment', 36);
insert into content_action values(93,9,'comment', 36);
insert into content_action values(27,36,'post',  null);
insert into content_action values(37,18,'post', null);
insert into content_action values(147,115,'post', null);
insert into content_action values(247,105,'photo', null);
insert into content_action values(17,27,'photo', null);
insert into content_action values(120,99,'comment', 27);
insert into content_action values(38,100,'comment', 27);
insert into content_action values(93,78,'comment', 27);

select sum(target_id) from content_action where target_id = null;

delete from content_action where user_id = 47 and content_id =15;


select num_comments, count(post) num_post
from
(select c2.content_id, count(c1.content_type) num_comments, c2.content_type post
from 
(select * from content_action 
where content_type = 'comment') c1
right join
(select * from content_action
where content_type = 'post') c2
on c1.target_id = c2.content_id
group by c2.content_id,c2.content_type) n
group by n.num_comments;


select c2.content_id, count(c1.content_type) num_comments, c2.content_type post
from 
(select * from content_action 
where content_type = 'comment') c1
right join
(select * from content_action
where content_type = 'post') c2
on c1.target_id = c2.content_id
group by c2.content_id,c2.content_type;





#--
select c1.content_id, count(c2.content_type) cnt
from content_action c1 left join content_action c2
on c1.content_id= c2.target_id
where c1.content_type = 'post' and c2.content_type = 'comment'
group by c1.content_id
having cnt =
(select count(c2.content_type) cnt
from content_action c1 left join content_action c2
on c1.content_id= c2.target_id
where c1.content_type = 'post' and c2.content_type = 'comment'
group by c1.content_id
order by cnt desc
limit 1);


select count(n.content_id) , cnt 
from
(select c1.content_id, count(c2.content_type) cnt
from content_action c1 left join content_action c2
on c1.content_id= c2.target_id
where c1.content_type = 'post' and c2.content_type = 'comment'
group by c1.content_id) n
group by cnt;







#-------
select n.num_comments, count(content_id) num_story
from
(select c2.content_type, c2.content_id, count(c1.content_type) num_comments
from
(select * from content_action
where content_type = 'comment') c1
right join
(select * from content_action
where content_type = 'photo'
union
select * from content_action
where content_type = 'post') c2
on c1.target_id = c2.content_id
group by c2.content_id, c2.content_type) n
group by n.num_comments;


#-------average comments for each comment_type
select n.content_type, avg(n.num_comments)
from
(select c2.content_type, c2.content_id, count(c1.content_type) num_comments
from
(select * from content_action
where content_type = 'comment') c1
right join
(select * from content_action
where content_type = 'photo'
union
select * from content_action
where content_type = 'post') c2
on c1.target_id = c2.content_id
group by c2.content_id, c2.content_type) n
group by n.content_type;


#----578
create table survey_log(
user_id int, 
question_id int, 
question_order int, 
event varchar(15), 
timestamp timestamp);


insert into survey_log values(12,3, 4, 'saw','2008-01-11');
insert into survey_log values(12,2, 1, 'answered','2008-01-11');
insert into survey_log values(12,1, 2, 'answered','2008-01-11');
insert into survey_log values(12,3, 4, 'skip','2008-01-11');
insert into survey_log values(12,2, 1, 'saw','2008-01-11');
insert into survey_log values(12,1, 2, 'saw','2008-01-11');
insert into survey_log values(12,4, 3, 'saw','2008-01-11');
insert into survey_log values(12,4, 3, 'answered','2008-01-11');
insert into survey_log values(1,2, 5, 'answered','2008-01-11');
insert into survey_log values(1,1, 1, 'answered','2008-01-11');
insert into survey_log values(1,3, 4, 'answered','2008-01-11');
insert into survey_log values(1,2, 5, 'saw','2008-01-11');
insert into survey_log values(1,1, 1, 'saw','2008-01-11');
insert into survey_log values(1,4, 2, 'saw','2008-01-11');
insert into survey_log values(1,4, 2, 'skip','2008-01-11');
insert into survey_log values(1,3, 4, 'saw','2008-01-11');
insert into survey_log values(1,5, 3, 'skip','2008-01-11');
insert into survey_log values(1,5, 3, 'saw','2018-05-18');

delete from survey_log where question_id = 3 and question_order= 4;


select s1.question_id,count(s2.event)/count(s1.question_id)
from
(select * from survey_log where event = 'saw') s1
left join
(select * from survey_log where event = 'answered') s2
on s1.user_id = s2.user_id and s1.question_id = s2.question_id
group by s1.question_id;


select 
count(case when event = 'answered' then event else null end)
/
count(case when event = 'saw' then event else null end)
from survey_log
group by question_id;

select time_to_sec(timediff(current_date(),'2018-05-17'))/3600;
select * from survey_log where timestamp = current_date();

select rand()*5;


#------ select random data
select *
from survey_log s1 join
(select round(rand()* ((select max(question_id) from survey_log)
-(select min(question_id) from survey_log)) +(select min(question_id) from survey_log)) as question_id) as s2
where s1.question_id > s2.question_id
order by s1.question_id limit 1,2;

select *
from survey_log
where uestion_id =
(select round(rand()* ((select max(question_id) from survey_log)
-(select min(question_id) from survey_log)) +(select min(question_id) from survey_log)) as question_id
from survey_log
limit 1,1);



select distinct question_order from survey_log where question_id = 5;


#-----
create table person
(id int,
email varchar(25));

insert into person values(1,'john@example.com');
insert into person values(2,'bob@example.com');
insert into person values(3,'john@example.com');

select min(id) id, email from person group by email order by id;

select distinct id, email
from person 
where id not in
(select p1.id 
from person p1, person p2
where p1.email = p2.email
and p1.id > p2.id);

#---------
create table salary
(id int,
salary int);

insert into salary values(1,100);
insert into salary values(2,100);
insert into salary values(3,100);
insert into salary values(4,200);
insert into salary values(5,300);

select ifnull(salary,null) from salary
order by salary desc limit 1 offset 1;

select ifnull(
(select distinct Salary from Salary
order by salary desc
limit 1, 1),null) as SecondHighestSalary;

select distinct Salary from Salary
order by salary desc
limit 1 offset 1;

drop table friending;
create table friending(
ds date,
action varchar(15),
user_id varchar(15),
target_id varchar(15)
);

insert into friending values('2018-05-20','send', 'a_id','b_id');
insert into friending values('2018-05-21','accept', 'b_id','a_id');
insert into friending values('2018-05-19','send', 'a_id','c_id');
insert into friending values('2018-05-21','accept', 'c_id','a_id');
insert into friending values('2018-05-19','send', 'b_id','d_id');
insert into friending values('2018-05-20','send', 'b_id','a_id');
insert into friending values('2018-05-21','send', 'c_id','d_id');


select f1.ds, count(f2.user_id)/count(f1.user_id) as acceptance_rate
from
(select * from friending where action = 'send') f1
left join
(select * from friending where action = 'accept') f2
on f1.target_id = f2.user_id and f2.user_id = f1.target_id
group by f1.ds;

#-------584
select * from customer;
select name from customer where referee_id != 2 or referee_id is null;


create table functions(x int, y int);
insert into functions values
(20,20),
(20,20),
(20,21),
(23,22),
(22,23),
(21,20);

select distinct f1.x, f1.y
from functions f1, functions f2
where f1.x = f2.y and f1.y = f2.x and f1.x <= f1.y
order by f1.x;


select * from employee;

select * from customer;

select * from stadium;


select * from stadium where people > 100;


select distinct s1.*
from stadium s1, stadium s2, stadium s3
where s1.people >=100 and s2.people >=100 and s3.people >= 100
and ((s1.date = s2.date-1 and s2.date = s3.date-1)
or (s2.date = s1.date-1 and s1.date = s3.date-1)
or (s3.date = s2.date-1 and s2.date = s1.date-1))
order by s1.id;


select * from request_accepted;

delete from request_accepted
where accept_date = '2016-06-10';


#580
create table student(
student_id int,
student_name varchar(50),
gender varchar(50),
dept_id int);

create table department(
dept_id int,
dept_name varchar(50));

insert into student values
(1, 'Jack', 'M', 1),
(2, 'Jane', 'F', 1),
(3, 'Mark', 'M', 2);

insert into department values
(1, 'Engineering'),
(2, 'Science'),
(3, 'Law');

select dept_name, 
count(case when student_id is not null then student_id else null end) student_number
from student s right join department d
on s.dept_id = d.dept_id
group by dept_name
order by student_number desc;


select * from employee;


#577
create table employee_577(
empId int,
name varchar(255),
supervisor int,
salary int);

insert into employee_577 values
(1, 'John', 3, 1000),
(2, 'Dan', 3, 2000),
(3, 'Brad', null, 4000),
(4, 'Thomas', 3, 4000);

create table bonus(
empId int,
bonus int);

insert into bonus values
(2, 500),
(4, 2000);


select name, bonus
from employee_577 e left join bonus b
on e.empId = b.empId
where bonus is null or bonus < 1000;

#574
create table candidate(id int, name varchar(50));

insert into candidate values
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');

create table vote(id int, candidate int);

insert into vote values
(1, 2),
(2, 4),
(3, 3),
(4, 2),
(5, 5);


select name
from candidate
where id = 
(select candidate
from vote
group by candidate
order by count(candidate) desc
limit 1);


select c.name
from candidate c, 
(select candidate
from vote
group by candidate
order by count(candidate) desc
limit 1) v
where c.id = v.candidate;


select * from salary;

select distinct salary from salary 
order by salary
limit 1 offset 1;

#579
drop table employee_579;

#618
create table student_618(
name varchar(50),
continent varchar(50));

insert into student_618 values
('Jack','America'),
('Pascal', 'Europe'),
('Xi', 'Asia'),
('Jane','America');

select @ame_id := 0, @asi_id := 0, @eur_id := 0;

select t1.America, t2.Asia
from
(select @ame_id := 0, @asi_id := 0, @eur_id := 0) t,
(select @ame_id :=@ame_id + 1 ame_id, 
case when continent = 'America' then name end as America
from student_618
where continent  = 'America') t1
left join
(select @asi_id :=@asi_id + 1 asi_id, 
case when continent = 'Asia' then name end as Asia
from student_618
where continent  = 'Asia') t2
on t1.ame_id = t2.asi_id
;


select row_id, America
from 
(select @am := 0) t,
(select @am := @am + 1 as row_id, name as America
from student_618
where continent = 'America'
order by America) as t1;

select row_id, Europe
from 
(select @am := 0) t,
(select @am := @am + 1 as row_id, name as Europe
from student_618
where continent = 'Europe'
order by Europe) as t2;


select row_id, Asia
from 
(select @am := 0) t,
(select @am := @am + 1 as row_id, name as Asia
from student_618
where continent = 'Asia'
order by Asia) as t3;

#614
create table follow(
followee varchar(25),
follower varchar(25));

select * from follow;

select followee as follower, count(follower) as num
from follow 
where followee in 
(select distinct follower 
from follow)
group by followee;

CREATE  TABLE StudentScores(
   UserName        VARCHAR(20),        
   Subject         VARCHAR(30),       
   Score           float              
);


INSERT INTO StudentScores values 
('zhangsan', 'Chinese', 80),
('zhangsan', 'Math', 90),
('zhangsan', 'English', 70),
('zhangsan', 'Biography', 85),
('lisi', 'Chinese', 80),
('lisi', 'Math', 92),
('lisi', 'English', 76),
('lisi', 'Biography', 88),
('wangwu', 'Chinese', 60),
('wangwu', 'Math', 82),
('wangwu', 'English', 96),
('wangwu', 'Biography', 78);


























