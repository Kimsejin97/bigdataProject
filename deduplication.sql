DROP TABLE IF EXISTS re_battlelog;
create table re_battlelog
select distinct * from battlelog;