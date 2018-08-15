select * from page_view limit 5;

select * from events limit 5;

#1
select count(*) 
from events 
where event_name = 'Created account';

#2
select count(distinct distinct_id)
from page_view
where page_type = 'pages#home';

select count(distinct p.distinct_id)
from page_view p, events e
where p.distinct_id = e.distinct_id
and p.page_type = 'pages#home' 
and e.event_name = 'Created account';

select 
(select count(distinct p.distinct_id) from page_view p, events e
where p.distinct_id = e.distinct_id
and p.page_type = 'pages#home' 
and e.event_name = 'Created account')/count(distinct distinct_id)
from page_view
where page_type = 'pages#home';

select concat(left((1635/13461)*100, 5), '%');

#3










