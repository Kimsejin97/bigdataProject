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