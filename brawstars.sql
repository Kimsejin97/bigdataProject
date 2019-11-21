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
    battle_teams_0_0_tag VARCHAR(20),
    battle_teams_0_0_brawler_name VARCHAR(45),
    battle_teams_0_0_brawler_power INT,
    battle_teams_0_0_brawler_trophies INT,
    battle_teams_0_1_tag VARCHAR(20),
    battle_teams_0_1_brawler_name VARCHAR(45),
    battle_teams_0_1_brawler_power INT,
    battle_teams_0_1_brawler_trophies INT,
    battle_teams_0_2_tag VARCHAR(20),
    battle_teams_0_2_brawler_name VARCHAR(45),
    battle_teams_0_2_brawler_power INT,
    battle_teams_0_2_brawler_trophies INT,
    battle_teams_1_0_tag VARCHAR(20),
    battle_teams_1_0_brawler_name VARCHAR(45),
    battle_teams_1_0_brawler_power INT,
    battle_teams_1_0_brawler_trophies INT,
    battle_teams_1_1_tag VARCHAR(20),
    battle_teams_1_1_brawler_name VARCHAR(45),
    battle_teams_1_1_brawler_power INT,
    battle_teams_1_1_brawler_trophies INT,
    battle_teams_1_2_tag VARCHAR(20),
    battle_teams_1_2_brawler_name VARCHAR(45),
    battle_teams_1_2_brawler_power INT,
    battle_teams_1_2_brawler_trophies INT,
    playerTag VARCHAR(20) NOT NULL,
    PRIMARY KEY (battleTime , playerTag)
);


select battleTime, playerTag, count(*) as A
from battlelog
group by battleTime, playerTag
having A>1;

select * from battlelog;
select * from re_ranking;
