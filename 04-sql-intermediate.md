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

-	실습 파일: pg-01-datatype.sql ~ pg-04-index.sql
-	PostgreSQL 공식문서: https://www.postgresql.org/docs
-	generate_series() 문서: 함수 레퍼런스

---
