## 🌱 Today I Learned

## 📅 Date
2025-07-07

## Subject: SQL Day 4 — 관계형 데이터 설계, Self Join, Exists, Any/All, M:N 구조까지

---

## 📘 What I Learned

-	✨ 1:1, 1:N, M:N 관계형 테이블 설계 및 조인
-	✨ GROUP_CONCAT, CASE, AVG, ROUND 활용한 요약 분석
-	✨ CROSS JOIN, SELF JOIN 활용한 추천 및 상하관계 구성
-	✨ EXISTS, ANY, ALL을 활용한 효율적인 서브쿼리
-	✨ 구매 패턴 유사도 분석 / VIP 미구매 상품 추천 등 실무적 분석
	
---

## 🔍 Detail

✅ 1:1 관계 테이블 생성 & 조인

-- 직원 정보 테이블과 상세정보 테이블 분리
- CREATE TABLE employee_details (
-   emp_id INT PRIMARY KEY,
-   ...,
-   FOREIGN KEY (emp_id) REFERENCES employees(id) ON DELETE CASCADE
- );

✅ 1:N 관계 분석 (고객 : 주문)

-- 고객별 주문 제품 목록 정리
- SELECT customer_name, GROUP_CONCAT(product_name)
- FROM customers c
- LEFT JOIN sales s ON c.customer_id = s.customer_id
- GROUP BY customer_name;


✅ M:N 관계 (학생:수업)

-- 중간 테이블로 다대다 관계 구현
- CREATE TABLE students_courses (
-   student_id INT,
-   course_id INT,
-   grade VARCHAR(5),
-   PRIMARY KEY(student_id, course_id)
- );

✅ SELF JOIN: 같은 테이블 간 관계

-- 상사-직원 관계
- SELECT 상사.name, 직원.name
- FROM employees 상사
- JOIN employees 직원 ON 직원.id = 상사.id + 1;

✅ CROSS JOIN + NOT EXISTS: 미구매 추천

-- VIP 고객이 구매하지 않은 상품 추천
- SELECT customer_name, product_name
- FROM customers c
- CROSS JOIN products p
- WHERE c.customer_type='VIP'
-   AND NOT EXISTS (
-     SELECT 1
-     FROM sales s
-     WHERE s.customer_id = c.customer_id AND s.product_id = p.product_id
- );

✅ EXISTS / IN 비교

-- 전자제품 구매한 고객들
- SELECT * FROM customers c
- WHERE EXISTS (
-   SELECT 1 FROM sales s WHERE s.customer_id = c.customer_id AND category='전자제품'
- );


✅ ANY / ALL

-- VIP 최소 주문액보다 큰 일반 고객 주문
- SELECT * FROM sales
- WHERE total_amount > ANY (
-   SELECT total_amount FROM sales s JOIN customers c ON s.customer_id = c.customer_id
-   WHERE c.customer_type = 'VIP'
- )
- AND customer_id NOT IN (
-   SELECT customer_id FROM customers WHERE customer_type = 'VIP'
- );

---

## 🧠 Summary

-	관계형 DB에서 1:1, 1:N, M:N 관계를 어떻게 구조화하고 쿼리로 해석하는지 학습
-	EXISTS와 ANY/ALL로 성능과 효율을 고려한 조건 필터링 가능
-	단순 데이터 조회를 넘어서 "의미 있는 비즈니스 질문"에 대한 SQL 답변 능력 향상됨
-	실무와 밀접한 추천 시스템, 고객 유사도 분석, 등급 분류까지 SQL로 가능!

---

## 💬 느낀점

- 오늘은 관계형 데이터베이스 설계와 고급 조건 필터링의 핵심을 맛본 날이었다.
- SQL은 단순 기술이 아니라 '사고 도구'임을 다시금 체감했다.
- 어떤 관계를 모델링하고 어떤 조건으로 뽑아낼지 고민하는 것이 진짜 데이터 분석가의 힘이라는 걸 느꼈다!

---

## 🗂️ Reference

-	강의자료 및 실습: 22-one-to-one.sql ~ 29-exists.sql
-	MySQL JOIN 문서
-	MySQL EXISTS 구문







---

## 🌱 Today I Learned

## 📅 Date
2025-07-08 (화)

## 📘 Subject
PostgreSQL 고급 데이터 타입 & 대용량 데이터 처리 및 인덱싱

---

## 🔍 What I Learned

✅ PostgreSQL 고유 데이터 타입 활용
-	TEXT[]: 문자열 배열 (예: 태그)
-	JSONB: 정렬/검색 가능한 JSON 객체
-	INET: IP 주소 전용 타입
-	POINT: 좌표 값 (기하학)
-	INT4RANGE: 정수 범위

- SELECT name, tags[1] AS 첫번째태그, 'PostgreSQL' = ANY(tags) AS 포스트그레스_유저
- FROM datatype_demo;

- SELECT name, metadata->>'department' AS 부서
- FROM datatype_demo
- WHERE metadata @> '{"level":"senior"}';

✅ generate_series() 함수
-	대량 데이터 생성 시 유용
-	날짜, 시간, 숫자 시퀀스를 간단하게 생성 가능

- SELECT generate_series('2024-01-01'::date, '2024-12-31'::date, '1 day');

✅ 대규모 데이터 테이블 생성
-	large_orders: 100만 건 주문 데이터
-	large_customers: 10만 건 고객 데이터

- 실무 데이터를 시뮬레이션하며 JSONB, 배열, 랜덤 생성, 범위 타입 등의 활용법을 익힘

---

## 🧪 EXPLAIN / ANALYZE 실습

-	EXPLAIN: 실행 계획 확인 (Cost, Rows, Width 등)
-	ANALYZE: 실제 실행 포함 (실제 수행 시간, 버퍼 정보 등)
-	FORMAT: JSON, VERBOSE, BUFFERS 옵션 활용 가능

- EXPLAIN (ANALYZE, VERBOSE, BUFFERS)
- SELECT * FROM large_customers WHERE loyalty_points > 8000;

## 💡 잘못된 JOIN 확인
- -- customer_name vs customer_id 를 잘못 JOIN한 예
- LEFT JOIN large_orders o ON c.customer_name = o.customer_id

---

## ⚙️ 인덱스(Index) 실습

✅ 단일 인덱스
- CREATE INDEX idx_orders_customer_id ON large_orders(customer_id);
-	인덱스 생성 전: 37506 rows / 131ms
-	인덱스 생성 후: 87 rows / 0.08ms

✅ 복합 인덱스와 순서 중요성
- -- region + amount 순서
- CREATE INDEX idx_orders_region_amount ON large_orders(region, amount);
-	고유값(카디널리티)이 높을수록 먼저 배치
-	SELECTIVITY 분석으로 인덱스 우선순위 결정
- SELECT COUNT(DISTINCT amount) * 100 / COUNT(*) AS 선택도 FROM large_orders;
- -- 99% → 매우 좋은 인덱스 후보

---

## ✅ PostgreSQL 인덱스 정리

### 🔸 인덱스 기본 개념

- 인덱스는 **검색 성능 향상**을 위해 사용되지만,

  - 저장 공간 추가 필요(📦)
  - 데이터 수정 시 성능 저하(✏️)
- **실제 쿼리 패턴 분석 후 설계** 필요
- **성능 측정은 실제 데이터**로 테스트해야 정확함

---

### 🔸 인덱스 유형별 정리

| 인덱스 종류          | 용도/특징                                                              |
| --------------- | ------------------------------------------------------------------ |
| **B-Tree (기본)** | `=`, `>`, `<`, `BETWEEN`, `ORDER BY`, `LIKE 'abc%'` 등 범위·정렬 검색에 적합 |
| **Hash 인덱스**    | `=` 정확한 일치 검색 전용 (범위·정렬 불가)                                        |
| **Partial 인덱스** | 조건부 인덱스 생성 (`WHERE 조건` 포함) → 공간과 비용 절약                             |

---

### 🔸 인덱스가 작동하지 않는 예시와 해결 방법

| 비효율적 쿼리                | 원인                | 해결 방법                                            |
| ---------------------- | ----------------- | ------------------------------------------------ |
| `UPPER(name) = 'JOHN'` | 함수 사용             | 함수 기반 인덱스 → `CREATE INDEX ON users(UPPER(name))` |
| `age = '25'`           | 타입 불일치 (숫자 ↔ 문자열) | 정확한 타입 사용: `age = 25`                            |
| `LIKE '%김'`            | 앞쪽 와일드카드          | 불가 → 전체 검색 발생                                    |
| `age != 25`            | 부정 조건             | 범위 조건으로 전환: `age < 25 OR age > 25`               |

---

### 🔸 참고 쿼리

```sql
-- 함수 기반 인덱스
- CREATE INDEX idx_upper_name ON users(UPPER(name));

-- 부분 인덱스
- CREATE INDEX idx_active_users ON users(age) WHERE is_active = TRUE;

-- 일반 인덱스 예시
- CREATE INDEX idx_customer_age ON large_customers(age);

-- 실제 사용 예
- SELECT * FROM large_customers WHERE age = 30 LIMIT 10;
```
---

## 📈 Insights

-	PostgreSQL은 강력한 데이터 타입과 고급 인덱싱 전략을 통해 대규모 데이터 분석에 적합하다.
-	EXPLAIN (ANALYZE)로 쿼리 병목을 직접 확인하고, 성능 개선이 가능하다.
-	실무에서는 JSONB, 배열, 범위, 위치 타입 등의 활용도가 높다.

---

## 💬 느낀점

- MySQL보다 더 풍부하고 정교한 PostgreSQL의 기능들 덕분에, 데이터 모델링이 훨씬 유연하고 표현력 있게 느껴졌다.
- 실습을 통해 "데이터를 구조화하고 빠르게 검색하는 기술"이 얼마나 중요한지를 체감했다.
- 특히 EXPLAIN ANALYZE는 쿼리를 '읽는 기술'이기도 하다는 걸 알게 된 하루였다.

---

## 🗂️ Reference

-	실습 파일: pg-01-datatype.sql ~ pg-05-various-index.sql
-	PostgreSQL 공식문서: https://www.postgresql.org/docs
-	generate_series() 문서: 함수 레퍼런스

---







## 🌱 Today I Learned

## 📅 Date
2025-07-09 (화)

## 📘 Subject
PostgreSQL - CTE, Recursive CTE, Window Function

---

## ✅ What I Learned

1. 📦 CTE (Common Table Expression)
- 복잡한 쿼리를 이름 있는 임시 테이블처럼 나눠서 작성
-	WITH ~ AS () 형식 사용
-	가독성 향상, 디버깅 용이, 중복 계산 제거에 유리
```sql
복사편집
WITH avg_order AS (
	SELECT AVG(amount) AS avg_amount FROM orders
)
SELECT customer_name, amount
FROM orders
WHERE amount > (SELECT avg_amount FROM avg_order);
```
---

## 2. 🔁 Recursive CTE

- CTE 안에서 자기 자신을 재귀적으로 호출하는 구조
-	주로 계층 구조, 달력 생성, 수열 생성 등에 사용
```sql
복사편집
WITH RECURSIVE numbers AS (
	SELECT 1 AS num
	UNION ALL
	SELECT num + 1 FROM numbers WHERE num < 10
)
SELECT * FROM numbers;
```

---

3. 🔍 Window Function (OVER())

- 각 행에 대해 전체 또는 그룹 기준의 통계를 함께 보여줌
-	AVG() OVER(), ROW_NUMBER() OVER(ORDER BY ...), RANK(), DENSE_RANK() 등
-	GROUP BY 없이도 행 단위로 통계값 확인 가능
```sql
복사편집
SELECT order_id, amount,
	AVG(amount) OVER() AS 전체평균,
	ROW_NUMBER() OVER(ORDER BY amount DESC) AS 순위
FROM orders;
```

---

4. 📊 고객 등급 분류 (CTE 활용한 분석 예시)
-	고객을 VIP, 일반, 신규로 구분 (상위 20%, 평균 이상, 나머지)
-	PERCENTILE_CONT, CASE, CROSS JOIN 사용
-	등급별 통계 도출 (총 구매액, 평균 주문 수)

---

## 🔧 Keywords & Functions
- 개념/함수	설명
- CTE	임시 테이블처럼 쓰는 쿼리 블록 (WITH)
- RECURSIVE	자기 자신을 호출하는 CTE
- OVER()	윈도우 함수 지정
- ROW_NUMBER()	정렬 기준으로 순위 부여
- RANK(), DENSE_RANK()	공동 순위 처리 방식 다름
- PERCENTILE_CONT()	분위수 계산 함수 (예: 상위 20%)
	
---

## 💭 Feeling
- 오늘은 PostgreSQL의 CTE와 윈도우 함수, 재귀 쿼리를 심화로 학습했다.
- 기능은 유용하지만 문법이 많고 생소해서 조금 어렵게 느껴졌다.
- 특히 RECURSIVE, PERCENTILE_CONT, OVER()와 같은 키워드들은 복습이 필요하다.
- 쿼리 흐름을 단계별로 쪼개고, 중간 결과를 직접 출력하며 연습하는 게 중요하다고 느꼈다.







---

## 🌱 Today I Learned

## 📅 Date
2025-07-10 (수)

## 📘 Subject
- PostgreSQL 고급 쿼리 심화 
- (Window Function, PARTITION, LAG/LEAD, NTILE, PERCENT_RANK 등)

---

## ✅ What I Learned

1. 🪟 Window 함수 (OVER() 사용)

- 그룹 없이도 각 행에 대해 통계나 순위를 계산
-	AVG() OVER(): 전체 평균
-	ROW_NUMBER() OVER(ORDER BY ...): 일련번호 부여
-	RANK(), DENSE_RANK(): 공동 순위 처리
-	PARTITION BY: 그룹 내에서 통계 적용
```sql
 SELECT customer_id, amount,
        AVG(amount) OVER() AS 전체평균,
       ROW_NUMBER() OVER (ORDER BY amount DESC) AS 순위
FROM orders;
```

---

2. 📊 PARTITION BY
- 윈도우 함수를 특정 그룹 기준으로 적용 (ex. 지역별, 월별 등)
```sql
 ROW_NUMBER() OVER (PARTITION BY region ORDER BY amount DESC) AS 지역순위
 ```

---

3. 🔁 LAG / LEAD 함수
- 이전값(LAG), 다음값(LEAD)을 가져와 변화 추적
-	전월대비 매출 증가/감소 계산
-	고객별 구매 간격 분석
```sql
 LAG(amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS 이전구매금액
 ```

---

4. 🧭 NTILE / PERCENT_RANK / FIRST_VALUE / LAST_VALUE
-	NTILE(n): 데이터를 n등분
-	PERCENT_RANK(): 백분율 순위
-	FIRST_VALUE, LAST_VALUE: 그룹 내 최고/최저 항목 추출
```sql
 NTILE(4) OVER (ORDER BY 총구매금액) AS 분위4
 PERCENT_RANK() OVER (ORDER BY price) AS 백분위순위
 ```

---

## 🔧 정리된 함수/용어

- 함수	설명
- OVER()	윈도우 함수 실행 범위 지정
- PARTITION BY	그룹 단위 지정
- ROW_NUMBER()	고유한 순번 부여
- RANK(), DENSE_RANK()	공동 순위 처리
- LAG(), LEAD()	이전/다음 행 참조
- NTILE(n)	데이터 n등분
- PERCENT_RANK()	백분율 순위 계산
- FIRST_VALUE(), LAST_VALUE()	파티션 기준 첫/마지막 값 반환
	
---

## 💭 Feeling
- 하루하루 SQL이 단순 조회에서 고급 분석 도구로 보이기 시작했다.
- 특히 PARTITION, LAG, LEAD, NTILE, PERCENT_RANK는
- 데이터 흐름을 읽는 감각이 필요해서 쉽진 않지만
- 구조가 잡히는 느낌이 들었다.
- 아직 함수나 윈도우 범위에 대한 감각은 부족하지만,
- 반복 학습을 통해 점점 익숙해질 것 같다.
- 복잡한 쿼리도 단계별로 나누고, 출력해보는 습관을 들이자.

---
