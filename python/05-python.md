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







--- 

## 🌱 Today I Learned

## 📅 Date
2025-07-17

## 🐍 Python - 자료구조 (Data Structure)

---

## ✅ 학습 내용

오늘은 **파이썬의 데이터 구조(Data Structure)**를 학습했다.
자료형의 종류를 기준으로 순서 있는 구조와 순서 없는 구조로 나누어 각 컨테이너의 속성과 메서드를 실습을 통해 익혔다.

---

## 🔹 데이터 구조란?

-	데이터의 구성, 저장 방식, 관리 방법을 의미
-	값, 값 간의 관계, 해당 데이터에 적용할 수 있는 명령어들의 집합
-	효율적인 접근 및 수정을 가능케 함

---

## 📂 데이터 구조 분류

순서가 있는 구조 (Ordered)	순서가 없는 구조 (Unordered)
문자열 (str)	셋 (set)
리스트 (list)	딕셔너리 (dict)
튜플 (tuple)	
	
---

## 📘 순서가 있는 구조

✅ 문자열 (str)
-	불변(immutable) / 순서 있음(ordered) / 순회 가능(iterable)
-	다양한 검증 및 조작 메서드 제공
-	주요 메서드: .find(), .index(), .startswith(), .isalpha(), .replace(), .strip(), .split(), .join(), .upper() 등
-	예: 'hello'.startswith('h') → True, 'apple'.find('z') → -1

✅ 리스트 (list)
-	가변(mutable) / 순서 있음 / 반복 가능
-	값 추가/삭제, 정렬 등 다양한 조작 가능
-	주요 메서드: .append(), .extend(), .insert(), .remove(), .pop(), .sort(), .reverse(), .count(), .index()
-	예: lst.append(x), lst.sort(reverse=True)

✅ 튜플 (tuple)
-	불변(immutable) / 순서 있음
-	변경 불가능하므로 탐색 관련 메서드만 존재
-	주요 메서드: .index(), .count()
-	예: ('a', 'b', 'c').count('a') → 1

---

## 📘 순서가 없는 구조

✅ 셋 (set)
-	가변(mutable) / 순서 없음 / 중복 허용 X
-	수학의 집합 개념과 유사 (합집합, 교집합 등 가능)
-	주요 메서드: .add(), .update(), .remove(), .discard()
-	예: {1, 2, 3}.add(4), {1, 2}.remove(5) → KeyError

✅ 딕셔너리 (dict)
-	가변(mutable) / 순서 없음
-	Key:Value 쌍의 구조
-	주요 메서드: .get(), .setdefault(), .pop(), .update()
-	예: d.get('apple', '없음'), d.update({'key':'value'})

---

## 🧠 얕은 복사 vs 깊은 복사

✅ 변경 불가능한 자료형 (immutable):
-	복사 시 새로운 객체가 생성됨
-	예: int, str, tuple

✅ 변경 가능한 자료형 (mutable):
-	단순 할당 시 동일 객체를 참조함 (id() 동일)
-	복사 방법
o	얕은 복사: copy(), list(), 슬라이싱 [:]
o	깊은 복사: copy.deepcopy()

---

## 💡 느낀점
-	자료구조는 데이터의 특성에 따라 적절히 선택해야 한다는 점을 체감함
-	리스트의 append, extend 차이와 sort, reverse는 꼭 구분해서 사용해야 함
-	문자열과 리스트는 실습을 통해 메서드 사용법이 익숙해졌고, 딕셔너리와 셋은 실무에서도 자주 쓰일 수 있는 강력한 구조라는 걸 느꼈음
-	특히 얕은 복사 vs 깊은 복사의 차이를 시각화 도구로 확인하며 직관적으로 이해할 수 있었음







---

## 🌱 Today I Learned

## 📅 Date
2025-07-18

## 🐍 Python 기초 문제 풀이

---

## ✅ 주요 학습 내용
- 오늘은 파이썬 문법의 기초를 복습하면서, 입력/출력, 자료형, 조건문, 문자열 처리, 리스트 탐색 등을 연습문제로 해결했다.
- 각 문제는 단순한 문법뿐 아니라, 표현 방식, 가독성, 파이썬스러운 문법 사용까지 고민해보는 시간이었다.

---

## 💡 연습 문제 요약

1️⃣ 사용자 입력 두 개를 받아 합 출력
- num1 = int(input())
- num2 = int(input())
- print(num1 + num2)  # 간결하지만 중간값 변수 없다는 차이

✅ 더 명시적으로:
- result = num1 + num2 → print(result)

---

2️⃣ 다양한 자료형의 타입 출력
a = 10
b = 3.14
c = "hello"
d = True

print(type(a), type(b), type(c), type(d))

✅ 반복문 활용해서 출력하는 것도 좋은 습관
for x in [a, b, c, d]:
    print(type(x))

---

3️⃣ 문자열 결합과 길이 구하기
str1 = "Hello"
str2 = "World"
combine = str1 + str2
print(len(combine))

✅ 응용: for문으로 문자열 길이 구하기
✅ split() 사용한 분리 및 길이 확인 등 다양한 방법 실습

---

4️⃣ 몫과 나머지 구하기
a = 10
b = 3
print('몫:', a // b)
print('나머지:', a % b)

---

5️⃣ 짝수/홀수 판별
num = int(input("숫자를 입력하세요: "))

if num % 2:
    print("odd")
else:
    print("even")

✅ 파이썬에서는 if num % 2 == 0: → 짝수
else 대신 if num % 2 == 1:도 명시적으로 작성 가능

---

6️⃣ 문자열 인덱싱 및 슬라이싱
text = "Python Programming"
print(text[0:6])  # 'Python'

✅ split() 사용한 다른 풀이도 학습

---

7️⃣ 세 수 중 가장 큰 수 찾기
a = int(input())
b = int(input())
c = int(input())

print(max(a, b, c))

---

8️⃣ 나이를 기준으로 성인/미성년자 판별
age = int(input())

if age >= 20:
    print("성인")
else:
    print("미성년자")

---

9️⃣ 문자열을 대문자로 변환
text = input("문자열을 입력하세요: ")
print(text.upper())

✅ ord() 함수와 아스키코드 개념도 함께 확인
→ 대소문자 구분/변환 원리 이해

---

🔟 두 숫자의 절댓값 차이 구하기
a = int(input())
b = int(input())

print(abs(a - b))

✅ abs() 없이 if문으로 구현하는 방식도 연습

---

## ✍️ 느낀 점

-	익숙한 문제라도 다양한 표현 방식을 고민해보는 것이 중요하다.
-	input, print, type, abs, ord 등 기초 내장 함수가 매우 강력하다.
-	문자열과 리스트는 슬라이싱, 반복문, 조건문과 함께 자주 등장하므로 반복 숙달 필요!
-	if에서 else를 반드시 쓰지 않아도 두 개의 조건문으로 나눌 수 있다는 점이 인상 깊었다.
-	문제를 푼 뒤 다른 풀이를 비교 분석하는 것이 큰 도움이 되었다.







---

## 🌱 Today I Learned

## 📅 Date
2025-07-21

## 🐍 Python 기초 문제 풀이

---

## 🧠 배운 개념 요약

📌 변경 가능한(mutable) vs 변경 불가능한(immutable) 데이터
-	immutable: int, float, str, bool, tuple, range, frozenset
→ 복사하면 값 자체가 복제됨 (b를 바꿔도 a에 영향 없음)
-	mutable: list, dict, set
→ 복사하면 동일한 객체를 가리킴 (b를 바꾸면 a도 바뀜)

🔁 얕은 복사 vs 깊은 복사:
-	copy() or [:] → 얕은 복사
-	copy.deepcopy() → 깊은 복사

---

## ✅ 실습 문제 정리 (11번~20번)

11. 5의 배수 리스트 만들기
-	range, while, 곱셈 패턴 등 다양한 반복문 패턴 활용
-	리스트 내포도 사용 가능
five = [n for n in range(1, 101) if n % 5 == 0]

12. 짝수 필터링
-	조건문 + 리스트 내포
even = [n for n in nums if n % 2 == 0]

13. 딕셔너리에서 가장 비싼 과일 찾기
-	max(fruits, key=fruits.get)을 이용한 풀이와
-	반복문으로 최대값 찾기 비교
-	동일한 최고가 여러 개일 경우 리스트로 저장하는 로직도 학습

14. 구구단 출력 (3단)
-	for문 활용하여 반복문 익히기
for i in range(1, 10):
    print(f'3 x {i} = {3 * i}')

15. 문자열 문자 개수 세기
-	dict.get()과 조건문을 이용해 문자 개수를 세는 방법 학습

16. 리스트 정렬 + 최대/최소 찾기
-	sorted(), sort(), max(), min() 활용
-	직접 최대/최소를 반복문으로 구현하는 방식도 익힘

17. 회문 판별
-	문자열을 뒤집어서 비교 ([::-1])
-	replace, strip 등으로 공백/개행 처리

18. 집합 연산
-	합집합(|), 교집합(&), 차집합(-) 사용

19. 1부터 n까지 합
-	for문, sum(range()), 수학 공식을 이용한 다양한 풀이

20. 리스트 중복 제거
-	set을 이용한 간단한 방법
-	not in 조건으로 수동 필터링 구현

---

## 🔍 느낀 점
-	조건문, 반복문, 자료구조를 복합적으로 다루는 문제들이 많았는데, 다양한 접근법을 비교하며 풀이할 수 있어 좋았다.
-	dict, set 같은 구조도 많이 활용하게 되었고, 효율적인 풀이법에 대한 감각이 생긴 것 같다.
-	특히 max(fruits, key=fruits.get) 같은 문법이 실용적이라는 걸 느낌!







---

## 🌱 Today I Learned

## 📅 Date
2025-07-22

## 🐍 Python

-	객체지향 프로그래밍(OOP)의 4가지 핵심 개념
-	SOLID: 객체지향 설계 5대 원칙

---

🧠 학습 내용 정리

🔸 1. 객체지향 프로그래밍(OOP)의 4가지 주요 특성
OOP는 현실 세계의 사물을 객체로 모델링하여 프로그래밍에 적용하는 패러다임이다. OOP의 핵심은 코드의 재사용성, 유지보수성, 유연성을 높이는 것이다. 이를 실현하기 위한 네 가지 주요 원칙은 다음과 같다:

🔹 추상화 (Abstraction)
-	정의: 불필요한 세부사항은 숨기고, 객체의 본질적인 특징만을 표현하는 기법.
-	이점: 복잡한 시스템을 단순하게 바라볼 수 있으며, 코드 재사용성과 유지보수성이 높아진다.
-	예시: "자동차" 객체는 엔진 작동 방식 같은 내부 동작을 감춘 채, start(), stop() 등의 인터페이스만 외부에 노출한다.

🔹 캡슐화 (Encapsulation)
-	정의: 데이터(속성)와 이를 조작하는 메서드를 하나의 단위로 묶고, 외부에서는 직접 접근하지 못하도록 막는 것.
-	이점: 데이터 무결성을 보장하고 객체의 내부 구현 변경이 외부에 영향을 주지 않도록 한다.
-	예시: 클래스의 속성을 private로 선언하고, get/set 메서드로만 접근하게 한다.

🔹 상속 (Inheritance)
-	정의: 기존 클래스의 속성과 기능을 새로운 클래스가 물려받아 확장하거나 재정의할 수 있게 하는 것.
-	이점: 코드 중복을 줄이고, 유사한 객체 간의 관계를 체계적으로 표현할 수 있다.
-	예시: Animal 클래스를 상속받는 Dog, Cat 클래스는 공통 기능은 물려받고, 고유한 기능은 추가한다.
🔹 다형성 (Polymorphism)
-	정의: 동일한 이름의 메서드가 객체의 타입에 따라 다른 방식으로 동작할 수 있는 능력.
-	이점: 유연하고 확장 가능한 설계를 가능하게 해준다.
-	예시: speak() 메서드는 Dog 객체에서는 "멍멍", Cat 객체에서는 "야옹"으로 구현될 수 있다.

---

🔸 2. SOLID – 객체지향 설계를 위한 5가지 원칙
객체지향 프로그래밍을 실무에서 보다 효과적으로 활용하기 위한 설계 원칙. 코드의 유연성, 유지보수성, 확장성을 크게 향상시킨다.

🔹 SRP - Single Responsibility Principle (단일 책임 원칙)
-	정의: 하나의 클래스는 하나의 책임만 가져야 한다.
-	이유: 변경 사유가 하나만 있어야 코드의 변경이 예측 가능하고 유지보수가 쉬워진다.
-	예시: User 클래스를 사용자 정보 관리와 인증까지 담당하게 하지 말고, 인증은 AuthService와 같은 별도 클래스로 분리한다.

🔹 OCP - Open/Closed Principle (개방/폐쇄 원칙)
-	정의: 소프트웨어 요소는 확장에는 열려 있어야 하고, 변경에는 닫혀 있어야 한다.
-	이유: 기존 코드를 변경하지 않고도 새로운 기능을 추가할 수 있도록 한다.
-	예시: 전략 패턴을 통해 할인 정책을 확장하되, 기존 결제 로직은 건드리지 않는다.

🔹 LSP - Liskov Substitution Principle (리스코프 치환 원칙)
-	정의: 자식 클래스는 언제나 부모 클래스 타입으로 대체할 수 있어야 한다.
-	이유: 상속받은 클래스가 부모의 기능을 완전히 대체하지 못하면 오류 발생 가능성이 생긴다.
-	예시: Rectangle을 상속받은 Square가 setWidth와 setHeight를 독립적으로 처리하지 못한다면, LSP 위반이다.

🔹 ISP - Interface Segregation Principle (인터페이스 분리 원칙)
-	정의: 하나의 일반적인 인터페이스보다 여러 개의 구체적인 인터페이스를 사용하는 것이 낫다.
-	이유: 클라이언트가 사용하지 않는 인터페이스에 의존하지 않게 하려면 인터페이스를 분리해야 한다.
-	예시: Bird 인터페이스에 fly()와 swim()을 같이 넣는 대신, FlyingBird, SwimmingBird로 분리.


🔹 DIP - Dependency Inversion Principle (의존 역전 원칙)
-	정의: 고수준 모듈은 저수준 모듈에 의존해서는 안 된다. 둘 다 추상화에 의존해야 한다.
-	이유: 구현에 의존하지 않고 추상화에 의존하게 하면, 모듈 간 결합도를 낮출 수 있다.
-	예시: 특정 데이터베이스가 아닌, DatabaseInterface에 의존하게 한 후, 실제 구현체는 런타임에 주입한다.

---

💬 느낀 점 및 회고

-	단순히 "객체지향이 좋다"는 말로는 부족했다. 각 특성과 원칙이 실질적으로 어떤 코드 구조를 낳고, 왜 실무에서 중요하게 여겨지는지 구체적인 예시와 함께 이해할 수 있어 좋았다.
-	특히 SOLID 원칙은 처음엔 암기처럼 느껴졌지만, 실제 상황에 적용해보면 매우 실용적인 가이드라인이라는 걸 깨달았다.
-	앞으로는 기능 구현에 앞서 먼저 "이 클래스는 하나의 책임만 가지고 있는가?", "변경 없이 확장할 수 있는 구조인가?"를 생각하면서 설계하고 구현해야겠다고 느꼈다.
-	추상화와 다형성은 테스트 코드 작성 시에도 큰 장점이 되기 때문에, 앞으로 유닛 테스트와 함께 병행해 학습해야겠다.

---

📌 다음 학습 목표

-	GoF 디자인 패턴 중 OOP 4대 특성과 SOLID 원칙과 밀접한 패턴부터 정리해보기 (예: 전략 패턴, 데코레이터, 팩토리 등)
-	실전 코드에서 SOLID 원칙이 적용된 예제 프로젝트 분석
-	직접 간단한 애플리케이션에 OOP 원칙 적용해보기







---

## 🌱 Today I Learned

## 📅 Date
2025-07-23

## 🐍 Python
-	프로그래머스 PCCE 기출 샘플 문제 (Python)

---

## 🔍 주요 학습 내용

1.	조건문(if-elif-else)의 활용
-	다양한 분기 조건을 정확하게 작성하는 연습
-	if, elif, else의 순서를 바꾸었을 때 발생하는 오류 이해
-	중첩 조건문과 논리 연산자(and, or)를 이용한 복합 조건 처리

2.	반복문(for, while)의 유연한 사용
-	for 문을 활용한 리스트 순회 및 range 활용법
-	while 문을 사용한 조건 기반 반복 및 루프 종료 조건 설정
-	break, continue 키워드 활용 숙련도 상승

3.	문자열 및 리스트 조작
-	문자열 인덱싱과 슬라이싱을 통해 특정 문자 추출 및 변경
-	split(), join() 등 문자열 함수 활용
-	리스트의 .append(), .sort(), .remove() 등 메서드 숙지

4.	자료형 변환 및 기본 연산
-	int(), str(), list() 등 형변환 함수 적재적소에 사용
-	몫(//), 나머지(%), 거듭제곱(**) 등 연산자 사용 복습

5.	함수 사용 및 정의
-	내장 함수(len(), sum(), max(), min() 등) 활용
-	문제 내에서 반복되는 코드를 함수로 분리해 가독성 향상
-	매개변수 전달 방식과 return 값의 활용법 정리


6.	디버깅 능력 향상
-	오류 메시지를 읽고 디버깅하는 습관 강화
-	문제 조건을 다시 읽으며 테스트케이스 통과에 집중

---

## 💡 느낀 점

-	알고리즘 문제를 풀다 보니 기본 문법이 몸에 익어가는 느낌이다.
-	특히 조건문과 반복문에 익숙해지고 있으며, 구현 속도도 점점 빨라지고 있다.
-	처음에는 문제가 어렵게 느껴졌지만, 테스트케이스 기반으로 로직을 조금씩 수정하는 과정에서 성장하는 느낌을 받음.
-	디버깅 능력이 확실히 좋아졌고, 불필요한 print문 사용을 줄이며 효율적인 테스트를 하고자 노력했다.

---

## ✅ 내일 할 일

-	PCCE 유형 중 구현 문제와 시뮬레이션 유형 더 풀어보기
-	함수 구조화 연습 + edge case 대비하는 연습하기
-	시간복잡도 고려하며 코드를 개선하는 연습 시작하기







---

## 🌱 Today I Learned

## 📅 Date
2025-07-24

## 🐍 Python
Python 기반 Telegram 챗봇 만들기 기초 + FastAPI 연동

---

## 🔧 오늘 한 일
-	Telegram API를 활용해 챗봇을 만드는 기본 구조를 실습했다.
-	실제 응답(JSON)을 분석해 last_text, last_chat_id를 파싱하는 방식 이해.
-	특정 키워드(예: "로또", "안녕")에 따라 자동으로 답장을 보내는 로직을 구현.
-	FastAPI로 간단한 서버 (/hi) 열어보고 챗봇 서버 연동 기초도 준비했다.

---

## 🧠 학습 내용 요약

1. Telegram Bot 기본 구조
-	bot_token을 이용해 고유 URL 생성
→ https://api.telegram.org/bot<token>
-	주요 엔드포인트
-	/getMe: 봇 정보 확인
-	/getUpdates: 수신 메시지 확인
-	/sendMessage: 메시지 보내기

2. 사용자 메시지 응답 처리
-	data["result"][-1]["message"]["text"]: 가장 마지막 메시지 내용 추출
-	data["result"][-1]["message"]["from"]["id"]: 보낸 사람(chat_id) 추출
-	조건문을 활용해 자동 응답 구현
-	if '로또' in Input_msg:
-	    output_msg = str(random.sample(range(1, 46), 6))
-	elif Input_msg == '안녕':
-	    output_msg = 'ㅎㅇ'
-	else:
-	    output_msg = '기영이는 그런거 몰루 ><'
3. 메시지 발송 요청
-	requests.get()을 활용해 메시지 전송
-	requests.get(URL + '/sendMessage', params={
-	    'chat_id': sender_id,
-	    'text': output_msg,
-	})

4. FastAPI 연동 준비
-	FastAPI 설치 및 기본 구조 작성
-	pip install fastapi
-	pip install uvicorn[standard]
-	uvicorn main:app --reload
-	/hi 엔드포인트 테스트 완료 → 챗봇용 API 서버 기반 마련됨

---

## 🌐 HTTP 상태 코드 요약

범위	의미	설명
-   1xx	정보 (Informational)	요청을 받았고, 처리 중이라는 중간 응답
-   2xx	성공 (Success) ✅	요청이 성공적으로 완료됨 → 정상 응답
-   3xx	리다이렉션 (Redirection) ↪️	추가 작업 필요 (다른 URL로 이동 등)
-   4xx	클라이언트 오류 ❌	요청이 잘못됨 (사용자 측 문제)
-   5xx	서버 오류 🔥	서버 내부 문제 (응답 처리 실패)
		
---

## 🔍 자주 보는 상태 코드

-	200 OK: 요청 성공, 서버가 정상 응답함
-	201 Created: 요청 성공 + 리소스 생성됨 (ex. POST로 새 글 등록)
-	204 No Content: 요청 성공, 반환할 내용 없음
-	301 Moved Permanently: 영구 이동 (주소가 완전히 바뀜)
-	302 Found: 임시 이동

🧍‍♀️ 클라이언트 측 오류 (4xx)

-	400 Bad Request: 클라이언트가 잘못된 요청을 보냄 (형식 오류 등)
-	401 Unauthorized: 인증 필요 (로그인 필요)
-	403 Forbidden: 접근 금지 (권한 없음)
-	404 Not Found: 없는 페이지 요청 (잘못된 URL)
-	405 Method Not Allowed: 허용되지 않은 HTTP 메서드 (GET만 가능한데 POST 요청)
-	413 Payload Too Large: 전송 데이터가 너무 큼 (이미지나 파일이 용량 제한 초과)
-	429 Too Many Requests: 짧은 시간 내에 너무 많은 요청 보냄 (rate limit)

🖥️ 서버 측 오류 (5xx)

-   500 Internal Server Error: 서버 내부 에러 (코드 버그, 예외 처리 실패)
-	502 Bad Gateway: 게이트웨이 서버가 잘못된 응답 받음 (프록시 서버가 오류 응답 받음)
-	503 Service Unavailable: 서버 과부하 or 점검 중 (트래픽 폭주나 서버 유지보수)
-	504 Gateway Timeout: 응답 지연 (백엔드 서버가 시간 내에 응답 못함)
-	507 Insufficient Storage: 저장 공간 부족 (서버에 저장할 디스크 여유 없음)

---

## 💡 기억 팁
-	2xx → 👍 잘 처리됨!
-	4xx → ❗ 요청(클라이언트) 문제
-	5xx → 🚨 서버 쪽 문제

---

## 💡 느낀 점
-	API 구조와 JSON 응답을 직접 다뤄보면서 챗봇 동작 원리를 눈으로 확인하니 확실히 이해가 쉬웠다.
-	조건 분기문을 활용한 로직 처리 연습이 자연스럽게 이뤄졌다.
-	이후에는 webhook 방식으로 전환하거나, FastAPI 서버와 Telegram 봇을 연결해 실시간 반응하는 챗봇으로 확장해보고 싶다.
