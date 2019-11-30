#api에서 200위까지의 유저 정보를 받아옴
import requests, json
import re


def crawling_func():
    region = 'kr'
    URL = 'https://api.brawlstars.com/v1/rankings/' + region + '/players'
    token=''
    headers = {'authorization' : 'Bearer ' + token, 'Content-Type' : 'application/json;charset=UTF-8'}
    response = requests.get(URL, headers=headers)
    data = response.json()
    return data
