---
layout  : wiki
title   : pandas 기초 사용법 
summary : 필요하여 찾다가 알게된 기초 사용법 적음 
date    : 2021-07-15 01:03:02 +0900
updated : 2023-11-04 15:33:58 +0900
tag     : pandas python
toc     : true
public  : true
parent  : [[Pandas-Category]]
latex   : false
---

* TOC
{:toc}

# dataframe에서 값 counting 하기

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

# Series 내 에서 특정 데이터가 있는지 확인할 때 자주 혼동함 

## 상황 설명
- 우선 아래 도서대여 테이블의 경우에서
 
| 인덱스 | 사용자 | 대출기관   | 상태     | 반납일     |
| ------ | -----  | ---------- | ------   | ---------- |
| 0      | 철수   | 구로도서관 | 반납연기 | 2022-09-15 |
| 1      | 영희   | 구로도서관 | 반납연기 | 2022-09-15 |
| 2      | 철수   | 동작도서관 | 반납연기 | 2022-09-15 |
| 3      | 철수   | 동작도서관 | 반납연기 | 2022-10-01 |
| 4      | 영희   | 동작도서관 | 반납연기 | 2022-10-01 |
| 5      | 길동   | --없음--   | --없음-- | --없음--   |
| 6      | 둘리   | --없음--   | --없음-- | --없음--   |

- 길동이와 둘리는 대여한 도서가 없는 경우 목록에서 제외하는 것이 아니라'--없음--' 으로 표기를 하기로 했다 
- 이때 대여한 책의 갯수를 count하기 위해 '상태'열을 읽어서 '--없음--'이 없는 갯수로 판단을 하기로 정했다

## 문제 분석
- 아래는 대여한 책의 갯수를 세는 함수이다

    ```python
    def total_books_counter(self) -> int:
        if '상태' in self.df.columns and '--없음--' in self.df['상태']:
            counter = len(self.df) - self.df['상태'].value_count()['--없음--']
        else:
            counter = len(self.df)
        return counter
    ```
    
- 위 함수는 오류가 있다
    - 참고할 SO답변1 링크 : [Using in operator with Pandas series](https://stackoverflow.com/a/49393472/9457247) 
    - 참고할 SO답변2 링크 : [How to determine whether a Pandas Column contains a particular vaule](https://stackoverflow.com/a/21320011/9457247) 
    - 즉, Series 객체에 직접 `in` 연산자를 사용하면 "Values"가 아닌 "indexes"만 검사하기 때문이다

## 해결책
- 따라서 해결책은 `'--없음--' in self.df['상태']` 부분을 다음과 같이 고치는 것이다
    - `self.df['상태'].str.contains('--없음--').any()`
    - `self.df['상태'].isin(['--없음--']).any()`
    - `self.df['상태'].eq("--없음--").any()` : 가장 간결하여 선택함

