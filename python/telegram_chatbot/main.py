# main.py
'''
pip install fastapi
pip install uvicorn[standard]
터미널에서 위 두 줄 실행 후 설치해야함
이후 아래 명령어로 서버 켬
uvicorn main:app --reload
서버 끄는 법: Ctrl+C
'''

from fastapi import FastAPI, Request
import random
import requests
from dotenv import load_dotenv
import os
from openai import OpenAI

# .env 파일을 불러옴
load_dotenv()
app = FastAPI()


def send_message(chat_id, message):
    # .env에서 'TELEGRAM_BOT_TOKEN'에 해당하는 값을 불러옴
    bot_token = os.getenv('TELEGRAM_BOT_TOKEN')

    URL = f'https://api.telegram.org/bot{bot_token}'
    body = {
        # 사용자 chat_id 는 어디서 가져옴..?
        'chat_id': chat_id, 
        'text': message
    }
    requests.get(URL + '/sendMessage', body)


# python에서는 module = file 임

# 텔레그램 서버측에서 짜둔 코드

# 니가 getme, sendMessage를 써야만 서버 돌거야 ~ 라는뜻

# @app.get('/getMe')
# def hi():
#     return {'status': 'ok'}

# @app.get('/sendMessage')
# def hi():
#     return {'status': 'ok'}

# /docs -> 라우팅 목록 페이지로 이동 가능

# http:// localhost:8000/
# http://127.0.0.1:8000 위와 아래는 같음


@app.get('/')
def home():
    return {'home': 'sweet home'}


# /telegram 라우팅으로 텔레그램 서버가 Bot에 업데이트가 있을 경우, 우리에게 알려줌
@app.post('/telegram')
async def telegram(request: Request):
    print('텔레그램에서 요청이 들어왔다!!!')

    data = await request.json()
    print(data)
    sender_id = data['message']['chat']['id']
    input_msg = data['message']['text']
    # bot에게 답장을 하자!
    client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))
    res = client.responses.create(
        model='gpt-4.1-mini',
        input=input_msg
    )
    send_message(sender_id, res.output_text)
    
    return {'status': '바나나🍌'}


# 로또번호
@app.get('/lotto')
def lotto():
    return {
        '이번쥬 로또번호눈~~><?': random.sample(range(1, 46), 6)
    }

