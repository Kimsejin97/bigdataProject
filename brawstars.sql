CREATE DATABASE brawlstars;
USE brawlstars;

CREATE TABLE ranking (
    tag VARCHAR(20) NOT NULL,
    primary key(tag)
);

CREATE TABLE re_ranking (
    tag VARCHAR(20) NOT NULL,
    primary key(tag)
);

CREATE TABLE battlelog (
    battleTime VARCHAR(45) NOT NULL,
    event_mode VARCHAR(45) NOT NULL,
    event_map VARCHAR(45) NOT NULL,
    battle_result VARCHAR(20) NOT NULL,
    battle_teams_0_0_brawler_name VARCHAR(45),
    battle_teams_0_0_brawler_power INT,
    battle_teams_0_0_brawler_trophies INT,
    battle_teams_0_1_brawler_name VARCHAR(45),
    battle_teams_0_1_brawler_power INT,
    battle_teams_0_1_brawler_trophies INT,
    battle_teams_0_2_brawler_name VARCHAR(45),
    battle_teams_0_2_brawler_power INT,
    battle_teams_0_2_brawler_trophies INT,
    battle_teams_1_0_brawler_name VARCHAR(45),
    battle_teams_1_0_brawler_power INT,
    battle_teams_1_0_brawler_trophies INT,
    battle_teams_1_1_brawler_name VARCHAR(45),
    battle_teams_1_1_brawler_power INT,
    battle_teams_1_1_brawler_trophies INT,
    battle_teams_1_2_brawler_name VARCHAR(45),
    battle_teams_1_2_brawler_power INT,
    battle_teams_1_2_brawler_trophies INT,
    playerTag VARCHAR(20) NOT NULL,
    PRIMARY KEY (battleTime , playerTag)
);


alter table battlelog drop event_id;
alter table battlelog drop battle_type;
alter table battlelog drop battle_mode;
alter table battlelog drop battle_duration;
alter table battlelog drop battle_trophyChange;
alter table battlelog drop battle_starPlayer_tag;
alter table battlelog drop battle_starPlayer_brawler_id;
alter table battlelog drop battle_starPlayer_brawler_name;
alter table battlelog drop battle_starPlayer_brawler_power;
alter table battlelog drop battle_starPlayer_brawler_trophies;
alter table battlelog drop battle_teams_0_0_tag;
alter table battlelog drop battle_teams_0_0_brawler_id;
alter table battlelog drop battle_teams_0_1_tag;
alter table battlelog drop battle_teams_0_1_brawler_id;
alter table battlelog drop battle_teams_0_2_tag;
alter table battlelog drop battle_teams_0_2_brawler_id;
alter table battlelog drop battle_teams_1_0_tag;
alter table battlelog drop battle_teams_1_0_brawler_id;
alter table battlelog drop battle_teams_1_1_tag;
alter table battlelog drop battle_teams_1_1_brawler_id;
alter table battlelog drop battle_teams_1_2_tag;
alter table battlelog drop battle_teams_1_2_brawler_id;

select battleTime, playerTag, count(*) as A 
from battlelog 
group by battleTime, playerTag
having A>1;

select * from battlelog;
select * from re_ranking;