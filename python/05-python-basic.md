## 🌱 Today I Learned

## 📅 Date
2025-07-14

## 📘 Subject
Python 기초 DAY 1

---

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







---

## 🌱 Today I Learned

## 📅 Date
2025-07-15

## 📘 Subject
Python - 컨테이너(Container)와 관련 주요 개념

---

## 🔹 컨테이너란?

-	여러 값을 저장할 수 있는 객체로, 서로 다른 자료형도 함께 저장 가능
-	두 가지로 나뉜다:
-	시퀀스형 (ordered): list, tuple, range, str 등
-	비시퀀스형 (unordered): set, dict 등

---

## 🧩 시퀀스형 컨테이너

🔸 List (리스트)
-	[] 또는 list()로 생성
-	순서 O / 수정 가능 (mutable)
-	인덱싱, 슬라이싱 가능
locations = ['반포', '안양', '광교']
locations[0]  # '반포'
locations[-1]  # '광교'

🔸 Tuple (튜플)
-	() 또는 tuple()로 생성
-	순서 O / 수정 불가능 (immutable)
-	단일 원소 튜플 생성 시 쉼표 필요: (1,)
my_tuple = (1, 2)
single_tuple = (1,)



## 🔸 Range
-	정수 시퀀스를 생성하는 함수형 객체
-	range(n), range(start, end), range(start, end, step)
-	반복 가능, 인덱싱/슬라이싱 가능
list(range(1, 10, 2))  # [1, 3, 5, 7, 9]

---

## 🧩 비시퀀스형 컨테이너

🔸 Set (세트)
-	{} 또는 set()으로 생성
-	순서 X / 중복 X / 수정 가능
-	집합 연산 가능: 합집합(|), 교집합(&), 차집합(-)
set1 = {1, 2, 3}
set2 = {3, 4, 5}
set1 | set2  # 합집합

🔸 Dictionary (딕셔너리)
-	{key: value} 또는 dict()로 생성
-	순서 X / key는 immutable만 가능
-	중복 key는 마지막 값만 유지됨
phone_book = {'서울': '02', '경기': '031'}
phone_book['서울']  # '02'

---

🔁 컨테이너 형변환
-	컨테이너 간 명시적 형변환 가능 (list(), tuple(), set(), str(), etc.)
-	단, 일부 변환은 불가능 (range(), dict() 등)

---

🧷 패킹 & 언패킹
-	* 사용
-	패킹: 하나의 변수에 여러 값 할당 → 리스트
-	언패킹: 여러 변수에 값 분해 할당
x, *y = [1, 2, 3, 4]  # x = 1, y = [2, 3, 4]

---

➕ 시퀀스형 연산자
-	+: 연결
[1, 2] + [3], 'ab' + 'cd'
-	*: 반복
[0] * 3, 'hi' * 2
-	range에는 +, * 사용 불가

---

🔍 인덱싱 & 슬라이싱
-	시퀀스형에서 특정 위치의 요소에 접근하거나 범위 지정 가능
-	[:] 형태 사용
-	슬라이싱의 end 인덱스는 포함 X, step도 지정 가능
s = 'abcdef'
s[::2]  # 'ace'
s[::-1]  # 'fedcba'

---

🧠 기타 학습
🔸 함수(Function)
def multiply(x, y, z):
    return x * y * z

🔸 모듈(Module)
-	함수/클래스의 집합, 외부에서 불러오기 가능

🔸 패키지(Package)
-	여러 모듈을 묶은 구조

🔸 라이브러리(Library)
-	패키지들의 모음

---

📝 느낀점
- 오늘은 Python의 자료구조 중 컨테이너의 전반적인 개념과 활용을 학습하며, 각 타입의 특성과 차이점, 그리고 형변환, 연산자 사용 방법 등을 익힐 수 있었다. 
- 특히 패킹/언패킹과 슬라이싱의 유용함을 체감했으며, 이후 다양한 데이터 처리 및 알고리즘에서 적극 활용할 수 있을 것 같다.







---

## 🌱 Today I Learned

## 📅 Date
2025-07-16

## 📘 Subject
Python - 제어문(Control Statement)

---

## 🔍 What I Learned

✅ 제어문이란?
-	프로그램의 실행 흐름을 제어하는 문법
-	조건에 따라 실행할 코드 블록을 선택하거나, 반복 실행하도록 함
-	크게 조건문(if) 과 반복문(while, for) 으로 나뉨

---

🧩 조건문 (Conditional Statement)

🔹 기본 구조
if 조건식:
    실행문
elif 다른 조건:
    실행문
else:
    실행문
-	조건식은 참(True)/거짓(False) 판별이 가능한 표현식이어야 함
-	들여쓰기(4spaces)를 반드시 지킬 것

🔹 중첩 조건문
-	if 문 안에 또 다른 if 문을 작성 가능
-	예: 특정 조건이 참일 때 추가적인 조건 검사

🔹 조건 표현식 (Ternary Operator)
<참일 때 값> if <조건식> else <거짓일 때 값>

🔹 실습 예시
-	크리스마스 판독기
-	홀/짝 판별기
-	미세먼지 수치 판독기 (단순 + 중첩 조건문)
-	절댓값/삼항 연산자 변환 실습

---

🔁 반복문 (Loop Statement)

🔹 while 문
-	조건이 참인 동안 반복 실행
while 조건식:
    실행문
-	반드시 종료 조건 필요 (무한 루프 주의)

🔹 for 문
-	iterable 객체(list, string, range 등)를 순회
for 변수 in iterable:
    실행문

🔹 enumerate
-	인덱스 + 값을 함께 순회
for i, v in enumerate(리스트):
    ...

🔹 List/Dict Comprehension
-	반복문 + 표현식을 이용해 리스트/딕셔너리 한 줄로 생성
[표현식 for 변수 in iterable]
{키: 값 for 변수 in iterable}

---

⚙️ 반복 제어문

🔸 break
-	반복문 즉시 종료

🔸 continue
-	해당 반복 건 건너뛰고 다음 반복으로 진행

🔸 pass
-	실행할 내용 없이 자리를 채워주는 문법

🔸 for-else
-	break 없이 반복이 정상 종료되면 else 블록 실행

---

## 🧠 Takeaways

-	들여쓰기와 조건 순서를 잘못 설정하면 예상치 못한 결과가 나올 수 있음
-	elif의 순서를 고려하여 구체적인 조건부터 위로 배치할 것
-	while문에서는 종료 조건 없을 시 무한 루프 발생 주의
-	for-else 문은 처음 써봤지만 매우 유용한 구조라는 것 알게 됨
