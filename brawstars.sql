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
    event_id INT,
    event_mode VARCHAR(45) NOT NULL,
    event_map VARCHAR(45) NOT NULL,
    battle_mode VARCHAR(45) NOT NULL,
    battle_type VARCHAR(20) NOT NULL,
    battle_result VARCHAR(20) NOT NULL,
    battle_duration INT,
    battle_trophyChange VARCHAR(20),
    battle_starPlayer_tag VARCHAR(20),
    battle_starPlayer_brawler_id INT,
    battle_starPlayer_brawler_name VARCHAR(45),
    battle_starPlayer_brawler_power INT,
    battle_starPlayer_brawler_trophies INT,
    battle_teams_0_0_tag VARCHAR(20),
    battle_teams_0_0_brawler_id INT,
    battle_teams_0_0_brawler_name VARCHAR(45),
    battle_teams_0_0_brawler_power INT,
    battle_teams_0_0_brawler_trophies INT,
    battle_teams_0_1_tag VARCHAR(20),
    battle_teams_0_1_brawler_id INT,
    battle_teams_0_1_brawler_name VARCHAR(45),
    battle_teams_0_1_brawler_power INT,
    battle_teams_0_1_brawler_trophies INT,
    battle_teams_0_2_tag VARCHAR(20),
    battle_teams_0_2_brawler_id INT,
    battle_teams_0_2_brawler_name VARCHAR(45),
    battle_teams_0_2_brawler_power INT,
    battle_teams_0_2_brawler_trophies INT,
	battle_teams_1_0_tag VARCHAR(20),
    battle_teams_1_0_brawler_id INT,
    battle_teams_1_0_brawler_name VARCHAR(45),
    battle_teams_1_0_brawler_power INT,
    battle_teams_1_0_brawler_trophies INT,
    battle_teams_1_1_tag VARCHAR(20),
    battle_teams_1_1_brawler_id INT,
    battle_teams_1_1_brawler_name VARCHAR(45),
    battle_teams_1_1_brawler_power INT,
    battle_teams_1_1_brawler_trophies INT,
    battle_teams_1_2_tag VARCHAR(20),
    battle_teams_1_2_brawler_id INT,
    battle_teams_1_2_brawler_name VARCHAR(45),
    battle_teams_1_2_brawler_power INT,
    battle_teams_1_2_brawler_trophies INT,
    playerTag VARCHAR(20) NOT NULL,
    primary key (battleTime,playerTag)
);

CREATE TABLE re_battlelog (
    battleTime VARCHAR(45) NOT NULL,
    event_id INT,
    event_mode VARCHAR(45) NOT NULL,
    event_map VARCHAR(45) NOT NULL,
    battle_mode VARCHAR(45) NOT NULL,
    battle_type VARCHAR(20) NOT NULL,
    battle_result VARCHAR(20) NOT NULL,
    battle_duration INT,
    battle_trophyChange VARCHAR(20),
    battle_starPlayer_tag VARCHAR(20),
    battle_starPlayer_brawler_id INT,
    battle_starPlayer_brawler_name VARCHAR(45),
    battle_starPlayer_brawler_power INT,
    battle_starPlayer_brawler_trophies INT,
    battle_teams_0_0_tag VARCHAR(20),
    battle_teams_0_0_brawler_id INT,
    battle_teams_0_0_brawler_name VARCHAR(45),
    battle_teams_0_0_brawler_power INT,
    battle_teams_0_0_brawler_trophies INT,
    battle_teams_0_1_tag VARCHAR(20),
    battle_teams_0_1_brawler_id INT,
    battle_teams_0_1_brawler_name VARCHAR(45),
    battle_teams_0_1_brawler_power INT,
    battle_teams_0_1_brawler_trophies INT,
    battle_teams_0_2_tag VARCHAR(20),
    battle_teams_0_2_brawler_id INT,
    battle_teams_0_2_brawler_name VARCHAR(45),
    battle_teams_0_2_brawler_power INT,
    battle_teams_0_2_brawler_trophies INT,
    battle_teams_1_0_tag VARCHAR(20),
    battle_teams_1_0_brawler_id INT,
    battle_teams_1_0_brawler_name VARCHAR(45),
    battle_teams_1_0_brawler_power INT,
    battle_teams_1_0_brawler_trophies INT,
    battle_teams_1_1_tag VARCHAR(20),
    battle_teams_1_1_brawler_id INT,
    battle_teams_1_1_brawler_name VARCHAR(45),
    battle_teams_1_1_brawler_power INT,
    battle_teams_1_1_brawler_trophies INT,
    battle_teams_1_2_tag VARCHAR(20),
    battle_teams_1_2_brawler_id INT,
    battle_teams_1_2_brawler_name VARCHAR(45),
    battle_teams_1_2_brawler_power INT,
    battle_teams_1_2_brawler_trophies INT,
    playerTag VARCHAR(20) NOT NULL,
    PRIMARY KEY (battleTime , playerTag)
);

drop table battlelog;
drop table re_battlelog;
select * from battlelog;