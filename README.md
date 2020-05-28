# bigdataProject

브롤스타즈 api를 이용한 데이터수집
https://developer.brawlstars.com/


## 프로젝트 구조

![파이프라인](https://user-images.githubusercontent.com/33508257/70376851-f5321680-1950-11ea-8ef0-c9e69fa2a98e.jpeg)

1. 파이썬을 이용해 배틀로그 수집
2. mysql테이블에 저장
3. mysql의 데이터를 스쿱을 통해 hdfs로 이동
4. hdfs파일을 하이브 외부테이블이 참조하는 디렉토리로 이동
5. 제플린에서 하이브를 이용해 데이터를 분석

## 데이터 수집방법
