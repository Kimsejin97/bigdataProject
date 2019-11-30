select a.brawler as brawler, count(*) as count
from (select battle_teams_0_0_brawler_name as brawler from battlelog
union all
select battle_teams_0_1_brawler_name from battlelog
union all
select battle_teams_0_2_brawler_name from battlelog
union all
select battle_teams_1_0_brawler_name from battlelog
union all
select battle_teams_1_1_brawler_name from battlelog
union all
select battle_teams_1_2_brawler_name from battlelog) as a
group by a.brawler
order by count desc;
