import requests, json
import re
import pandas as pd

# 지역코드
region = 'kr'
#API URL INFO
URL = 'https://api.brawlstars.com/v1/rankings/' + region + '/players'
## TOKEN
token = ''
##HEADER INFO
headers = {'authorization' : 'Bearer ' + token, 'Content-Type' : 'application/json;charset=UTF-8'}

# READ API
response = requests.get(URL, headers=headers)
# CONVERT TO DICT
data_set = response.json()

df = pd.DataFrame()

index = 0
for i in data_set['items']:
    tempdata = pd.DataFrame([
        i['tag'],
        i['name'],
        i['nameColor'],
        i['trophies'],
        i['rank'],
    ], index=['tag', 'name', 'nameColor', 'trophies', 'rank'])
    df = df.append(tempdata.T)

print(df)
