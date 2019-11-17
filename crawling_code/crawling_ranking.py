 # -*- coding: utf8 -*-
import requests, json
import re


def crawling_func():
    # 지역코드
    region = 'kr'
    #API URL INFO
    URL = 'https://api.brawlstars.com/v1/rankings/' + region + '/players'
    # TOKEN
    token = ''
    #HEADER INFO
    headers = {'authorization' : 'Bearer ' + token, 'Content-Type' : 'application/json;charset=UTF-8'}
    # READ API
    response = requests.get(URL, headers=headers)
    # CONVERT TO DICT
    data = response.json()

    return data
