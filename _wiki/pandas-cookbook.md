---
layout  : wiki
title   : pandas 쿡북
summary : Chris Albon 과 비슷하게 적어보려고 함 
date    : 2021-07-15 01:03:02 +0900
updated : 2022-12-01 21:59:30 +0900
tag     : pandas python 
toc     : true
public  : true
parent  : [[Pandas-Category]]
latex   : false
---

* TOC
{:toc}

# Tip1 : dataframe 에서 중복되는 data의 Unique한 값 목록을 추출할 때


## 시뮬레이션 데이터 세트 만들기 

- 예를 들면, 다음과 같은 도서관 대출 목록 dataframe 이 있다고 하자
 
```python
# 예제용 dataframe 만들기
import pandas as pd
raw_data = {'제목': ['Unity', 'Rust', 'Rust2', 'Java', 'Java1', 'Java6'],
            '대출기관': ['방배도서관', '방배도서관', '동작도서관', '동작도서관', '동작도서관', '동작도서관'],
            '대여자': ['철수', '철수', '영희', '영희', '영희', '영희'],
            '반납일': ['2022-09-15', '2022-09-15', '2022-09-15', '2022-10-01', '2022-10-01', '2022-10-03'],
            }
df1 = pd.DataFrame(raw_data)
```

| 인덱스 | 제목  | 대출기관   | 대여자 | 반납일     |
| ------ | ----- | ---------- | ------ | ---------- |
| 0      | Unity | 방배도서관 | 철수   | 2022-09-15 |
| 1      | Rust  | 방배도서관 | 철수   | 2022-09-15 |
| 2      | Rust2 | 동작도서관 | 영희   | 2022-09-15 |
| 3      | Java  | 동작도서관 | 영희   | 2022-10-01 |
| 4      | Java1 | 동작도서관 | 영희   | 2022-10-01 |
| 5      | Java6 | 동작도서관 | 영희   | 2022-10-03 |

## 문제 상황 정리

- 도서 반납 일정을 짜기 위해 위의 도서관 대출 목록을 자료로 반납일을 출력하고 싶다 
- 즉, 중복되는 데이터가 존재하는 `반납일` 열에서 (`2022-09-15`, `2022-10-01`, `2022-10-03`) *Unique* 한 데이터가 3개 있다
- 즉, `반납일 목록`과 `반납일에 가야하는 대출기관 목록`및 `몇권을 반납해야는지`를 연계하여 출력하고 싶다
- 한데 자세히 보니 `2022-09-15`일 에는 도서관을 2군데(`방배도서관`, `동작도서관`) 가야 한다
- 따라서, 위 데이터 세트에서  출력되어야 하는 데이터 형식은 다음과 같다 
  - 구체적으로 DataFrame 형식으로 출력하고 싶다

| 인덱스  | 반납일      | 대출기관    | 권수   |
| ------: | ----------: | ----------: | -----: |
| 0       | 2022-09-15  | 방배도서관  | 2      |
| 1       | 2022-09-15  | 동작도서관  | 1      |
| 2       | 2022-10-01  | 동작도서관  | 2      |
| 3       | 2022-10-03  | 동작도서관  | 1      |

## 방법 분석

- 우선, 제일먼저 생각나는 방법은 List 구조에서 중복 데이터를 제거하고 Unique한 값들을 추출하는 방법들이다
  - `파이썬 리스트 중복제거`로 찾아보면 여러가지가 있다. 아래는 한가지 예.
    - [Pythonn List 중복 제거 방법, 나를 위한것만은 아닌 기록](https://jsikim1.tistory.com/214)
- 하지만, Pandas에서는 위의 방법보다 훨씬 간단한 방법이 있다
  - [Find Unique Values In Pandas Dataframes, chrisalbon.com](https://chrisalbon.com/code/python/data_wrangling/pandas_find_unique_values/)
  - 이 방법을 적용해보면 결과는 다음과 같다
    ```python
    print(df1["반납일"].unique())
    # ['2022-09-15', '2022-10-01', '2022-10-03']
    ```
- 그런데, 위 방법보다도 이 상황에 더 알맞은 다른 방법이 있다

## 선택된 방법과 결과 확인

- DataFrame의 method중에 Unique한 목록을 뽑아내는 용도로 `value_counts`도 사용가능하다
  ```python
  df1.loc[:,['반납일', '대출기관']].value_counts()
  """ print 출력
  반납일      대출기관
  2022-09-15  방배도서관    2
  2022-10-01  동작도서관    2
  2022-09-15  동작도서관    1
  2022-10-03  동작도서관    1
  dtype: int64 
  """
  df1.value_counts(subset=["반납일", "대출기관"])
  """ 
  value_counts의 파라미터를 사용하면 df1을 사전에 가공할 필요가 없다
  출력결과는 위와 동일하다
  """
  ```
- 응? 출력된 모습만 보면 이미 원하는 최종결과를 뽑아낸 것 같지만 착각이다
  - [value_counts api 문서](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.value_counts.html?highlight=value_counts#pandas.DataFrame.value_counts)를 보면 결과값을 `Series`로 반환한다
  - 위 문서에도 나와있지만, 반환된 `Series` Object는 기본적으로 제공된 `subset`으로 이루어진 `MultiIndex`를 가진다
  - 즉, `반납일`, `대출기관` 부분이 인덱스이고 숫자를 센 부분이 `value`이다
- 이 상태에서 우리가 원하는 최종 결과는 추가적인 method를 통해 다음과 같이 만들수 있다

```python
df1_result = df1.value_counts(subset=['반납일', '대출기관'])\
                .reset_index(name='권수')\
                .sort_values(by=['반납일'], ascending=[True], ignore_index=True)
""" df1_result 출력 결과
       반납일    대출기관  권수
0  2022-09-15  방배도서관     2
1  2022-09-15  동작도서관     1
2  2022-10-01  동작도서관     2
3  2022-10-03  동작도서관     1

** Line Continuation 사용시에 PEP 8 을 준수 하기 위해 `.` operator의 위치를 맞춘다
참조(https://peps.python.org/pep-0008/#should-a-line-break-before-or-after-a-binary-operator)
"""
```

## Method Chaining 분석

- 위의 [Method chaining](https://en.wikipedia.org/wiki/Method_chaining) 에서 중요한 부분을 하나씩 알아보자
- 버전별 차이가 다소 존재하므로 현재 사용하고 있는 버전의 매뉴얼을 참조하자 (아래 링크는 최신버전으로 걸어놓았다)
  - Pandas 버전 확인 방법 
    - conda의 경우 : conda 환경에서 `conda list pandas`
    - pip의 경우 : 가상환경에서 `pip show pandas`

### [DataFrame.value_count()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.value_counts.html)

  - 위에서 확인된 바와 갈이 DataFrame.value_count() 의 결과로 원하는 결과의 `재료`가 이미 준비되었다
  - subset 파라미터로 갯수를 계산할 고유한 조합 (Unique combinations)의 기준을 정한다
  - 결과는 Series로 반환 된다

### [Series.reset_index()](https://pandas.pydata.org/docs/reference/api/pandas.Series.reset_index.html)

  - Series.reset_index() 로 MultiIndex부분을 일반적인 Column으로 변경한다
  - name 파라미터로 Series의 Value 부분에 컬럼 이름을 줄 수 있다 
  - 결과는 상황에 따라 Dataframe 혹은 Series로 반환된다. 위 경우에는 DataFrame 이다

### [DataFrame.sort_values()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.sort_values.html)

  - 가까운 날짜부터 차례로 정렬되는 것이 일정짜기에 좋으므로 `반납일` 기준으로 배열한다
  - 정렬 기준이 여러개 일수 있으므로 `by`, `ascending`은 리스트를 받는다
  - `ignore_index` 옵션으로 sort 이전의 기존 인덱스를 무시하고 정렬순으로 다시 0 부터 인덱스를 부여한다

