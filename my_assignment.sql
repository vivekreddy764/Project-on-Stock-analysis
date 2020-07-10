-- create database assignment_upgrad
-- use assignment_upgrad

create table bajaj_motors 
(
  Date date,
  open_price float(8,2),
  high_price float(8,2),
  low_price float(8,2),
  close_price float(8,2),
  wap float(8,2),
  no_of_shares bigint,
  no_of_trades bigint,
  total_turnover bigint,
  deliverable_quantity bigint,
  percent_Deli_Qty_to_Traded_Qty float(4,2),
  spread_high_low float(8,2),
  spread_close_open float(8,2)
);


create table eicher_motors
(
  Date date,
  open_price float(8,2),
  high_price float(8,2),
  low_price float(8,2),
  close_price float(8,2),
  wap float(8,2),
  no_of_shares bigint,
  no_of_trades bigint,
  total_turnover bigint,
  deliverable_quantity bigint,
  percent_Deli_Qty_to_Traded_Qty float(4,2),
  spread_high_low float(8,2),
  spread_close_open float(8,2)
);


create table hero_motors
(
  Date date,
  open_price float(8,2),
  high_price float(8,2),
  low_price float(8,2),
  close_price float(8,2),
  wap float(8,2),
  no_of_shares bigint,
  no_of_trades bigint,
  total_turnover bigint,
  deliverable_quantity bigint,
  percent_Deli_Qty_to_Traded_Qty float(4,2),
  spread_high_low float(8,2),
  spread_close_open float(8,2)
);


create table tcs_comp
(
  Date date,
  open_price float(8,2),
  high_price float(8,2),
  low_price float(8,2),
  close_price float(8,2),
  wap float(8,2),
  no_of_shares bigint,
  no_of_trades bigint,
  total_turnover bigint,
  deliverable_quantity bigint,
  percent_Deli_Qty_to_Traded_Qty float(4,2),
  spread_high_low float(8,2),
  spread_close_open float(8,2)
);


create table tvs_motors
(
  Date date,
  open_price float(8,2),
  high_price float(8,2),
  low_price float(8,2),
  close_price float(8,2),
  wap float(8,2),
  no_of_shares bigint,
  no_of_trades bigint,
  total_turnover bigint,
  deliverable_quantity bigint,
  percent_Deli_Qty_to_Traded_Qty float(4,2),
  spread_high_low float(8,2),
  spread_close_open float(8,2)
);

/* now we have to insert the data into the tables these can be done in two ways
we have to insert by insert command or importing a file method, using insert comand
will get harder so to optimize the query we user import file method */

-- we have to repeat the above query for all the tables so that we can rectify the data truncate error
alter table tvs_motors
modify spread_close_open decimal(8,2);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bajaj.csv'
into table bajaj_motors
fields terminated by ","
lines terminated by  "\n"
ignore 1 rows -- by not adding the below row it gives date format error
(@date,open_price,high_price,low_price,close_price,wap,no_of_shares,no_of_trades,
total_turnover,@deliverable_quantity,@percent_Deli_Qty_to_Traded_Qty,spread_high_low, 
spread_close_open)
set
 date = str_to_date(@date, '%d-%M-%Y'),
 deliverable_quantity = nullif(@deliverable_quantity,''),
 percent_Deli_Qty_to_Traded_Qty = nullif(@percent_Deli_Qty_to_Traded_Qty,'');
 
-- set SQL_SAFE_UPDATES = 0;


-- SHOW VARIABLES LIKE "secure_file_priv";


-- select * from bajaj_motors 

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Eicher.csv'
into table eicher_motors
fields terminated by ","
lines terminated by  "\n"
ignore 1 rows 
(@date,open_price,high_price,low_price,close_price,wap,no_of_shares,no_of_trades,
total_turnover,@deliverable_quantity,@percent_Deli_Qty_to_Traded_Qty,spread_high_low, 
spread_close_open)
set
 date = str_to_date(@date, '%d-%M-%Y'),
 deliverable_quantity = nullif(@deliverable_quantity,''),
 percent_Deli_Qty_to_Traded_Qty = nullif(@percent_Deli_Qty_to_Traded_Qty,'');
 
 -- select * from eicher_motors
 
 load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hero.csv'
into table hero_motors
fields terminated by ","
lines terminated by  "\n"
ignore 1 rows
(@date,open_price,high_price,low_price,close_price,wap,no_of_shares,no_of_trades,
total_turnover,@deliverable_quantity,@percent_Deli_Qty_to_Traded_Qty,spread_high_low, 
spread_close_open)
set
 date = str_to_date(@date, '%d-%M-%Y'),
 deliverable_quantity = nullif(@deliverable_quantity,''),
 percent_Deli_Qty_to_Traded_Qty = nullif(@percent_Deli_Qty_to_Traded_Qty,'');
 
 -- select * from hero_motors
 
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Infosys.csv'
into table infosys_comp
fields terminated by ","
lines terminated by  "\n"
ignore 1 rows
(@date,open_price,high_price,low_price,close_price,wap,no_of_shares,no_of_trades,
total_turnover,@deliverable_quantity,@percent_Deli_Qty_to_Traded_Qty,spread_high_low, 
spread_close_open)
set
 date = str_to_date(@date, '%d-%M-%Y'),
 deliverable_quantity = nullif(@deliverable_quantity,''),
 percent_Deli_Qty_to_Traded_Qty = nullif(@percent_Deli_Qty_to_Traded_Qty,'');
 
 -- select * from infosys_comp
 
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TCS.csv'
into table tcs_comp
fields terminated by ","
lines terminated by  "\n"
ignore 1 rows -- by not adding the below row it gives date format error and out of range errors
(@date,open_price,high_price,low_price,close_price,wap,no_of_shares,no_of_trades,
total_turnover,@deliverable_quantity,@percent_Deli_Qty_to_Traded_Qty,spread_high_low, 
spread_close_open)
set
 date = str_to_date(@date, '%d-%M-%Y'),
 deliverable_quantity = nullif(@deliverable_quantity,''),
 percent_Deli_Qty_to_Traded_Qty = nullif(@percent_Deli_Qty_to_Traded_Qty,'');
 
-- select * from tcs_comp


load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TVS Motors.csv'
into table tvs_motors
fields terminated by ","
lines terminated by  "\n"
ignore 1 rows -- by not adding the below row it gives date format error and out of range errors
(@date,open_price,high_price,low_price,close_price,wap,no_of_shares,no_of_trades,
total_turnover,@deliverable_quantity,@percent_Deli_Qty_to_Traded_Qty,spread_high_low, 
spread_close_open)
set
 date = str_to_date(@date, '%d-%M-%Y'),
 deliverable_quantity = nullif(@deliverable_quantity,''),
 percent_Deli_Qty_to_Traded_Qty = nullif(@percent_Deli_Qty_to_Traded_Qty,'');
 
 -- select * from tvs_motors

/* now the data is imported sucessfully then here comes the question first we have to create a table 
bajaj1 with columns date,close price,20 day ma, and 50 day ma this has to be done for all data sets 
so lets do it*/

create table eicher1
(
rou_num int,
date date,
close_price float(8,2),
20_day_ma float(8,2),
50_day_ma float(8,2)
);

create table hero1
(
rou_num int,
date date,
close_price float(8,2),
20_day_ma float(8,2),
50_day_ma float(8,2)
);

create table infosys1
(
rou_num int,
date date,
close_price float(8,2),
20_day_ma float(8,2),
50_day_ma float(8,2)
);

create table tcs1
(
rou_num int,
date date,
close_price float(8,2),
20_day_ma float(8,2),
50_day_ma float(8,2)
);

create table tvs1
(
rou_num int,
date date,
close_price float(8,2),
20_day_ma float(8,2),
50_day_ma float(8,2)
);

-- select * from bajaj1

insert into eicher1 (rou_num,date,close_price,20_day_ma,50_day_ma)
select row_number() over w,date,close_price,
if((row_number() over w) >19,Avg(close_price) over (order by date asc rows 19 preceding),null),
if((row_number() over w)>49,avg(close_price) over (order by date asc rows 49 preceding),null)
from eicher_motors
window w as (order by date asc);

-- select * from eicher1

insert into hero1 (rou_num,date,close_price,20_day_ma,50_day_ma)
select row_number() over w,date,close_price,
if((row_number() over w) >19,Avg(close_price) over (order by date asc rows 19 preceding),null),
if((row_number() over w)>49,avg(close_price) over (order by date asc rows 49 preceding),null)
from hero_motors
window w as (order by date asc);

-- select * from hero1

insert into infosys1 (rou_num,date,close_price,20_day_ma,50_day_ma)
select row_number() over w,date,close_price,
if((row_number() over w) >19,Avg(close_price) over (order by date asc rows 19 preceding),null),
if((row_number() over w)>49,avg(close_price) over (order by date asc rows 49 preceding),null)
from infosys_comp
window w as (order by date asc);

-- select * from infosys1

insert into tcs1 (rou_num,date,close_price,20_day_ma,50_day_ma)
select row_number() over w,date,close_price,
if((row_number() over w) >19,Avg(close_price) over (order by date asc rows 19 preceding),null),
if((row_number() over w)>49,avg(close_price) over (order by date asc rows 49 preceding),null)
from tcs_comp
window w as (order by date asc);

-- select * from tcs1

insert into tvs1 (rou_num,date,close_price,20_day_ma,50_day_ma)
select row_number() over w,date,close_price,
if((row_number() over w) >19,Avg(close_price) over (order by date asc rows 19 preceding),null),
if((row_number() over w)>49,avg(close_price) over (order by date asc rows 49 preceding),null)
from tvs_motors
window w as (order by date asc);

-- select * from tvs1

/* creating master table for all compay with their close prices */

create table master_table
(
Date date,
Bajaj float(8,2),
Eicher float(8,2),
Hero float(8,2),
Infosys float(8,2),
Tcs float(8,2),
Tvs float(8,2)
);

insert into master_table (date,Bajaj,Eicher,Hero,Infosys,Tcs,Tvs)
select b.date,b.close_price,e.close_price,h.close_price,i.close_price,t.close_price,v.close_price
from bajaj_motors b
left join eicher_motors e on b.date=e.date
left join hero_motors h on b.date=h.date
left join infosys_comp i on b.date=i.date
left join tcs_comp t on b.date=t.date
left join tvs_motors v on b.date=v.date;

-- select * from master_table

/* creating buy sell hold signals i have created their signals in their new resp
-ective tables like bajaj2 it contains the signals for its stock*/

create table bajaj2
(
Date date,
close_price float(8,2),
signal_stock varchar(50)
);

insert into bajaj2(date,close_price,signal_stock)
select date,close_price,
case when 20_day_ma > 50_day_ma then 'buy'
when 20_day_ma < 50_day_ma then 'sell'
else 'hold' 
end
from  bajaj1;


-- select *from bajaj2


create table eicher2
(
Date date,
close_price float(8,2),
signal_stock varchar(50)
);

insert into eicher2(date,close_price,signal_stock)
select date,close_price,
case when 20_day_ma > 50_day_ma then 'buy'
when 20_day_ma < 50_day_ma then 'sell'
else 'hold' 
end
from  eicher1;

-- select * from eicher2


create table hero2
(
Date date,
close_price float(8,2),
signal_stock varchar(50)
);

insert into hero2(date,close_price,signal_stock)
select date,close_price,
case when 20_day_ma > 50_day_ma then 'buy'
when 20_day_ma < 50_day_ma then 'sell'
else 'hold' 
end
from  hero1;


create table infosys2
(
Date date,
close_price float(8,2),
signal_stock varchar(50)
);

insert into infosys2(date,close_price,signal_stock)
select date,close_price,
case when 20_day_ma > 50_day_ma then 'buy'
when 20_day_ma < 50_day_ma then 'sell'
else 'hold' 
end
from  infosys1;

create table tcs2
(
Date date,
close_price float(8,2),
signal_stock varchar(50)
);

insert into tcs2(date,close_price,signal_stock)
select date,close_price,
case when 20_day_ma > 50_day_ma then 'buy'
when 20_day_ma < 50_day_ma then 'sell'
else 'hold' 
end
from  tcs1;



create table tvs2
(
Date date,
close_price float(8,2),
signal_stock varchar(50)
);

insert into tvs2(date,close_price,signal_stock)
select date,close_price,
case when 20_day_ma > 50_day_ma then 'buy'
when 20_day_ma < 50_day_ma then 'sell'
else 'hold' 
end
from  tvs1;

/*creating the user defined function */

delimiter $$
create function signel_checker (s date)
returns varchar(50) 
deterministic
begin
declare s_value varchar(10);
set s_value = (select signal_stock from bajaj2 where date = s limit 1);
return s_value;
end
$$
delimiter ;


select signel_checker('2015-01-01') as 'signal'














 
 







