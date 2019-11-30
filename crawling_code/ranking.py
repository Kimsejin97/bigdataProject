#랭킹 크롤링함수 호출, 랭킹정보 중 tag만 mysql의 ranking테이블에 저장
import crawling_ranking
import DB_connection
import pandas as pd
from flatten_json import flatten


data = crawling_ranking.crawling_func()
ranking = (flatten(data) for data in data['items'])
ranking_df = pd.DataFrame(ranking)

ranking_df = ranking_df['tag']

ranking_df.to_sql(name='ranking', con = DB_connection.engine, if_exists='replace', index = False)

conn = DB_connection.engine.connect()
result = conn.execute("INSERT IGNORE INTO re_ranking SELECT * FROM ranking")
conn.close()
