
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
