
/*인기있는 모드*/
select event_mode, count(event_mode) as mode_count
from re_battlelog
group by event_mode
order by mode_count desc;

/*인기있는 맵*/
select event_mode, event_map, count(event_map) as count
from re_battlelog
group by event_mode, event_map
order by count desc;

/*브롤스타즈에서 가장 인기있는 브롤러*/

/*맵별 가장 인기있는 브롤러*/

/*맵별 가장 승률이 높은 브롤러*/

/*맵별 가장 승률이 높은 조합*/




select concat(battle_teams_0_0_brawler_name, ',', battle_teams_0_1_brawler_name, ',', battle_teams_0_2_brawler_name) as teamA,
        concat(battle_teams_1_0_brawler_name, ',', battle_teams_1_1_brawler_name, ',', battle_teams_1_2_brawler_name) as teamB
from re_battlelog;

select battle_result,
  case playerTag
  when battle_teams_0_0_tag then 'teamA'
  when battle_teams_0_1_tag then 'teamA'
  when battle_teams_0_2_tag then 'teamA'
  when battle_teams_1_0_tag then 'teamB'
  when battle_teams_1_1_tag then 'teamB'
  when battle_teams_1_2_tag then 'teamB'
  end
from re_battlelog
