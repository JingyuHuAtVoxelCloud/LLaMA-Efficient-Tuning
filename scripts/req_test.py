"""
pip install openai
"""

import json
import os
import openai
import re
import requests
import time

import yaml
try:
    from yaml import CLoader as Loader, CDumper as Dumper, CSafeLoader as SafeLoader
except ImportError:
    from yaml import Loader, Dumper, SafeLoader

from abc import ABCMeta, abstractmethod
from collections import OrderedDict
from typing import Iterable


# import tiktoken
# # ENCODER = tiktoken.get_encoding("gpt2")
# cl100k_base = tiktoken.get_encoding("cl100k_base") 
# ENCODER = tiktoken.Encoding( 
#     name="gpt-35-turbo",  
#     pat_str=cl100k_base._pat_str, 
#     mergeable_ranks=cl100k_base._mergeable_ranks, 
#     special_tokens={ 
#         **cl100k_base._special_tokens, 
#         "<|im_start|>": 100264, 
#         "<|im_end|>": 100265
#     } 
# )

# openai.verify_ssl_certs = False

   

class AbstractDialogue(metaclass=ABCMeta):
    """
    """
    def __init__(self):
        pass

    @abstractmethod
    def send(self, prompt: str, history: Iterable[str]=[], sid: str=None) -> str:
        raise NotImplementedError


class AzureChatGPTAPIDialogue(AbstractDialogue):
    """
    MAX_TOKEN_LENGTH  # max ~8000 for gpt-3.5
    system_prompt    # user defined system prompt
    
    config arguments for openai.ChatCompletion.create  
    See https://platform.openai.com/docs/api-reference/chat-completions/create

        engine="gpt-35-turbo",   # "gpt-4-8k" for gpt-4 but slower and more expensive than gpt-3.5
        temperature
        top_p
        frequency_penalty
        presence_penalty
    """
    MAX_TOKEN_LENGTH = 8000

    def __init__(self):
        self.context = {
            "api_base": "http://192.168.10.144:8880",
            "api_key": "voxelcloud",
            "api_type": "azure",
            "api_version": "2023-05-15"
        }
    
    def send(self, prompt, history=[], sid=None):

        # logger.debug(self.session_context)

        # 限制字数  ? 并把回复中的ChatGPT，OpenAI等内容替换为‘Doctor Jiao’！
        system_prompt = "你是个专业的问答助手。"
        messages=[{"role": "system", "content": system_prompt}]

        for i in range(0, len(history), 2):
            messages.append({"role": "user", "content": history[i]})
            messages.append({"role": "assistant", "content": history[i+1]})

        messages.append({"role": "user", "content": prompt})
        print(messages)

        prev_text = ""
        try:
            # start = time.time()
            response = openai.ChatCompletion.create(
                engine="gpt-35-turbo",
                messages=messages,
                api_key=self.context["api_key"],
                api_base=self.context["api_base"],
                api_type=self.context["api_type"],
                api_version=self.context["api_version"],
                temperature=0.7,
                max_tokens=self.MAX_TOKEN_LENGTH,  # ! max 200 defined here
                # max_tokens=self.get_max_tokens(history),
                top_p=1.0,
                frequency_penalty=0.0,
                presence_penalty=0.6,
            )
            prev_text = response["choices"][0]["message"]["content"]
            # print("OpenAIAPIDialogue %s sec" % (time.time()-start))
        except openai.error.RateLimitError as e:
            """
            openai.error.RateLimitError: Rate limit reached for default-gpt-3.5-turbo in organization org-loPXX2amEGHVAy9HTWaWOwtD on requests per min. 
            Limit: 20.000000 / min. Current: 30.000000 / min. Contact support@openai.com if you continue to have issues. 
            Please add a payment method to your account to increase your rate limit. Visit https://platform.openai.com/account/billing to add a payment method.
            """
            
            print("failed context %s" %  str(e))
            raise e
        except openai.error.APIError as e:
            print("failed context %s" %  str(e))
            raise e
        except Exception as e:
            print("failed context %s" %  str(e))
            raise e

        return prev_text


class DialogueSelector(object):
    @staticmethod
    def get_new_instance(mode=0):
        dialogue_classes = [AzureChatGPTAPIDialogue]
        return dialogue_classes[mode]()


# dialogue = DialogueSelector.get_new_instance(mode=0)


if __name__ == "__main__":
    start = time.time()
    context = AzureChatGPTAPIDialogue()
    history = []

    # history.extend(["Open AI的发布前审查是什么？", "我的发布前审查是指其在公开发布之前对其技术和语言进行的审查。该审查实施的目的是确保我公开的内容符合其道德和伦理标准，并尽可能避免语言中的偏见和歧视。"])
    message = "发烧了怎么办，吃什么药？"
    # message = "可以补充一下吗"
    resp = context.send(prompt=message, history=history)
    print(resp)
    # history.append(message)
    # history.append(resp)

    # # time.sleep(3)
    # message = "如何使用python库tiktoken将字符串截断出指定的token长度"
    # resp = context.send(prompt=message, history=history)
    # print(resp)
    # history.append(message)
    # history.append(resp)

    # # time.sleep(3)
    # message = "我刚刚问了什么？"
    # resp = context.send(prompt=message, history=history)
    # print(resp)
    # history.append(message)
    # history.append(resp)

    # # time.sleep(3)
    # message = "能再详细说说吗？"
    # resp = context.send(prompt=message, history=history)
    # print(resp)
    # history.append(message)
    # history.append(resp)

    stop = time.time()
    print("time takes %s sec\n" % (stop - start))