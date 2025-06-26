# 🌱 Today I Learned

## 📅 Date
2025-06-26

Subject: Excel Basic Day 1

## 📘 What I Learned

✅ 함수 및 기능

•	SUM: 범위의 합
•	AVERAGE: 평균값
•	MEDIAN: 중간값
•	COUNTIF: 조건에 맞는 개수
•	SUMIF: 조건에 맞는 합
•	COUNTUNIQUE: 중복 제외한 개수
•	AVERAGEIF: 조건에 맞는 평균
•	ARRAYFORMULA: 배열 단위 계산
•	MAX / MIN: 최대값 / 최소값
•	MAXIF: 조건에 맞는 최대값
•	INDEX: 특정 위치 값 반환
•	MATCH: 값의 위치 반환
•	TYPE: 데이터 유형 반환 (숫자, 텍스트 등)
•	VALUE: 텍스트를 숫자로 변환

🔍 실무 활용 예시

•	카테고리 분석: 조건부 함수들로 세부 분석
•	데이터 정제: 이상한 전화번호/주소를 함수 + LLM(ChatGPT, Gemini 등)로 자동 정리
•	이상값 탐지: 평균, 표준편차, 신뢰구간(Z-score) 활용
•	이상값 처리: 이상값 → 중간값으로 대체
•	윈저화 처리: 상·하위 5% → 경계값으로 대체 후 평균 구하기
•	구글 스프레드시트 전용: GOOGLEFINANCE 함수로 주식 등 외부 데이터 불러오기

⚠️ 오류 메시지 해석 & 해결
•	#DIV/0!: 0으로 나눔 → IF문으로 방지
•	#NAME?: 함수명/셀 참조 오타 → 수정
•	#REF!: 셀 참조 오류 → 참조 위치 확인
