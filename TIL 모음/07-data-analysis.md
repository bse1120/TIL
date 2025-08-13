
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







---

## 🌱 Today I Learned

## 📅 Date
2025-08-06

## 📌 학습 주제: KPI 분석 및 핵심 고객 지표 도출

---

✅ KPI 개념 정리

-	Metric (메트릭): 단순 측정값 (예: 방문자 수, 매출액)
-	Indicator (지표): 비교 가능한 변화량, 방향성을 포함 (예: 매출 성장률)
-	KPI (핵심성과지표): 비즈니스 목표와 직접 연결되는 주요 지표
→ 예: CAC, LTV, NPS

KPI는 전략 방향 제시, 데이터 기반 문화 형성에 필수!

---

🧪 실습: 전자상거래 데이터 기반 고객 분석

🧷 1. RFM 분석

-	Recency: 최근 구매일로부터의 일수 (낮을수록 우수)
-	Frequency: 구매 빈도 (높을수록 우수)
-	Monetary: 총 구매금액 (높을수록 우수)
-	RFM 점수: 각 항목을 5분위로 나누어 555~111 점수 생성
-   세그먼트 분류 기준:
o	최고: R ≥ 4 & F ≥ 4
o	충성: R ≥ 3 & F ≥ 3
o	신규: R ≥ 4 & F ≤ 2
o	위험: R ≤ 2 & F ≥ 3
o	이탈: R ≤ 2 & F ≤ 2
-	→ 세그먼트별 액션 플랜 수립 (예: VIP 프로그램, 재활성화 캠페인 등)

---

💰 2. 고객 생애 가치 (CLV: Customer Lifetime Value)

-	공식:
CLV = 평균 주문 가치 × 구매 빈도 × 고객 생존 기간(년)
-	주요 해석:
o	CLV > CAC → 수익성 있는 고객
o	CLV / CAC ≥ 3:1 → 이상적인 구조
-	결과 요약:
o	평균 CLV: $ {clv_df['clv'].mean():.2f}
o	중앙값, 상위 10%, 분포 시각화
-	파레토 법칙 확인:
o	상위 20% 고객이 전체 매출의 약 {top20rev:.2f}% 차지

---

📊 3. 코호트(Cohort) 분석
-	고객의 첫 구매 월을 기준으로 행동 추적
-	각 코호트의 N개월 후 유지율 계산 및 시각화 (히트맵)
-	인사이트:
o	1개월 후 평균 유지율: {retention_1m:.1%}
o	3개월 후 평균 유지율: {retention_3m:.1%}
o	6개월 후 평균 유지율: {retention_6m:.1%} (if available)
-	개선 제안:
o	온보딩 프로세스 개선 필요 (1M 유지율 낮을 경우)
o	리텐션 캠페인 강화 필요 (3M 이하일 경우)

---

🌟 느낀점 / 인사이트
-	단순히 수치를 보는 게 아니라 전략적 액션으로 이어질 수 있는 지표 설정이 중요함
-	RFM, CLV, 코호트 분석은 고객 세분화와 우선순위 기반 마케팅 전략 수립에 필수 도구
-	실제 기업에서도 CLV와 유지율은 투자 판단의 핵심 지표가 될 수 있음

---

📚 다음에 할 일
-	CAC 계산 공식 및 광고비/유입채널별 분석 방법 학습
-	KPI 기반 대시보드 설계 실습 (Tableau, Power BI, Streamlit 등)
-	마케팅 퍼널 전환율 분석과 연결하여 실전 프로젝트 설계

---







---

## 🌱 Today I Learned

## 📅 Date
2025-08-07

## 📌 학습 주제: 마케팅 채널 성과 분석 & 고객 코호트 분석

---

1. CAC(Customer Acquisition Cost) & LTV(Lifetime Value) 분석

-	목표: 채널별 진정한 ROI 평가 및 마케팅 예산 최적화

-	데이터 전처리
o	marketing_performance.csv → 채널별 마케팅비용(2024년 데이터만)
o	customer_transactions.csv → 고객 등록일 기준 신규 고객 식별

-	CAC 계산
o	CAC = (2024년 채널별 총 마케팅 비용) / (2024년 신규 고객 수)
o	Organic, Referral 채널 → CAC = 0 처리

-	고객별 LTV 계산
o	전체 구매 이력 기반 고객별 LTV 산출

-	ROI 분석
o	ROI = LTV / CAC
o	Payback Period = CAC / (월평균 구매금액)

-	시각화
o	CAC vs LTV 산점도
o	채널별 ROI 막대그래프

-	전략 제안
o	ROI 높은 채널에 예산 집중
o	CAC 대비 LTV 낮은 채널 축소

---

2. 코호트(Cohort) 분석 & 유지율 개선

-	목표: 월별 가입 코호트의 유지율과 매출 기여도 분석

-	코호트 그룹 생성
o	고객 가입월 기준으로 코호트 구분

-	유지율 분석
o	코호트별 경과 개월(Month 0~12) 유지율 계산
o	평균 유지율 곡선 생성

-	매출 기여도 분석
o	코호트별 월별 누적 매출, ARPU 계산
o	6개월/12개월 후 예상 LTV 추정

-	시각화
o	유지율 히트맵

-	개선 전략
o	유지율 하락 시점 식별 후 액션 아이템 도출
o	고성과 vs 저성과 코호트 특성 비교
o	재구매 촉진 캠페인, 맞춤형 혜택 제공, 초기 이탈 방지 프로그램 제안

---

💡 오늘의 인사이트

•	CAC와 LTV의 단순 비교만이 아니라 Payback Period까지 고려해야 마케팅 효율성을 입체적으로 판단 가능.
•	코호트 분석을 통해 유지율 하락 시점을 찾으면, 고객 생애가치를 늘릴 수 있는 구체적 개선 방안을 설계할 수 있음.

---







---

## 🌱 Today I Learned

## 📅 Date
2025-08-08

## 📌 학습 주제: 예제 데이터로 탐색적 데이터 분석(EDA) 루틴 연습
o	titanic(seaborn 내장)로 가설 수립–검증 흐름 익히기
o	Boston Housing로 데이터 프로파일링, 분포/상관 진단 실습

---

1) Titanic EDA\

실습 핵심
-	데이터 로드 & 기본 점검
o	sns.load_dataset('titanic'), head(), info(), describe()로 구조/결측/요약 통계 확인
-	분석 가설 & 우선순위 (강의)
1.	성별·나이 → 생존에 큰 영향 (여성·어린이 우선 구조)
2.	객실 등급(pclass) → 상류층 생존율 ↑ 가능성
3.	가족 동반(sibsp, parch) → 생존에 영향 가능
4.	승선 항구(embarked) → 부가적 차이
o	1순위: pclass, sex, age / 2순위: sibsp, parch, fare / 3순위: embarked

-	파생 변수
o	age_group = pd.cut(age, bins=[0,12,18,35,60,100], labels=['아동(-12)','청소년(13-18)','청년(19-35)','중장년(36-60)','노년(61+)'])

배운 점
-	가설 우선순위를 먼저 세우면 시각화/집계가 훨씬 체계적.
-	연령대 binning으로 집단별 생존율 비교가 쉬워짐.

---

2) Boston Housing 프로파일링
사용 파일/코드
-	파일: boston-housing.csv
-	로드: pd.read_csv(..., header=None, sep=r'\s+') 후 컬럼명 수동 지정
(CRIM, ZN, INDUS, CHAS, NOX, RM, AGE, DIS, RAD, TAX, PTRATIO, B, LSTAT, PRICE)
데이터 프로파일 함수(get_data_profile)
-	기본정보: 행/열, 메모리, 수치/범주형 컬럼 수
-	결측 분석: 결측 수·비율 테이블
-	수치형 품질: 평균/표준편차/최솟값/최댓값/왜도/첨도, IQR 이상값 비율, 유일값 비율
-	분포 이상 감지:
o	극심한 왜도 |skew|>2 변수 리포트
o	이상값 비율 >5% 변수 리포트

시각적 품질 진단
-	주요 변수(예: PRICE, CRIM, RM, LSTAT, NOX, AGE, DIS, TAX, PTRATIO) 히스토그램 + 평균선
-	상관 히트맵(상삼각 mask)로 다중 상관 구조 파악
o	일반적으로 관찰되는 패턴:
	PRICE ↗︎ RM(방 개수) 와 양(+)의 상관
	PRICE ↘︎ LSTAT(하위계층 비율) 과 강한 음(-)의 상관
	PTRATIO(학급당 학생수), NOX(오염) 등과는 대체로 음의 상관 경향

배운 점
-	정량 리포트 + 시각화를 결합하면 품질/이상·왜도/이상값을 빠르게 식별.
-	타깃(PRICE) 중심으로 상관 상위 변수를 추려 모델링/특성공학 우선순위를 정할 수 있음.

---

3) 오픈 과제 브리프 — “이상적인 고객” 프로파일링

-	요구사항:
o	최소 3개 이상 세그먼트 정의
o	통계적 유의성 검증 포함(예: 카이제곱/ t-test / ANOVA 등)
o	결과를 실행 가능한 마케팅 액션으로 연결

-	접근 제안:
1.	RFM/행동 변수로 클러스터링 or 룰 기반 세그먼트
2.	각 세그먼트의 매출/구매빈도/이탈율 차이 가설검정
3.	세그먼트별 획득/활성/리텐션 액션 플랜 도출

---

오늘의 인사이트
-	가설→데이터 확인→파생→시각화→검증의 EDA 루틴이 잡히면, 어떤 데이터든 빠르게 “큰 그림”을 만든다.
-	프로파일링 자동화(함수화)는 분석 재현성과 속도를 크게 올려줌.

내일 할 일 / To-Do
-	Titanic: sex, pclass, age_group별 교차표·생존율 계산 및 시각화(막대/스택/모자이크).
-	Boston: 상관 상위 변수로 단순/다중 회귀 초안 피팅해 성능 점검.
-	오픈 과제: 세그먼트 정의 초안 + 유의성 검정 계획표 작성(지표·검정·샘플 수).







---

## 🌱 Today I Learned

## 📅 Date
2025-08-11

## 📌 학습 주제: 예제 데이터로 탐색적 데이터 분석(EDA) 루틴 연습
o	titanic(seaborn 내장)로 가설 수립–검증 흐름 익히기
o	Boston Housing로 데이터 프로파일링, 분포/상관 진단 실습

---

1. 실제와 유사한 전자상거래 데이터 생성

-	numpy, pandas를 활용해 고객 정보 + 구매 행동 + 만족도 및 충성도 + 카테고리별 구매액 등을 포함한 가상의 e-commerce 데이터셋 생성.
-	의도적 결측치 및 이상값 주입:
o	MCAR (무작위 결측) : 시스템 오류로 인한 만족도 결측
o	MAR (조건부 결측) : 나이가 많을수록 만족도 응답 거부율 증가
o	MNAR (비공개 경향) : 고소득자가 나이 공개 거부
o	나이 999, 극단적인 VIP 구매액, 음수 days_since_last_purchase 등 이상값 삽입

---

2. 데이터 프로파일링 함수 구현 (get_data_profile)

-	데이터 품질 리포트 자동 생성:
1.	데이터 기본 통계 (행·열 수, 메모리 사용량, 수치형·범주형 변수 수)
2.	결측값 분석 (결측수, 결측률)
3.	수치형 변수 품질 분석
	평균, 표준편차, 최소/최대값, 왜도, 첨도
	IQR 기반 이상값 비율
	유일값 비율
4.	분포 이상 감지 (왜도·이상값 비율 기준)

-	데이터 이상 감지 시 ⚠️ 경고 표시 후 변수명과 비율 출력

---

3. 결측값 패턴 분석 (analyze_missing_patterns)
-	결측값 현황 요약표 출력 (결측수, 결측률)
-	4가지 시각화 제공:
1.	결측값 패턴 히트맵
2.	변수별 결측률 바 차트
3.	결측값 조합 패턴(상위 10개)
4.	결측 여부(0/1)와 수치형 변수 간 상관관계 히트맵
-	결측 컬럼이 없거나 패턴이 없는 경우 대비 예외 처리 포함

---

4. 결측치 대체 방법별 결과 비교
-	대체 기법:
o	평균 대체
o	KNN 대체
o	MICE 대체
-	age 변수 예시:
o	원본 데이터와 각 대체 결과의 분포 비교 히스토그램
o	describe()를 이용한 통계량 비교
-	분포 차이 확인 시 binwidth=2로 설정하여 세부 비교 용이

---

5. 대체 품질 평가
-	평균·표준편차 보존도 평가
o	원본 대비 평균 차이(%), 표준편차 차이(%) 계산
-	상관관계 보존도 평가
o	age·satisfaction_score vs avg_order_value 상관계수 비교
o	상관계수 변화율 기반 보존도(%) 산출
-	결과를 DataFrame(eval_df)으로 정리하여 방법별 비교 가능

---

💡 오늘의 핵심 인사이트
-	결측치 처리는 단순히 빈 칸 채우기가 아니라,
데이터의 통계적 특성과 관계 보존을 동시에 고려해야 함.
-	분석 전 단계에서 결측·이상값 진단 → 대체 전후 비교 → 품질 평가 순서를 거치면,
데이터 왜곡을 최소화할 수 있음.
-	분포·상관관계 보존도를 수치로 검증하면 대체 방법 선택 근거를 명확히 제시 가능.

---







---

🗓 2025-08-12 TIL — 이상값 해석 및 처리 전략 수립

📌 학습 목표
-	데이터 내 이상값(Outlier) 을 탐지한 뒤, 이를 정성적·정량적으로 해석하고, 상황별 처리 전략을 수립하는 방법을 익힌다.
-	단순 탐지에서 끝나는 것이 아니라 비즈니스 의사결정에 연결될 수 있도록 분석한다.

---

📚 오늘 배운 내용

1. 환경 설정
-	필요 라이브러리: numpy, pandas, matplotlib, seaborn
-	한글 폰트 설정: Malgun Gothic + axes.unicode_minus=False
-	경고 무시: warnings.filterwarnings('ignore')

2. outlier_interpretation_strategy 함수
이상값 탐지 이후 실행되는 해석·전략 수립 함수로, 주요 단계는 다음과 같다.
1.	정상 고객 vs 이상값 고객 비교
o	분석 변수: age, total_purchases, avg_order_value, days_since_last_purchase, loyalty_points
o	평균/중위수 비교
o	평균 차이 비율(차이배수) 계산
2.	이상값 유형 분류
o	VIP 고객: 높은 구매액 + 높은 충성도 포인트 (상위 5% 기준)
o	데이터 오류: 비정상 나이(>100), 음수 경과일
o	휴면 고객: 마지막 구매일이 매우 오래된 고객 (상위 5% 기준)
o	기타 이상값: 위 조건에 해당하지 않는 나머지
3.	처리 전략
o	VIP 고객: 특별 관리, 혜택 강화
o	데이터 오류: 데이터 정제/제거
o	휴면 고객: 마케팅 캠페인 통한 재활성화
o	기타 이상값: 추가 분석 필요
4.	시각화
o	평균 구매액 분포 비교 (히스토그램)
o	나이 분포 비교 (히스토그램)
o	구매액 vs 충성도 포인트 (산점도)
o	마지막 구매 후 경과일 분포 (히스토그램)

---

💡 인사이트
-	이상값은 무조건 제거 대상이 아님 — VIP처럼 비즈니스 가치가 높은 고객일 수 있으므로, 분석 전 분류가 필수.
-	시각화를 통해 이상값의 특성을 직관적으로 파악할 수 있음.
-	단순 이상값 탐지가 아닌, 비즈니스 의사결정과 연계된 전략이 필요.

---

📝 키워드
이상값 탐지 VIP 고객 데이터 오류 휴면 고객 시각화 분석 비즈니스 전략

---







---

## 🌱 Today I Learned

## 📅 Date
2025-08-13

## 📌 학습 주제: Correlation (상관관계) 분석 & RFM 기반 고객 특성 파생변수 활용
파일: 06_corr.ipynb

---

1. 학습 목표
-	상관관계의 개념과 해석 방법 이해
-	피어슨·스피어만·켄달 상관계수의 차이와 활용 상황 학습
-	RFM 분석 지표와 추가 파생변수를 생성하여 고객 행동 특성 분석
-	상관계수 히트맵, 비선형성 지표, 강한 상관 네트워크 시각화
-	상관관계 결과를 기반으로 매출·충성도 핵심 요인 도출

---

2. 주요 내용

2.1 상관관계 기본 개념
-	범위: -1 ~ +1
o	+1: 완벽한 양의 상관관계 (x↑ → y↑)
o	0: 상관 없음
o	-1: 완벽한 음의 상관관계 (x↑ → y↓)
-	대표 상관계수 종류
1.	Pearson: 연속형·선형 관계, 이상치 민감
2.	Spearman: 순위 기반, 비선형·이상치 강함
3.	Kendall: 순위 일관성, 소표본에 안정적

---

2.2 데이터 전처리
-	CustomerID 결측 제거 → 고객 단위 분석 유지
-	취소 거래(InvoiceNo가 'C'로 시작) 별도 분리
-	양수 수량 & 단가만 남김 → 데이터 품질 확보

---

2.3 고객 특성 파생변수 생성
-	구매패턴 지표: Frequency, 총구매량, 평균구매량, 평균단가, Monetary, 평균구매액, 상품종류수
-	활동성 지표: 구매기간일수, 구매주기, Recency
-	RFM Score: R, F, M 각각 5등급화 후 결합
-	행동 패턴 지표: 평균 장바구니 크기, 거래당 상품 종류, 가격 변동성(CV)

---

2.4 상관관계 분석
-	Pearson: 선형 비례 관계 탐색
-	Spearman: 순위 기반 관계 비교
-	차이 분석: |Spearman - Pearson| 값으로 비선형성 파악
-	강한 상관 네트워크: |r| > 0.5인 변수 관계만 필터링

---

2.5 분석 결과 요약

-	가장 강한 양의 상관관계: 총구매량 ↔ Monetary
-	가장 강한 음의 상관관계: Recency ↔ Frequency

-	매출 증대 핵심 요인(Monetary 상위 관련 변수)
1.	총구매량
2.	평균구매액
3.	Frequency
4.	평균구매량
5.	평균장바구니크기

-	고객 충성도 핵심 요인(Frequency 상위 관련 변수)
1.	총구매량
2.	평균장바구니크기
3.	Monetary
4.	평균구매액
5.	상품종류수

---

3. 인사이트
-   매출 증대 전략: 총구매량 및 평균구매액을 높이는 프로모션 설계
-	충성도 강화 전략: 고객 장바구니 크기와 상품 다양성 확대
-	데이터 분석 팁: Pearson과 Spearman을 함께 보면 비선형성 여부를 빠르게 파악 가능

---

4. 다음 학습 방향
-	상관관계 네트워크를 그래프 분석(NetworkX)으로 확장
-	상관관계 기반 변수 선택 → 예측 모델 학습 연결 실습
-	RFM 기반 고객 세그먼트별 상관관계 차이 비교

---

