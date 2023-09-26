# coding=utf-8
# Requests to Ihin chatbot.
# Usage: python request_api.py

import requests


def chat_with_glm(prompt):
    """
    param prompt: str
    """
    url = "http://192.168.100.13:8000/v1/chat/completions"

    headers = {
        "accept": "application/json",
        "Content-Type": "application/json"
    }
    data = {
        "model": "string",
        "messages": [
            {
                "role": "user",
                "content": prompt
            }
        ],
        "temperature": 0,
        "top_p": 0,
        "n": 1,
        "max_tokens": 0,
        "stream": False
    }

    response = requests.post(url, json=data, headers=headers)
    if response.status_code == 200:
        response = response.json()
        resp = response['choices'][0]['message']['content']
        return resp
    else:
        return "请求失败,请稍后重试。"

if __name__ == "__main__":
    pre_message = '你好'
    print(chat_with_glm(pre_message))
