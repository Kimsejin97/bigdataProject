DROP TABLE IF EXISTS re_battlelog;
create table re_battlelog
select distinct * from battlelog;


DROP TABLE IF EXISTS final_battlelog;


create table final_battlelog
select *
from (select distinct battleTime, battle_teams_0_0_tag
		from re_battlelog) as final;


select * from re_battlelog;
select * from final_battlelog;