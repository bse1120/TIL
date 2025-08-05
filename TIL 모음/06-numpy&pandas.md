
## 🌱 Today I Learned

## 📅 Date
2025-07-29

## 🐍 Numpy 기초

---

1. 데이터 분석의 이해
-	데이터분석: 문제를 정의하고, 데이터를 통해 의사결정을 돕는 과정
o	흐름: 문제정의 → 데이터수집 → 정제 → 탐색적 분석 → 통계/해석 → 결론 도출
-	통계: 데이터를 요약·설명하기 위한 수학적 기법 (평균, 분산 등)
-	머신러닝: 데이터를 학습시켜 예측 (e.g. 스팸메일 분류, 상품 추천)

---

2. Python 데이터 분석 라이브러리 개요

- 라이브러리	역할
- numpy	수치 연산 (배열 기반, 빠름)
- pandas	표 형태 데이터 처리 (DataFrame)
- matplotlib	기본 시각화
- seaborn	고급 시각화
- scipy	고급 수학·통계 함수
- scikit-learn	머신러닝 알고리즘
	
---

3. Numpy 핵심 기능 요약

✅ 배열 생성
np.array(), np.zeros(), np.ones(), np.full(), np.empty()
np.arange(), np.linspace(), np.logspace()
np.random.rand(), np.random.randn(), np.random.randint()

✅ 배열 정보 확인
-	ndim, shape, size, dtype, itemsize, nbytes

✅ 배열 재구성
-	.reshape(), .resize(), .ravel(), .flatten(), .transpose()

✅ 인덱싱 / 슬라이싱
-	1D/2D 인덱싱
-	Boolean Indexing, Fancy Indexing
-	조건 필터링: arr[arr > 3], (arr == 1) | (arr > 3) 등

✅ 브로드캐스팅
-	스칼라 ↔ 배열: arr + 10
-	벡터 ↔ 행렬: 행/열 수 일치 시 자동 확장
-	Shape 규칙: 행 또는 열 중 하나가 같아야 브로드캐스트 가능

✅ 뷰 vs 복사
-	view: 원본과 연결된 객체 (슬라이싱 결과 등)
-	copy: 완전히 독립된 복사본

---

4. 주요 연산

✔️ 기본 연산
a + b, a - b, a * b, a / b, a ** 2

✔️ 집계 함수
-	np.sum(), np.mean(), np.min(), np.max(), np.std(), np.var()
-	축별 연산: axis=0 (열 기준), axis=1 (행 기준)

✔️ 누적 함수
-	np.cumsum(), np.cumprod()

✔️ 기타 수학 함수
-	삼각함수: np.sin(), np.cos(), np.tan()
-	지수/로그: np.exp(), np.log(), np.log10(), np.log2()
-	제곱근/거듭제곱: np.sqrt(), np.power()
-	절대값/부호: np.abs(), np.sign()
-	반올림: np.round(), np.floor(), np.ceil(), np.trunc()
-	백분위수: np.percentile()
-	중앙값: np.median()
-	가중 평균: np.average(data, weights=weights)

---

💡 배운 점 요약
-	Python에서 효율적인 데이터 연산을 위해선 Numpy가 필수!
-	배열의 생성, 형태 변경, 인덱싱/슬라이싱을 자유자재로 다룰 수 있어야 함
-	뷰(view)와 복사(copy)의 차이를 명확히 이해하고 사용할 것
-	브로드캐스팅은 매우 강력하지만 shape 호환을 반드시 고려해야 함
-	수학/통계 연산은 함수명만 외우면 대부분 직관적으로 활용 가능

---







---

## 🌱 Today I Learned

## 📅 Date
2025-07-31

## 🐼 Pandas를 활용한 데이터 정제 및 전처리
-	CSV 및 JSON 파일 불러오기/저장하기
-	타이타닉 데이터셋을 활용한 EDA(탐색적 데이터 분석) 실습

---

🧹 1. Pandas로 데이터 정제 및 전처리

✅ 행 삭제
-	drop(index)로 특정 행 삭제 가능
df.drop(0)  # 인덱스 0 삭제
df.drop([0, 2, 4])  # 여러 행 한 번에 삭제

✅ 조건으로 행 필터링
df[df['나이'] < 30]  # 나이가 30 미만인 행만 선택

✅ 결측치 처리
-	전체 결측치 제거: df.dropna()
-	특정 열의 결측치만 제거: df.dropna(subset=['열이름'])

✅ 중복 제거
-	중복 확인: duplicated_df.duplicated()
-	중복 제거: duplicated_df.drop_duplicates()

✅ 정렬 및 인덱스 재설정
-	sort_values('컬럼명'), ascending 옵션
-	정렬 후 인덱스 재설정: reset_index(drop=True)

---

🗂️ 2. CSV, JSON 파일 불러오기/저장하기

✅ CSV 불러오기 (read_csv)
-	인코딩 주의! EUC-KR, UTF-8 등 확인 필수
-	타입 지정: dtype={'ISBN': str}
✅ JSON 처리
-	문자열(JSON) → 딕셔너리: json.loads()
-	딕셔너리 → JSON 문자열: json.dumps()

---

🔍 3. 타이타닉 데이터셋 EDA 실습

✅ 기본 정보 확인
-	titanic.info(), describe(), head()
-	value_counts()로 빈도 분석
-	groupby() + mean()으로 그룹별 생존율 확인
-	pivot_table()로 다차원 분석 (ex. 성별-등급별 생존율)

✅ 나이 그룹화
-	pd.cut()으로 나이를 구간화하고 범주화 (ex. 아동, 청소년 등)

✅ 결측치 정제 전략
-	age: 전체 평균 or 성별+등급 그룹 평균으로 대체
-	embarked: 최빈값으로 채움
-	deck: 결측 비율 77% → 의미 없음 → 삭제

---

🧠 오늘의 인사이트
-	결측치는 단순히 삭제하지 말고, 대체하거나 판단 기준을 세워 처리해야 한다.
-	groupby().transform()은 그룹별 평균을 각 개별 행에 다시 매핑할 수 있어 매우 유용함.
-   EDA 단계에서 데이터 정제는 꼭 선행되어야 하며, info(), isna(), describe() 등을 통해 꼼꼼하게 확인해야 한다.

---

💡 다음에 해볼 것
-	matplotlib, seaborn 활용한 시각화 연습
-	fillna()의 다양한 전략 (ex. 예측 모델 기반 대체)
-	실무 CSV 파일 여러 개 불러와서 병합(Merge) 실습

---







---

## 🌱 Today I Learned

## 📅 Date
2025-08-01

## 🐼 Pandas Grouping, Aggregation, Merge, 실전 분석 실습
📘 파일명: 02_pandas2.ipynb

---

📌 1. GroupBy 기초 및 다중 그룹핑

✅ 기본 그룹화
-	.groupby('컬럼') 으로 그룹 객체 생성
-	.sum(), .mean() 등 집계 함수 사용 가능
python
복사편집
df.groupby('고객ID')['구매액'].sum()

✅ 그룹 객체 속성 활용
-	.groups: 그룹 키 목록
-	.get_group('A'): 특정 그룹의 데이터 추출

✅ 다중 컬럼 그룹핑
python
복사편집
df.groupby(['고객ID', '상품카테고리'])['구매액'].sum().to_frame()

✅ 여러 집계 함수 적용
python
복사편집
df.groupby('고객ID')['구매액'].agg(['sum', 'mean', 'count'])

✅ 여러 컬럼 + 여러 집계 함수
python
복사편집
df.groupby('고객ID').agg({
    '구매액': ['sum', 'mean', 'count'],
    '할인률': ['mean', 'max']
})

✅ 사용자 정의 함수 적용
python
복사편집
def discount_amount(price):
    return (price * df.loc[price.index, '할인률']).sum()

df.groupby('고객ID')['구매액'].agg([
    ('총구매액', 'sum'),
    ('평균구매액', 'mean'),
    ('할인총액', discount_amount)
])

---

📌 2. 누적, 순위, 기여도 계산

✅ 그룹 내 순위
python
복사편집
df['부서순위_실적'] = df.groupby('부서')['월별실적'].rank(method='dense', ascending=False)

✅ 누적 합계/최대
python
복사편집
df['부서별누적합계'] = df.groupby('부서')['월별실적'].cumsum()
df['부서별누적최대'] = df.groupby('부서')['월별실적'].cummax()

✅ 기여도 계산
python
복사편집
df['부서총실적'] = df.groupby('부서')['월별실적'].transform('sum')
df['부서기여도'] = df['월별실적'] / df['부서총실적']

✅ 성과 점수 및 보너스
python
복사편집
df['성과점수'] = df['월별실적'] * 0.7 + df['고객평가'] * 0.3 * 20
보너스 계산 함수:
python
복사편집
def cal_bonus(row):
    base = row['월별실적'] * 0.1
    rank = row['부서순위_성과']
    return base * {1: 1.5, 2: 1.3, 3: 1.1}.get(rank, 1.0)

---

📌 3. 실전 분석 - 매출 데이터

✅ 날짜 파생 컬럼
-	.dt.strftime('%Y-%m'), .dt.day_name(), .dt.isocalendar().week

✅ 카테고리별 분석
python
복사편집
df.groupby('카테고리').agg({'매출액': ['sum', 'mean', 'count'], '수량': 'sum'})

✅ 월별 트렌드 시각화
-	line 그래프로 매출액 및 주문건수 이중 축 시각화

✅ 지역 & 카테고리 히트맵
python
복사편집
sns.heatmap(df.groupby(['지역', '카테고리'])['매출액'].sum().unstack(), annot=True)

✅ 요일 & 고객등급별 패턴
-	요일을 카테고리형으로 지정 후 stacked bar 시각화

✅ 결제수단별 통계 + 비율 함수
python
복사편집
def ratio(x): return x.sum() / total_sales * 100

---

📌 4. 상위 고객 & 상품 분석

✅ 고객별 매출, 고유 상품/카테고리 수
python
복사편집
df.groupby('고객ID').agg({
    '매출액': ['sum', 'mean', 'count'],
    '상품ID': 'nunique',
    '카테고리': pd.Series.nunique
}).sort_values(...)

✅ 주별 매출 추이 + 증감률
-	.pct_change()로 증감률 계산

---

📌 5. 데이터 결합

✅ concat() - 단순 결합
-	axis=0 (행), axis=1 (열)
-	ignore_index=True, join='inner' 등 옵션 활용

✅ merge() - 관계형 결합
-	on=공통컬럼, how='inner|left|right|outer'
python
복사편집
pd.merge(orders, products, on='상품ID', how='left')

✅ 다른 키로 병합 (컬럼명이 다를 때)
python
복사편집
pd.merge(orders, customers, left_on='고객ID', right_on='ID')

---

📌 6. 실전 연계 분석

✅ 주문상세 -> 총금액 계산
python
복사편집
order_details['총금액'] = order_details['수량'] * order_details['가격'] * (1 - order_details['할인율'])



✅ 주문별 총금액 집계 후 병합
python
복사편집
order_totals = order_details.groupby('주문번호')['총금액'].sum().reset_index()
order_with_totals = orders.merge(order_totals, on='주문번호')

✅ 고객, 배송정보, 만족도 정보까지 순차 병합

---

💡 오늘의 인사이트

-	groupby와 agg를 다양한 방식으로 결합하면 복잡한 집계도 단순하게 처리할 수 있다.
-	transform, rank, cumsum 등을 함께 사용하면 그룹 내 통계 및 순위 분석이 가능하다.
-	실전 분석에서는 데이터 전처리 → 그룹 집계 → 시각화 순서로 접근하면 좋다.
-	merge는 SQL JOIN처럼 동작하며, 키 설정이 유연하다.







---

## 🌱 Today I Learned

## 📅 Date
2025-08-04

## 🛳️ TIL: Titanic 데이터 분석 및 전처리
📌 학습 목표
-	seaborn의 타이타닉 데이터셋을 활용해 기본적인 데이터 분석, 결측치 처리, 이상치 탐지 및 처리 기법을 실습
-	그룹핑 및 피벗테이블을 통한 통계 분석 능력 향상
-	데이터 전처리를 통한 분석 정확도 향상 경험

---

🔹 1. 데이터셋 로드 및 기초 분석
-	sns.load_dataset('titanic')으로 타이타닉 데이터 로딩
-	.head(), .info(), .describe()로 기본 정보 확인
-	주요 컬럼:
o	survived: 생존 여부 (0=사망, 1=생존)
o	pclass: 객실 등급 (1, 2, 3)
o	sex, age, fare, embarked, deck, embarked_town 등

🔹 2. 빈도 분석 및 그룹 통계
-	value_counts()로 성별, 등급, 생존 여부 분포 파악
-	groupby()와 pivot_table()로 성별·등급·연령대별 생존율 비교

🔹 성별 생존율
titanic.groupby('sex')['survived'].mean()

🔹 성별 + 객실 등급별 생존율
titanic.groupby(['sex', 'pclass'])['survived'].mean()

🔹 나이 그룹 생성 및 생존율 분석
titanic['age_group'] = pd.cut(titanic['age'], bins=[0,12,18,35,60,100,200], labels=['아동','청소년','청년','중장년','노년','불사'])

---

🔹 3. 결측치 처리

📌 주요 결측 컬럼
-	age, embarked, deck

🧼 처리 방법
-	age: 성별 + 객실 등급 기준 평균값으로 채움
-	embarked: 최빈값으로 대체
-	deck: 결측률 77% → 삭제
mean_ages = titanic.groupby(['sex', 'pclass'])['age'].transform('mean')
titanic_processed['age'] = titanic['age'].fillna(mean_ages)
titanic_processed['embarked'] = titanic['embarked'].fillna(titanic['embarked'].mode()[0])
titanic_processed.drop('deck', axis=1, inplace=True)

---

🔹 4. 이상치 탐지 및 시각화
-	age, fare 중심 이상치 탐색
-	히스토그램 + 박스플롯 + 산점도로 분포 확인

✅ IQR 기반 이상치 탐지
Q1 = tp['fare'].quantile(0.25)
Q3 = tp['fare'].quantile(0.75)
IQR = Q3 - Q1
lower = Q1 - 1.5 * IQR
upper = Q3 + 1.5 * IQR
fare_outliers = (tp['fare'] < lower) | (tp['fare'] > upper)

✅ 그룹별 이상치 탐지 (ex. 객실 등급별 요금 이상치)
detect_outliers_by_group(data, group_col='pclass', value_col='fare')

---

🔹 5. 이상치 처리 방법 비교
방법	설명
제거	이상치 행을 drop (정제 데이터 생성)
윈저화	극단값을 5~95 백분위로 제한
대체	그룹별 중앙값 등으로 대체
	
# 제거
remove_outliers_iqr(tp, 'fare')

# 윈저화
winsorize_outliers(tp, 'fare')

---

🔹 6. 느낀 점 & 배운 점

-	단순 평균 대체보다는 그룹 기반 평균 대체가 더 합리적임을 실감함
-	이상치는 반드시 제거해야 하는 ‘오류’가 아닌, 분석 목적에 따라 처리 방식이 달라져야 함을 배움
-	시각화를 통해 데이터 특성을 직관적으로 파악 가능
-	전처리 단계를 거쳐야 분석/모델링 단계에서 왜곡을 줄일 수 있음

---

✅ 내일 할 일

-	이상치 처리 전후 결과 시각화 정리
-	sns.heatmap을 이용한 결측 시각화 연습
-	모델링에 활용할 수 있는 전처리 파이프라인 코드 구성

---







---

## 🌱 Today I Learned

## 📅 Date
2025-08-05

## 📌 학습 주제: 시계열(Time Series) 데이터 분석 및 시각화

---

1. ⏱️ 시계열 데이터 개요
-	시계열 데이터는 시간에 따라 수집된 데이터로, 주로 날짜나 시간 정보가 인덱스로 사용됨.
-	pd.to_datetime()을 통해 다양한 날짜 형식을 datetime 객체로 변환 가능.
-	date_range()로 일별, 주별, 월별 날짜 인덱스 생성 가능 (freq='D', 'W', 'M' 등)

---

2. 📊 시계열 인덱스를 활용한 분석
-	날짜 인덱스를 활용해 year, month, day, weekday, quarter 등 다양한 파생 변수 생성.
-	특정 날짜 조회: df.loc['2023-01-15']
-	특정 기간 조회: df['2023-01':'2023-03']
-	특정 요일 조회: df[df['weekname'] == 'Friday']
-	특정 월의 주말만: .isin([5, 6]) 필터링

---

3. 📈 시각화를 통한 인사이트 탐색
-	일별, 요일별, 월별, 분기별 매출 추이 시각화 (line plot, bar plot)
-	박스플롯으로 분포 확인 (월별, 분기별 매출 분포)
-	pivot_table + heatmap으로 월-요일별 매출 시각화
-	.cumsum()을 통해 누적 매출 계산 및 시각화

---

4. 🔍 시계열 분해 분석 (seasonal_decompose)
-	추세(Trend): 전반적인 매출 변화 방향
-	계절성(Seasonality): 주기적으로 반복되는 패턴
-	잔차(Residual): 예외적인 이벤트나 노이즈

---

5. 📏 이동 평균 & 변화율
-	이동 평균(MA): .rolling(window).mean()으로 smoothing
o	7일 평균, 30일 평균 등
-	변화율(PCT 변화율): .pct_change() 활용
o	일일 변화율, 주간 변화율 분석 가능

---

6. 📅 리샘플링 (Resampling)
-	시간 단위를 다시 조정하여 집계 (resample())
o	주간('W'), 월간('ME'), 분기('QE') 등
-	다양한 집계 함수 사용 가능: sum, mean, min, max, std

---

7. 📈 리샘플링 기반 시각화
-	주별/월별/분기별 매출 변화 추이 시각화 (line, bar)
-	주간 통계 (최소/평균/최대)를 한 번에 비교 가능

---

8. 💹 주식 데이터 시뮬레이션
-	일별 주식 데이터 생성 (기하 브라운 운동 활용)
o	returns: 일일 수익률 (정규분포 기반)
o	prices: 누적곱을 통해 가격 계산
o	volume: 수익률과 반비례하도록 거래량 구성
-	DataFrame에 시계열 인덱스를 설정하고 .set_index('date')로 관리

---

✅ 오늘의 키워드 요약
시계열 인덱스 | 날짜 필터링 | 이동 평균 | 변화율 | 누적합 | 리샘플링 | 추세·계절성·잔차 분해 | 박스플롯 | 히트맵 | 주식 데이터 시뮬레이션

---

✨ 느낀 점
-	날짜 인덱스를 기준으로 데이터를 정리하면 시간 흐름에 따른 패턴 분석이 훨씬 수월함.
-	.rolling(), .resample(), .pct_change() 등 Pandas의 시계열 전용 메서드들을 자유자재로 활용할 수 있게 되었음.
-	시계열 데이터는 단순한 추이뿐만 아니라 계절성, 누적합, 변화율 등 다양한 방식으로 인사이트를 도출할 수 있어 흥미로웠음.

---
