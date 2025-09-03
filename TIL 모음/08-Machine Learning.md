---

## 🌱 Today I Learned

## 📅 Date
2025-08-25

## 🤖 머신러닝 - 1일차 (지도학습, KNN, 회귀, 규제)

---

## ✅ 학습 내용

오늘은 **머신러닝의 기본 개념(지도학습 vs 비지도학습)**과 K-최근접 이웃(KNN), 회귀 모델(선형/다항 회귀), **규제(릿지/라쏘)**까지 학습했다.
특히 과적합과 과소적합 개념을 모델 복잡도와 연결해 이해했고, 규제를 통해 이를 조절할 수 있음을 배웠다.

---

## 🔹 지도학습 vs 비지도학습

구분	특징	예시
지도학습 (Supervised)	입력(X)+정답(y) 학습	분류(도미/빙어), 회귀(물고기 무게 예측)
비지도학습 (Unsupervised)	정답 없음, 패턴 학습	군집(K-means), 차원축소(PCA), 이상치 탐지

✔️ 지도학습 = 분류(Classification) + 회귀(Regression)
✔️ 반드시 훈련/테스트 분리 후 일반화 성능 확인 필요

---

## 📘 K-최근접 이웃 (KNN)
•	분류(Classification): 가장 가까운 K개의 데이터 중 다수결로 클래스 결정
•	회귀(Regression): 가장 가까운 K개의 데이터 평균값 예측
•	하이퍼파라미터 K
o	K 작음 → 훈련 데이터 노이즈에 민감 (과대적합)
o	K 큼 → 주변 데이터까지 포함 (과소적합)

📌 주의: 거리 기반 모델이므로 스케일링 필수

---

## 📘 회귀 (Regression)
•	선형 회귀 (Linear Regression)
o	단순 직선 모델 (y=ax+b)
o	데이터 복잡도 반영 어려움 → 과소적합 발생
•	다항 회귀 (Polynomial Regression)
o	특성 제곱/세제곱 확장 후 선형 회귀 적용
o	고차 다항식 → 과대적합 위험 ↑

✔️ 데이터 누수 방지 팁: 훈련 데이터로 fit, 테스트 데이터는 transform만

---

## 📘 규제 (Regularization)

•	릿지 회귀 (Ridge, L2)
o	계수 제곱 패널티 → 큰 계수 억제
•	라쏘 회귀 (Lasso, L1)
o	계수 절댓값 패널티 → 일부 계수 0 → 변수 선택 효과
•	공통
o	α(규제 강도) ↑ → 훈련 점수 ↓, 일반화 ↑
o	스케일링 필수 (StandardScaler 적용)

---

## 💻 코드 예시

from sklearn.linear_model import LinearRegression, Ridge, Lasso
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline

# 다항 회귀 + 규제 적용
model = make_pipeline(StandardScaler(), Ridge(alpha=1.0))
model.fit(X_train, y_train)
print("훈련 점수:", model.score(X_train, y_train))
print("테스트 점수:", model.score(X_test, y_test))

---

##💡 느낀점
•	모델 복잡도를 조절하면서 과소적합 ↔ 과대적합 균형이 중요하다는 걸 깨달음
•	규제를 적용하면 과적합을 억제하고 변수 선택까지 가능하다는 점이 인상 깊었음
•	단순 → 복잡 → 규제 적용의 학습 흐름이 자연스럽게 연결되었음

---







---

## 🌱 Today I Learned

## 📅 Date
2025-08-26

## 🤖 머신러닝 - 2일차 (로지스틱 회귀)

---

## ✅ 학습 내용

오늘은 **분류 모델의 기본기인 로지스틱 회귀(Logistic Regression)**를 학습했다.
KNN 분류와 비교하며 이진 분류(Sigmoid), **다중 분류(Softmax)**를 실습했고,
규제 강도 하이퍼파라미터 C의 역할까지 확인했다.

---

## 🔹 로지스틱 회귀(Logistic Regression)란?

•	이름은 회귀지만 실제로는 분류 알고리즘
•	선형 방정식을 바탕으로 확률을 예측 → 클래스 결정

✔️ 이진 분류 → Sigmoid 함수 사용
σ(z)=11+e−z\sigma(z) = \frac{1}{1 + e^{-z}}σ(z)=1+e−z1 
✔️ 다중 분류 → Softmax 함수 사용
P(y=k)=ezk∑jezjP(y=k) = \frac{e^{z_k}}{\sum_j e^{z_j}}P(y=k)=∑jezjezk 

---

## 📘 KNN vs 로지스틱 회귀
•	KNN
o	비선형 결정 경계 가능
o	데이터가 많아질수록 예측 속도 ↓
•	로지스틱 회귀
o	선형 결정 경계
o	계수(coef_) 해석 가능 → feature 중요도 확인 가능

---

## 📘 이진 분류 (도미 vs 빙어)
•	coef_ → 각 feature의 가중치 확인
•	intercept_ → 기준 절편
•	decision_function() → z값 반환, sigmoid로 확률 변환
예:
•	z > 0 → 도미 확률 ↑
•	z < 0 → 빙어 확률 ↑

---

## 📘 다중 분류 (7종 생선)
•	One-vs-Rest(OVR) 방식 적용
•	predict_proba() → softmax 확률 확인 가능
•	클래스별 선형 방정식 존재 → 확률 합은 항상 1

---

## 📘 하이퍼파라미터 C
•	C ↑ → 규제 약화 → 과적합 위험
•	C ↓ → 규제 강화 → 과소적합 위험
•	기본값 = 1.0

---

## 💻 코드 예시
from sklearn.linear_model import LogisticRegression

# 다중 분류 로지스틱 회귀
lr = LogisticRegression(C=10, max_iter=1000)
lr.fit(X_train, y_train)

print("훈련 정확도:", lr.score(X_train, y_train))
print("테스트 정확도:", lr.score(X_test, y_test))
print("예측 확률:", lr.predict_proba(X_test[:5]))

---

## 💡 느낀점
•	로지스틱 회귀가 분류 모델이라는 점이 처음엔 헷갈렸지만, sigmoid/softmax로 확률을 예측한다는 개념이 직관적이었다.
•	단순 정확도보다 확률 기반 의사결정(AUC, F1 등)을 고려해야 한다는 점을 알게 됨.
•	coef_와 intercept_를 통해 feature 중요도를 해석할 수 있는 점이 실무적으로 매우 유용할 듯하다.

---







---

## 🌱 Today I Learned

## 📅 Date
2025-08-27

## 🤖 머신러닝 - 3일차 (Decision Tree, 교차검증, GridSearchCV)

---

## ✅ 학습 내용
오늘은 **의사결정트리(Decision Tree)**를 학습하고,
과적합 문제 해결을 위해 **교차검증(Cross Validation)**과 GridSearchCV를 실습했다.

---

## 🔹 Decision Tree
•	규칙 기반 분류/회귀 모델
•	장점: 해석 쉬움, 시각화 가능
•	단점: 가지가 깊어질수록 과적합 위험 ↑

✔️ 시각화: plot_tree()로 분할 기준 확인 가능
✔️ 특징 중요도: feature_importances_ 속성 제공

---

## 📘 교차검증 (Cross Validation)
•	데이터 분할 → 훈련/검증 반복 평가 → 평균 성능 산출
•	종류:
o	K-Fold: 데이터를 K등분 후 교차
o	StratifiedKFold: 클래스 비율 유지하며 교차

✔️ 목적: 일반화 성능을 더 안정적으로 추정

---

## 📘 GridSearchCV
•	여러 하이퍼파라미터 조합 자동 탐색 + 교차검증
•	gs.best_params_ → 최적 파라미터
•	gs.best_score_ → 교차검증 최고 성능
•	gs.best_estimator_ → 최종 모델

---

## 💻 코드 예시

from sklearn.model_selection import GridSearchCV
from sklearn.tree import DecisionTreeClassifier

params = {'max_depth':[3,5,7], 'min_samples_split':[2,4,6]}
dt = DecisionTreeClassifier(random_state=42)

gs = GridSearchCV(dt, params, cv=5)
gs.fit(X_train, y_train)

print("최적 파라미터:", gs.best_params_)
print("교차검증 최고 점수:", gs.best_score_)
print("테스트 세트 점수:", gs.score(X_test, y_test))

---

## 💡 느낀점
•	트리는 너무 깊으면 훈련 데이터에 과적합되므로 반드시 하이퍼파라미터 튜닝이 필요하다.
•	GridSearchCV는 자동화된 최적화 도구로, 실무에서 반드시 활용해야 할 것 같다.
•	단순히 정확도만 보는 게 아니라 교차검증 점수를 통해 모델의 안정성을 평가해야 한다는 점을 배웠다.

















________________________________________

## 🌱 Today I Learned

## 📅 Date
2025-08-28

## 🤖 머신러닝 - 4일차 (Random Forest & 앙상블 학습)
________________________________________

## ✅ 학습 내용
오늘은 **앙상블 학습(Ensemble Learning)**을 배우고,
그 중 대표적인 **랜덤 포레스트(Random Forest)**를 실습했다.

________________________________________

## 🔹 앙상블 학습(Ensemble)
•	여러 개의 약한 학습기(weak learner)를 결합해 강력한 모델 생성

✔️ 종류
•	Bagging: 데이터 샘플링 → 병렬 학습 → 평균/다수결 (예: Random Forest)
•	Boosting: 이전 오차 보완하며 순차 학습 (예: Gradient Boosting, XGBoost)

________________________________________

## 📘 Random Forest

•	여러 Decision Tree를 학습 후 결과를 종합
•	장점: 단일 트리보다 과적합 억제, 안정적 성능
•	주요 하이퍼파라미터
o	n_estimators: 트리 개수
o	max_depth: 트리 최대 깊이
o	max_features: 분할 시 사용할 특성 수

✔️ Feature Importance 제공
✔️ Out-of-Bag (OOB) 점수로 검증 가능 (교차검증 대체)

________________________________________

## 💻 코드 예시
from sklearn.ensemble import RandomForestClassifier

rf = RandomForestClassifier(n_estimators=200, max_depth=5,
                            oob_score=True, random_state=42)
rf.fit(X_train, y_train)

print("훈련 정확도:", rf.score(X_train, y_train))
print("테스트 정확도:", rf.score(X_test, y_test))
print("OOB 점수:", rf.oob_score_)
print("특성 중요도:", rf.feature_importances_)

________________________________________

## 💡 느낀점
•	랜덤 포레스트는 단일 트리의 과적합 문제를 효과적으로 해결해주는 강력한 모델이라는 걸 체감했다.
•	특히 OOB 점수를 통해 별도의 검증 세트 없이도 일반화 성능을 확인할 수 있는 점이 매력적이었다.
•	앞으로는 트리 기반 모델을 사용할 때 단일 트리보다는 앙상블 기법을 먼저 고려해야겠다고 느꼈다.




















