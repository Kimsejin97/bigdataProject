#VM안 MYSQL DB연동
import sqlalchemy
from sqlalchemy import *


engine = create_engine("mysql+pymysql://root:"+"hadoop"+"@localhost/brawlstars", encoding='utf-8')
conn = engine.connect()
