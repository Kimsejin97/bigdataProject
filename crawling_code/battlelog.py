import DB_connection

import requests, json
import re
import pandas as pd
from flatten_json import flatten

tags = DB_connection.tags

for tag in range(len(tags)):
    playerTag = tags[tag]
    rePlayerTag= playerTag.replace('#', '%23')
    URL = 'https://api.brawlstars.com/v1/players/' + rePlayerTag + '/battlelog'
    token = ''
    headers = {'authorization' : 'Bearer ' + token, 'Content-Type' : 'application/json;charset=UTF-8'}
    response = requests.get(URL, headers=headers)
    data = response.json()

    for i in data['items']:
        data_set = [x for x in data['items']
                    if (x['event']['mode'] == 'gemGrab'
                        or x['event']['mode'] == 'heist'
                        or x['event']['mode'] == 'brawlBall'
                        or x['event']['mode'] == 'bounty'
                        or x['event']['mode'] == 'siege')]

    battle_log = (flatten(data) for data in data_set)
    battlelog_df = pd.DataFrame(battle_log)

    playerTag = tags[tag]
    battlelog_df['playerTag'] = playerTag
    cols = battlelog_df.columns.tolist()
    cols = cols[-1:] + cols[:-1]
    battlelog_df = battlelog_df[cols]
    # battlelog_df.columns = ['battleTime','evnetId','eventMode','map', 'battleMode','type','result','duration','trophyChange'
    #  ,'starPlayer_tag','starPlayer_name','starPlayer_brawler_id','starPlayer_brawler_name','starPlayer_brawler_power','starPlayer_brawler_trophies'
    #  ,'player1_tag','player1_name','player1_brawler_id','player1_brawler_name','player1_brawler_power','player1_brawler_trophies'
    #  ,'player2_tag','player2_name','player2_brawler_id','player2_brawler_name','player2_brawler_power','player2_brawler_trophies'
    #  ,'player3_tag','player3_name','player3_brawler_id','player3_brawler_name','player3_brawler_power','player3_brawler_trophies'
    #  ,'player4_tag','player4_name','player4_brawler_id','player4_brawler_name','player4_brawler_power','player4_brawler_trophies'
    #  ,'player5_tag','player5_name','player5_brawler_id','player5_brawler_name','player5_brawler_power','player5_brawler_trophies'
    #  ,'player6_tag','player6_name','player6_brawler_id','player6_brawler_name','player6_brawler_power','player6_brawler_trophies'
    #  ,'playerTag']

    battlelog_df.to_sql(name='battlelog', con = DB_connection.engine, if_exists='append', index = False)
