/*인기있는 모드*/
select event_mode, count(event_mode) as mode_count
from battlelog
group by event_mode
order by mode_count desc;

/*인기있는 맵*/
select event_mode, event_map, count(event_map) as count
from battlelog
group by event_mode, event_map
order by count desc;

/*브롤스타즈에서 가장 인기있는 브롤러*/
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

/*맵별 가장 인기있는 브롤러*/
select *, count(*) as count
from (select event_mode, event_map, battle_teams_0_0_brawler_name as brawler from battlelog
union all
select event_mode, event_map, battle_teams_0_1_brawler_name from battlelog
union all
select event_mode, event_map, battle_teams_0_2_brawler_name from battlelog
union all
select event_mode, event_map, battle_teams_1_0_brawler_name from battlelog
union all
select event_mode, event_map, battle_teams_1_1_brawler_name from battlelog
union all
select event_mode, event_map, battle_teams_1_2_brawler_name from battlelog) as a
group by event_mode, event_map, a.brawler
order by count desc;


/*맵별 가장 승률이 높은 조합*/
DROP TABLE IF EXISTS team_list;
create table team_list as
select event_mode, event_map,battle_result,
  case playerTag
  when battle_teams_0_0_tag then 'teamA'
  when battle_teams_0_1_tag then 'teamA'
  when battle_teams_0_2_tag then 'teamA'
  when battle_teams_1_0_tag then 'teamB'
  when battle_teams_1_1_tag then 'teamB'
  when battle_teams_1_2_tag then 'teamB'
  end  as team,
  battle_teams_0_0_brawler_name as teamA_1,
  battle_teams_0_1_brawler_name as teamA_2,
  battle_teams_0_2_brawler_name as teamA_3,
  battle_teams_1_0_brawler_name as teamB_1,
  battle_teams_1_1_brawler_name as teamB_2,
  battle_teams_1_2_brawler_name as teamB_3
from battlelog;

DROP TABLE IF EXISTS win;
create table win as
select event_mode, event_map, teamA_1 as player1, teamA_2 as player2, teamA_3 as player3
from team_list
where team= 'teamA' and battle_result = 'victory'
union all
select event_mode, event_map, teamB_1 as player1, teamB_2 as player2, teamB_3 as player3
from team_list
where team= 'teamA' and battle_result = 'defeat'
union all
select event_mode, event_map, teamB_1 as player1, teamB_2 as player2, teamB_3 as player3
from team_list
where team= 'teamB' and battle_result = 'victory'
union all
select event_mode, event_map, teamA_1 as player1, teamA_2 as player2, teamA_3 as player3
from team_list
where team= 'teamB' and battle_result = 'defeat';

select *, count(*) as count
from (select event_mode, event_map,
		  case when player1 < player2 and player1 < player3 then
			   (case when player2 < player3 then concat(player1, ',', player2, ',', player3)
					when player3 < player2 then concat(player1, ',', player3, ',', player2)
			   end)
			   when player2 < player1 and player2 < player3 then
			   (case when player1 < player3 then concat(player2, ',', player1, ',', player3)
					when player3 < player1 then concat(player2, ',', player3, ',', player1)
			   end)
			   when player3 < player1 and player3 < player2 then
			   (case when player1 < player2 then concat(player3, ',', player1, ',', player2)
					when player2 < player1 then concat(player3, ',', player2, ',', player1)
		 	   end)
	 	  end as pick
		  from win) as t1
group by event_mode, event_map, pick
order by count desc;
