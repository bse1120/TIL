
# 🌱 Today I Learned

## 📅 Date
2025-06-30

---

Subject: SQL Basic DAY 1

## 📘 What I Learned

✅ 함수 및 기능

- 정해진 명령어 : 대문자로 작성 (SQL 국룰)
- SQL Table = Excel 시트
- 데이터 4기능 ( CRUD operation ) : 생성 / 조회 / 수정 / 삭제
- 모든 테이블에 포함되는 것 : PRIMARY KEY *하나만 설정 가능*

---

## 📘 What I Learned

-	✨ CREATE DATABASE : 새로운 데이터베이스 생성
-	✨ CREATE TABLE : 테이블 구조 정의 및 생성
-	✨ INSERT INTO : 데이터 입력
-	✨ SELECT : 데이터 조회
-	✨ UPDATE / DELETE : 데이터 수정 및 삭제
-	✨ ALTER TABLE : 테이블 구조 변경
-	✨ VARCHAR(숫자) : (숫자) 자리수까지만 입력 가능 – 길이제한 O
-	✨ TEXT : 길이제한 X
-	✨ INT : 정수

---

## 🔍 Detail

✅ 데이터베이스 생성 및 사용

- CREATE DATABASE sample_db;
- DROP DATABASE sample_db;
- SHOW DATABASES;
- USE lecture;
-	CREATE DATABASE로 데이터베이스 생성하고, USE로 해당 DB 사용
-	DROP DATABASE로 삭제 가능

✅ 테이블 생성 및 조회

- CREATE TABLE members (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  email VARCHAR(100) UNIQUE,
  join_date DATE DEFAULT(CURRENT_DATE)
);
- SHOW TABLES;
- DESC members;
-	CREATE TABLE로 테이블 생성
-	DESC 테이블명으로 테이블의 구조 확인 가능

✅ 데이터 삽입

- INSERT INTO members (name, email) VALUES ('배승은', 'bae@a.com');
- INSERT INTO members (email, name) VALUES ('lee@a.com', '이재필');
-	INSERT INTO는 컬럼 순서와 데이터가 일치해야 함
-	여러 행도 한 번에 삽입 가능
	
✅ 데이터 조회

- SELECT * FROM members;
- SELECT name, email FROM members WHERE id=3;
-	SELECT는 데이터를 조회하는 명령어
-	WHERE 조건으로 특정 데이터만 조회 가능

✅ 데이터 수정 및 삭제

- UPDATE members SET name='홍길동' WHERE id=6;
- DELETE FROM members WHERE id=7;
- DELETE FROM members; -- 전체 삭제 주의
-	UPDATE로 특정 조건의 데이터를 수정
-	DELETE로 조건에 맞는 데이터 삭제 가능

✅ 테이블 구조 변경

- ALTER TABLE members ADD COLUMN age INT DEFAULT 20;
- ALTER TABLE members DROP COLUMN age;
- ALTER TABLE members MODIFY COLUMN name VARCHAR(50);
- ALTER TABLE로 컬럼 추가, 수정, 삭제 가능

---

## 🧠 Summary

-	SQL 기본 문법인 CRUD(Create, Read, Update, Delete)에 대해 학습했다.
-	DESC, SHOW 등으로 구조와 상태를 수시로 확인하며 실습한 것이 큰 도움이 되었다.
-	ALTER TABLE을 통해 테이블 구조 변경이 가능하다는 점이 흥미로웠다.

---

## 💬 느낀점

- SQL은 영어 문장처럼 읽히는 구조라 처음엔 읽기 쉽지만,
- 실수 하나로 전체 데이터를 지우는 경우도 있어 조심이 필요하다는 걸 느꼈다.
- 특히 DELETE FROM 테이블명;은 실습이더라도 무서웠다..! 😨

---

## 🗂️ Reference

-	https://sqlzoo.net
-	https://www.w3schools.com/sql/
-	오늘 실습 파일: 01-createdb.sql ~ 06-alter.sql 







# 🌱 Today I Learned

## 📅 Date
2025-07-01

Subject: SQL Basic DAY 2

## 📘 What I Learned

* Deprecated : 더 이상 사용되지 않음

✅ 기본 문법 및 기능

- SELECT: 데이터 조회
- FROM: 조회할 테이블 지정
- WHERE: 조건 지정
- ORDER BY: 정렬 기준 설정 (기본값: 오름차순 ASC / 내림차순 DESC)
- LIMIT: 조회할 결과 개수 제한
- OFFSET: 결과 시작 위치 지정 (페이징 처리)

✅ 테이블 및 데이터 조작

- DROP TABLE 테이블명 : 테이블 삭제
- CREATE TABLE : 테이블 생성
- DESC 테이블명 : 테이블 구조 확인
- INSERT INTO : 데이터 삽입
- UPDATE : 데이터 수정
- ALTER TABLE : 테이블 구조 변경 (ADD, MODIFY 등)
- DELETE FROM : 데이터 삭제

---

## 🔍 Detail

📂 실습 1: students 테이블

- 나이(age), 이름(name) 기준으로 다양한 조건 조회 실습
- LIKE, BETWEEN, IN, NOT, != 등 다양한 조건문 학습
- ORDER BY로 다중 정렬 실습 (예: age ASC, grade DESC)
- ALTER TABLE로 컬럼 추가 및 데이터 업데이트 (grade 컬럼추가 → 'A', 'B', 'C' 등급 설정)

📂 실습 2: userinfo 테이블

- 이메일 도메인(gmail, naver 등) 필터링
- IS NULL, IS NOT NULL 조건 확인
- 이름, 전화번호, 나이 정렬 및 페이지네이션(LIMIT, OFFSET) 실습
- WHERE절 내 AND, OR, 괄호를 활용한 복합 조건 검색

📂 실습 3: dt_demo 테이블 (데이터타입)

- 다양한 데이터 타입 실습:
- VARCHAR, INT, FLOAT, DECIMAL, TEXT, DATE, DATETIME, BOOLEAN
- 날짜(birth), 점수(score), 설명(description) 등을 조건으로 활용한 필터링

---

## ✨ String Functions

- 함수	설명
- CHAR_LENGTH()	문자열 길이 확인
- CONCAT()	문자열 합치기
- UPPER() / LOWER()	대소문자 변환
- SUBSTRING(), LEFT(), RIGHT()	문자열 자르기
- REPLACE()	특정 문자열 치환

•	예시:

- SELECT CONCAT(name, '(', score, ')') AS info FROM dt_demo;
- SELECT REPLACE(description, '학생', '**') AS secret FROM dt_demo;

---

## 🧠 Summary
-	다양한 조건 필터링, 정렬, 페이징 처리 방법을 실습하며 SQL 쿼리 작성 능력을 키웠다.
-	문자열 함수는 텍스트 전처리 시 유용하게 사용될 수 있다는 점이 인상 깊었다.
-	특히 LIKE, IN, BETWEEN, IS NULL과 같은 구문은 실무에서 자주 사용할 것으로 보인다.

---

## 💬 느낀점

- 실습을 통해 단순히 문법을 아는 것에서 벗어나, 데이터의 흐름을 이해하며 조건을 걸고 조작하는 법을 익혔다.
- 문자열 함수는 추후 데이터 분석이나 텍스트 전처리에서도 유용하게 활용될 것 같다.
- 특히 LIMIT, OFFSET을 활용한 페이지네이션은 웹서비스와 연결할 때도 자주 쓰일 개념이라 익숙해져야겠다고 느꼈다.

---

## 🗂️ Reference

-	SQLZOO
-	W3Schools SQL Tutorial
-	실습 파일 07-select.sql ~ 10-str-func.sql
-	https://programmers.co.kr/learn/challenges?tab=all_challenges 
-	https://solvesql.com/problems/
-	https://www.hackerrank.com/domains/sql
-	https://www.testdome.com/tests







## 🌱 Today I Learned

## 📅 Date
2025-07-02

## Subject: SQL Basic DAY 3

---

## 📘 What I Learned

✅ 날짜 및 시간 함수

- 함수	설명
- NOW() / CURRENT_TIMESTAMP	현재 날짜+시간
- CURDATE() / CURRENT_DATE	오늘 날짜
- CURTIME() / CURRENT_TIME	현재 시간
- DATE_FORMAT(date, '패턴')	날짜를 특정 형식으로 출력
- DATEDIFF(date1, date2)	두 날짜 간 일수 차이
- TIMESTAMPDIFF(단위, date1, date2)	년, 월, 일 단위로 차이 계산
- DATE_ADD(date, INTERVAL X)	날짜 더하기
- DATE_SUB(date, INTERVAL X)	날짜 빼기
- YEAR(date), MONTH(), DAY()	날짜에서 연/월/일 추출
- QUARTER(date)	몇 분기인지 반환
- DAYOFWEEK(), DAYNAME()	요일 번호/이름 반환

---

✅ 숫자 함수

- 함수	설명
- ROUND(num, d)	반올림
- CEIL(num)	올림
- FLOOR(num)	내림
- TRUNCATE(num, d)	특정 소수점 자리수 이하 절삭
- DIV, %, MOD()	몫, 나머지
- POWER(x, y)	x의 y제곱
- SQRT(x)	제곱근
- ABS(x)	절댓값

---

✅ 조건문 함수

- 문법	설명
- IF(조건, 참, 거짓)	조건 판단 후 분기
- IFNULL(col, 값)	NULL이면 기본값
- CASE WHEN ... THEN ... ELSE ... END	복수 조건 분기

---

## 🔍 Detail

📂 dt_demo 테이블 실습

-	DATE_FORMAT()으로 날짜를 다양한 포맷으로 출력
-	TIMESTAMPDIFF()로 나이 계산
-	DATE_ADD()/DATE_SUB()로 날짜 연산
-	YEAR(), MONTH(), DAY(), DAYNAME() 등으로 날짜 정보 추출
-	ROUND(), CEIL(), FLOOR() 등의 숫자 함수로 점수 처리
-	IF, CASE 구문을 활용해 학점, 연령대, 상태 분류

📂 종합 정보 조회

-	NULL 처리 (IFNULL)
-	ROUND(score, 1) 및 CASE로 등급 평가
-	TIMESTAMPDIFF()로 나이 계산
-	IF() 조건으로 활성/비활성 구분
-	CASE로 연령대 분류 (청년/청장년/장년 등)

📂 sales 테이블 실습

-	COUNT(*), SUM(), AVG(), MIN(), MAX() 등 집계함수 실습
-	GROUP BY로 카테고리별, 지역별, 사원별 매출 분석
-	HAVING으로 그룹핑된 결과 필터링 (예: 매출 1천만원 이상 등)
-	월별 트렌드 분석 (MAU, 주문건수, 매출액 등)

---

## 🧠 Summary

-	날짜/시간 데이터를 가공해 나이, 요일, 가입경과일 등 실무에 유용한 정보로 변환하는 방법을 익혔다.
-	IF, CASE, IFNULL 등 조건 함수는 데이터 전처리에 핵심적인 기능으로 보였다.
-	집계함수 + GROUP BY + HAVING을 조합해 피벗 테이블처럼 데이터 요약 및 분석하는 능력을 키울 수 있었다.

---

## 💬 느낀점

- 날짜 및 숫자 함수는 단순 조회를 넘어서 유의미한 정보를 추출하는 데에 매우 유용하다는 점이 인상 깊었다.
- 특히 GROUP BY + HAVING은 실제 리포트 작성, 대시보드 설계 시 자주 쓰일 개념이라 익숙해지기 위해 반복 연습이 필요하다고 느꼈다.

---

## 🗂️ Reference

-	실습 파일: 11-datetime-func.sql ~ 15-having.sql
-	https://school.programmers.co.kr
- https://sqlzoo.net
- https://www.w3schools.com › sql
- https://solvesql.com
- https://www.hackerrank.com › domains › sql
- https://www.testdome.com







## 🌱 Today I Learned

## 📅 Date
2025-06-30

## Subject: SQL Basic Day 2 — Subquery & Join 실습

---

## 📘 What I Learned

- ✨ 서브쿼리(Subquery) : 쿼리 안에 또 다른 쿼리를 작성해 조건으로 활용하는 기법
- ✨ JOIN : 여러 테이블을 연결하여 하나의 결과로 보여주는 방법
- ✨ GROUP BY + 집계함수 : 그룹별로 데이터 요약

---

## 🔍 Subquery 이론 요약

😆 서브쿼리란?
- SQL 쿼리 내부에 들어가는 또 하나의 쿼리
- 예시:
- SELECT * FROM sales
- WHERE total_amount > (SELECT AVG(total_amount) FROM sales);

😆 서브쿼리 종류

- 단일값 서브쿼리 (Scalar) : =, >, < 와 함께 사용
- 다중값 서브쿼리 (Vector, Matrix) : IN, EXISTS, ANY, ALL 등과 함께 사용

😆 자주 나오는 문제 유형 3가지

- 평균/최대/최소값 등과 비교한다
-	"~~한 사람들"의 ~~~을 조회한다
-	"~~~한 적이 있는" 사람을 찾는다

⚠️ 서브쿼리를 쓰지 않는 경우

-	단순한 고정값 조건 (WHERE age > 30)
-	JOIN이 더 직관적일 때 (고객정보 + 주문정보 등)

---

🔍 실습 요약

✅ 단일값 서브쿼리

-- 평균보다 높은 주문

- SELECT * FROM sales
- WHERE total_amount > (SELECT AVG(total_amount) FROM sales);

-- 가장 최근 주문

- SELECT * FROM sales
- WHERE order_date = (SELECT MAX(order_date) FROM sales);

✅ 다중값 서브쿼리

-- VIP 고객의 주문

- ELECT * FROM sales
- WHERE customer_id IN (
-  SELECT customer_id FROM customers WHERE customer_type = 'VIP'
);

-- 전자제품 구매 고객의 전체 주문

- SELECT * FROM sales
- WHERE customer_id IN (
-  SELECT DISTINCT customer_id FROM sales WHERE category = '전자제품'
);

✅ JOIN 활용 예시

-- 고객정보 + 주문 JOIN

- SELECT *
- FROM customers c
- LEFT JOIN sales s ON c.customer_id = s.customer_id;


-- 고객 등급 및 활성도 분류

- SELECT 
-   c.customer_id,
-   c.customer_name,
-   COUNT(s.id) AS 구매건수,
-   COALESCE(SUM(s.total_amount), 0) AS 총구매액,
-   CASE
-     WHEN COUNT(s.id) >= 5 THEN '충성고객'
-     WHEN COUNT(s.id) >= 3 THEN '일반고객'
-     WHEN COUNT(s.id) >= 1 THEN '신규고객'
-     ELSE '잠재고객'
-   END AS 활성도
- FROM customers c
- LEFT JOIN sales s ON c.customer_id = s.customer_id
- GROUP BY c.customer_id, c.customer_name;

---

## 🧠 Summary

-	서브쿼리는 “평균보다 높은”, “~~한 적 있는”, “~~한 사람들의” 같은 패턴에 유용하다.
-	다만 JOIN이 더 직관적인 상황이라면 서브쿼리보다 JOIN을 택하는 게 좋음.
-	ABS(), CASE, COALESCE() 등을 활용하면 훨씬 더 풍부한 분석이 가능하다.

---

## 💬 느낀점

- 서브쿼리는 SQL의 ‘조건식 응용력’ 그 자체라고 느꼈다.
- 특히 단일값과 다중값의 구분, 그리고 상황에 따라 JOIN과 서브쿼리를 판단해서 선택하는 능력이 중요하다는 걸 알게 되었다.
- 하나의 질문에 여러 방식으로 접근할 수 있는 유연한 사고를 키우고 싶다 💡

---

## 🗂️ Reference

-	https://sqlzoo.net
-	https://www.w3schools.com/sql/
-	실습 파일: 16-subquery1.sql, 17-subquery2.sql, 18-join.sql, p08.sql

