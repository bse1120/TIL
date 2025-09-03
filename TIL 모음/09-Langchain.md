---

## 🌱 Today I Learned

## 📅 Date
2025-09-02

---

## 🧠 LangChain - Memory (대화 내용 기억)

## ✅ 학습 내용

1. LLM의 기본 특성
-	LLM은 stateless → 이전 대화 내용을 기억하지 않음
-	따라서 메모리 기능을 구현하려면 프롬프트에 과거 대화 내역을 계속 주입해야 함

2. Memory의 종류
-	Short-Term Memory (단기기억): 한 세션 내에서만 대화 맥락 유지
-	Long-Term Memory (장기기억): 세션 전체에서 중요한 정보를 추출해 저장

3. Memory 구동 방식
1.	모든 대화 내역을 LLM 입력으로 전달
2.	대화가 길어질 경우 → 토큰 수 증가, 성능 저하 발생
3.	개선 방법
o	요약 (Summary)
o	일정 길이 이상은 앞부분 삭제
o	특정 개념 단위로 정리 (명사 추출, Node-Edge 그래프 등)

---

## 🛠️ 실습 코드

(1) 기본 구조 - ConversationBufferMemory
from langchain.memory import ConversationBufferMemory
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain_core.runnables import RunnableLambda, RunnablePassthrough
from langchain_openai import ChatOpenAI
from operator import itemgetter

---

# LLM 초기화
llm = ChatOpenAI(model="gpt-4.1-nano", temperature=0)

---

# Prompt 정의 (메모리 변수 포함)
prompt = ChatPromptTemplate([
    ("system", "넌 유용한 챗봇이야."),
    MessagesPlaceholder(variable_name="chat_history"),
    ("human", "{input}"),
])

---

# Memory 정의
memory = ConversationBufferMemory(return_messages=True, memory_key="chat_history")

---

# Runnable 구성
runnable = RunnablePassthrough.assign(
    chat_history=RunnableLambda(memory.load_memory_variables) | itemgetter("chat_history")
)

---

# 체인 구성
chain = runnable | prompt | llm

---

# 대화 저장 & 실행
res = chain.invoke({"input": "만나서 반가워"})
memory.save_context({"human": "만나서 반가워"}, {"ai": res.content})

res = chain.invoke({"input": "내 이름 뭐라고?"})
memory.save_context({"human": "내 이름 뭐라고?"}, {"ai": res.content})

---

(2) 스트리밍 챗봇 만들기
import time

def stream_msg(chain, msg):
    """메세지를 스트리밍 형태로 출력하는 함수"""
    full_msg = ""
    print("AI: ", end="")
    for token in chain.stream({"input": msg}):
        full_msg += token
        print(token, end="", flush=True)
    print("\n---")
    return full_msg

input_msg = ""

---

# 종료 명령어 입력 시 대화 종료
while input_msg not in ("quit", "정지", "그만"):
    input_msg = input("인간: ")
    output_msg = stream_msg(chain, input_msg)
    memory.save_context({"human": input_msg}, {"ai": output_msg})
    time.sleep(0.5)

---

(3) 레포트 작성 챗봇
from pprint import pprint
from pydantic import BaseModel, Field
from langchain_core.output_parsers import PydanticOutputParser

---

# LLM 초기화
llm = ChatOpenAI(model="gpt-4.1-nano", temperature=0)

---

# 출력 형식 정의
class Report(BaseModel):
    title: str = Field(..., description="보고서 제목")
    summary: str = Field(..., description="보고서 요약본")
    content_kr: str = Field(..., description="한국어 보고서 (1000자 이내)")
    content_jp: str = Field(..., description="일본어 보고서 (1000자 이내)")

parser = PydanticOutputParser(pydantic_object=Report)

---

# Prompt 구성
prompt = ChatPromptTemplate([
    ("system", "넌 보고서 작성 전문 챗봇이야. 반드시 JSON 형식으로 답변해.\n\nFORMAT INSTRUCTION: {format_instructions}"),
    MessagesPlaceholder(variable_name="chat_history"),
    ("human", "{input}"),
]).partial(format_instructions=parser.get_format_instructions())

---

# Memory
memory = ConversationBufferMemory(return_messages=True, memory_key="chat_history")

---

# 체인
runnable = RunnablePassthrough.assign(
    chat_history=RunnableLambda(memory.load_memory_variables) | itemgetter("chat_history")
)
chain = runnable | prompt | llm | parser

---

# 실행 루프
while True:
    input_msg = input("인간: ")
    if input_msg in ("quit", "정지", "그만", ""):
        break
    output_msg = chain.invoke({"input": input_msg})
    pprint(output_msg.model_dump())
    memory.save_context({"human": input_msg}, {"ai": output_msg.model_dump_json()})

---

## 💡 오늘의 인사이트
-	LangChain의 Memory는 단순히 대화 맥락을 유지하는 것이 아니라, 데이터 구조화 + 활용까지 확장 가능
-	ConversationBufferMemory는 가장 기본적인 방식이지만, 장기 대화에서는 토큰 절약 기법이 필수
-	메모리를 이용한 챗봇 설계 시, 단순 대화형 → 스트리밍 챗봇 → 구조화된 레포트 생성형으로 확장할 수 있음

---







---

## 🌱 Today I Learned

## 📅 Date
2025-09-03

---

## 🧠 LangChain - Memory (대화 내용 기억)

✅ 학습 내용
1.	LLM의 기본 특성
o	LLM은 stateless → 이전 대화를 기억하지 않음
o	Memory 기능을 통해 대화 맥락 유지 가능
2.	Memory의 종류
o	Short-Term Memory: 한 세션 안에서만 맥락 저장
o	Long-Term Memory: 여러 세션에 걸쳐 중요한 정보 추출 및 저장
3.	Memory 구동 방식
o	모든 대화 내역을 LLM 입력에 전달 → 토큰 증가 & 성능 저하
o	해결책:
-	요약 (SummaryMemory)
-	윈도우 방식 (ConversationBufferWindowMemory)
-	개념 단위 저장 (VectorStoreMemory, Knowledge Graph)4

---

## 🛠️ 코드 요약
(1) 기본 메모리 사용 예시
from langchain.memory import ConversationBufferMemory
from langchain_openai import ChatOpenAI

llm = ChatOpenAI(model="gpt-4.1-nano", temperature=0)
memory = ConversationBufferMemory(return_messages=True)

---

# 대화 저장
memory.save_context({"human": "안녕"}, {"ai": "반가워"})
print(memory.load_memory_variables({}))
(2) 요약 기반 메모리
from langchain.memory import ConversationSummaryMemory

summary_memory = ConversationSummaryMemory(llm=llm)
(3) 윈도우 기반 메모리 (최근 N개만 유지)
from langchain.memory import ConversationBufferWindowMemory

window_memory = ConversationBufferWindowMemory(k=3)  # 최근 3개 대화만 유지

---

## 💡 오늘의 인사이트
-	LangChain Memory는 대화 맥락 유지 → 토큰 절약 → 데이터 구조화까지 활용 가능
-	단순 ConversationBufferMemory에서 시작해,
SummaryMemory·WindowMemory·VectorStoreMemory로 확장하면 장기/대규모 대화도 처리 가능
-	메모리 전략 선택은 “대화 길이, 비용, 정확성” 사이의 트레이드오프

