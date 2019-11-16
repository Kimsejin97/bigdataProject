import crawling_ranking
import DB_connection

import pandas as pd
from flatten_json import flatten

data = crawling_ranking.crawling_func()
ranking = (flatten(data) for data in data['items'])
ranking_df = pd.DataFrame(ranking)
ranking_df = ranking_df.drop(['club_name'], axis='columns')
ranking_df.rename(columns = {'rank' : 'ranked'}, inplace = True)

ranking_df.to_sql(name='ranking', con = DB_connection.engine, if_exists='append', index = False)
