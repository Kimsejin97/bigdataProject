import sqlalchemy
from sqlalchemy import *
from sqlalchemy.orm import sessionmaker


engine = create_engine("mysql+pymysql://root:"+"pwd"+"@localhost/brawlstars", encoding='utf-8')
conn = engine.connect()

Session = sessionmaker()
Session.configure(bind = engine)
session = Session()

sql = text('select tag from ranking')
result = session.execute(sql)
tags = [row[0] for row in result]
