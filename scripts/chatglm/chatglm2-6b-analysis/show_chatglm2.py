import torch 
from transformers import AutoTokenizer, AutoModel


model_path = '/mnt/eye_team/jyhu/LLaMA-Efficient-Tuning/models/chatglm2-6b'

tokenizer = AutoTokenizer.from_pretrained(model_path, trust_remote_code=True)
model = AutoModel.from_pretrained(model_path, trust_remote_code=True).half().cuda()
model.eval()
dummy_input = torch.tensor([[7, 6, 0, 0, 1], [1, 2, 3, 0, 0], [0, 0, 0, 4, 5]]).cuda()
outputs = model(dummy_input)
print(outputs.logits.shape)
print(outputs.loss)


# response, history = model.chat(tokenizer, "你好", history=[])
# print(response)
# response, history = model.chat(tokenizer, "晚上睡不着应该怎么办", history=history)
# print(response)

