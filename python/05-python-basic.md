## 🌱 Today I Learned

## 📅 Date
2025-07-14

## 📘 Subject
Python 기초 DAY 1

## 💡 What I Learned

✅ Python 문법 및 기본 개념

-	들여쓰기(Indentation)
중괄호 대신 들여쓰기(4칸 space or 1 tab)를 사용하며, 한 코드 내에서 혼용 불가 (PEP8에선 space 권장)

-	✨ 변수(Variable)
-	객체(object)를 참조하기 위한 이름
-	할당 연산자 = 사용
-	데이터 타입 확인: type(), 메모리 주소 확인: id()

-	✨ 동시 할당 / 값 교환
- x, y = y, x로 값 교환 가능
-	임시변수 없이도 가능

-	✨ 식별자(Identifiers)
변수/함수 이름은 대소문자 구별, 숫자 시작 불가, 예약어 사용 불가 (keyword.kwlist로 확인 가능)
내장함수(print, input 등) 이름으로 덮어쓰지 않도록 주의

-	✨ 입력 함수(input)
사용자 입력을 문자열(str)로 반환. int(input()) 등으로 형변환 필요

-	✨ 주석(Comment)
-	한 줄: #,
-	여러 줄: ''' ''' 또는 """ """ (docstring 형태)

---

✅ 자료형(Data Types)

-	✨ 불린형(Boolean)
-   True, False, bool() 함수로 값의 논리적 참/거짓 판단

-	✨ 수치형
-	int: 정수, Python3는 long과 통합, 2/8/16진수 표기 가능
-	float: 실수, 부동소수점 연산 오차 있음 (round(), math.isclose() 활용)
-	complex: 복소수 (허수는 j 사용)

-	✨ 문자열(str)
-	', ", ''' ''' 모두 사용 가능
-	\n, \t, \\ 등 escape sequence 존재
- f-string(f"이름: {name}")으로 편리한 문자열 포맷팅 가능

-	✨ NoneType
-	값이 없음: None

---

✅ 연산자

-	산술 연산자: +, -, *, /, //, %, **
-	비교 연산자: <, <=, >, >=, ==, !=, is, is not
-	논리 연산자: and, or, not → 단축 평가(Short-circuit evaluation)
-	복합 대입 연산자: +=, -=, *=, /=, //=, %=, **=
-	멤버십 연산자: in
-	동일성 연산자: is, is not → id() 비교

---

🧠 How I Felt

-	SQL 선행 학습 덕분인지 파이썬 기초 문법이 더 쉽게 느껴졌음
-	변수 개념, 연산자, f-string 등은 익숙하고 직관적
-	단축평가와 is, in 연산자의 동작 방식이 인상 깊었음
-	float 오차는 직접 실습하며 체감함 → 실무에서 중요할 수 있을 듯

---

🔁 To Review

-	round()의 짝/홀 반올림 규칙
-	is vs == 차이
-	f-string 포맷팅 옵션 다양하게 활용해보기
-	math.isclose() 사용 방식 더 익히기
