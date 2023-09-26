CUDA_VISIBLE_DEVICES=3 python ../src/api_demo.py \
    --model_name_or_path /mnt/eye_team/jyhu/LLM_assets/models/chatglm2-6b \
    --template chatglm2 \
    --finetuning_type lora \
    --checkpoint_dir ../outputs/Ihin/Ihin_v1.1/sft-chatglm2/checkpoint-20000