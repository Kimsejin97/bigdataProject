 # -*- coding: utf8 -*-
import DB_connection

import requests, json
import re
import pandas as pd
from flatten_json import flatten

from sqlalchemy import *
from sqlalchemy import exc
from sqlalchemy.orm import sessionmaker

Session = sessionmaker()
Session.configure(bind = DB_connection.engine)
session = Session()

sql = text('select tag from re_ranking')
result = session.execute(sql)
tags = [row[0] for row in result]

for tag in range(len(tags)):
    playerTag = tags[tag]
    rePlayerTag= playerTag.replace('#', '%23')
    URL = 'https://api.brawlstars.com/v1/players/' + rePlayerTag + '/battlelog'
    token=''
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

    for i in data_set:
        try:
            del i['battle']['trophyChange']
            del i['battle']['starPlayer']['brawler']['power']
            del i['battle']['starPlayer']['brawler']['trophies']
        except: pass
        del i['event']['id']
        del i['battle']['mode']
        del i['battle']['type']
        del i['battle']['duration']
        del i['battle']['starPlayer']['tag']
        del i['battle']['starPlayer']['name']
        del i['battle']['starPlayer']['brawler']['id']
        del i['battle']['starPlayer']['brawler']['name']
        del i['battle']['starPlayer']['brawler']
        del i['battle']['starPlayer']
        del i['battle']['teams'][0][0]['name']
        del i['battle']['teams'][0][1]['name']
        del i['battle']['teams'][0][2]['name']
        del i['battle']['teams'][1][0]['name']
        del i['battle']['teams'][1][1]['name']
        del i['battle']['teams'][1][2]['name']
        del i['battle']['teams'][0][0]['brawler']['id']
        del i['battle']['teams'][0][2]['brawler']['id']
        del i['battle']['teams'][1][0]['brawler']['id']
        del i['battle']['teams'][1][1]['brawler']['id']
        del i['battle']['teams'][1][2]['brawler']['id']


    battle_log = (flatten(d) for d in data_set)
    battlelog_df = pd.DataFrame(battle_log)

    playerTag = tags[tag]
    battlelog_df['playerTag'] = playerTag

    battlelog_df.to_sql(name="battlelog", con = DB_connection.engine, if_exists='append', index = False)
