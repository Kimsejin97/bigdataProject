import requests, json
import re
import pandas as pd
from pandas.io.json import json_normalize
from flatten_json import flatten

# 플레이어태그
playerTag = '#202CJRR98'
playerTag= playerTag.replace('#', '%23')

#API URL INFO
URL = 'https://api.brawlstars.com/v1/players/' + playerTag + '/battlelog'
## TOKEN
token = ''
##HEADER INFO
headers = {'authorization' : 'Bearer ' + token, 'Content-Type' : 'application/json;charset=UTF-8'}

# READ API
response = requests.get(URL, headers=headers)
# CONVERT TO DICT
data = response.json()
# data = data["items"][0]["event"]
# data_set = []
# for i in data["items"]:
#     if i["event"]["mode"] == 'gemGrab':
#         data_set.append()

for i in data['items']:
    data_set = [x for x in data['items']
                if (x['event']['mode'] == 'gemGrab'
                    or x['event']['mode'] == 'heist'
                    or x['event']['mode'] == 'brawlBall'
                    or x['event']['mode'] == 'bounty'
                    or x['event']['mode'] == 'siege')]

battle_log = (flatten(data) for data in data_set)
df = pd.DataFrame(battle_log)

print(df)
