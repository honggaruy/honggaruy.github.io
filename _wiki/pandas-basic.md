---
layout  : wiki
title   : pandas 기초 사용법 
summary : 필요하여 찾다가 알게된 기초 사용법 적음 
date    : 2021-07-15 01:03:02 +0900
updated : 2021-08-04 22:58:57 +0900
tag     : pandas 
toc     : true
public  : true
parent  : [[Pandas-Category]]
latex   : false
---
* TOC
{:toc}

#  dataframe에서 값 counting 하기

* [Count number of records by categroy, pandas official](https://pandas.pydata.org/docs/getting_started/intro_tutorials/06_calculate_statistics.html?highlight=counting#count-number-of-records-by-category)
* `pd.Dataframe.value_counts()` 함수를 사용한다

# 특정 기간의 "연도-달" list를 생성하는 간단한 방법

* 예1 : '2018-09'부터 '2019-03'까지 1달 단위로 증가하는 String list 만들기
  ```python
  import pandas as pd
  
  period_index = pd.period_range(start='2018-09-01', end='2019-03-01', freq='M')
  print(period_index)   
  # PeriodIndex(['2018-09', '2018-10', ... , '2019-03'], dtype='period[M]', freq='M') 
 
  str_index = period_index.strftime('%Y-%m')
  print(str_index)   
  # Index(['2018-09', '2018-10', ... , '2019-03'], dtype='object') 
  
  month_list = str_index.to_list()
  print(month_list)
  # ['2018-09', '2018-10', '2018-11', '2018-12', '2019-01', '2019-02', '2019-03']
 
  # 한줄로 쓸 수도 있지만, 길어지는게 싫어서 나누어 씀
  ```
  * 참고링크
    * [pd.date_range() 간단한 예제 확인](https://pandas.pydata.org/docs/user_guide/timeseries.html#overview)
    * [ strftime() 함수에 사용하는 포맷팅 문자 설명](https://pandas.pydata.org/docs/reference/api/pandas.Period.strftime.html)

# pandas로 날짜 끼리 비교하기

* 시작일과 종료일을 parameter로 받는 함수를 만들 때 `시작일 <= 종료일`을 assertion 하고자 한다
* datetime 라이브러리 말고 pandas로 하려고 할 때 어떻게 할까 ?
* 다음 링크를 참조 했다. [Comparing Timestamp in Python - Pandas](https://www.geeksforgeeks.org/comparing-timestamp-in-python-pandas/)
* 테스트 코드
  ```python
  assert pd.Timestamp(start_date) <= pd.Timestamp(end_date), f'오류! 시작일({start_date})이 종료일({end_date})보다 미래시간임'
  ```
