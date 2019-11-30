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