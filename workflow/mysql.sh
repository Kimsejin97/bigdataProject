mysql --defaults-file=.my.cnf -e "use brawlstars;DROP TABLE IF EXISTS re_battlelog;create table re_battlelog select distinct * from battlelog;Truncate battlelog;"
