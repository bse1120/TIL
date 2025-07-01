
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
