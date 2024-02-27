#!/bin/bash

cd /mnt/local/jyhu/LLM-Train

CUDA_VISIBLE_DEVICES=0,1 python src/evaluate_5_choices.py \
    --model_name_or_path /mnt/local/jyhu/llm_assets/models/chatglm3-6b \
    --template chatglm3 \
    --task CMB_eye \
    --split test \
    --lang zh \
    --n_shot 0 \
    --batch_size 4 \