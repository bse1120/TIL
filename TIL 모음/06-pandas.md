
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
