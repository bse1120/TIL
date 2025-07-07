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






