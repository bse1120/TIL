
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
- 	ALTER TABLE로 컬럼 추가, 수정, 삭제 가능

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
