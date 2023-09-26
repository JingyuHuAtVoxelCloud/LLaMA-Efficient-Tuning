# CUDA_VISIBLE_DEVICES=4 python ../src/web_demo.py \
#     --model_name_or_path ../models/Llama-2-7b-chat-hf \
#     --template llama2 \
    # --finetuning_type lora \
    # --checkpoint_dir ../outputs/Ihin/Ihin-sft-llama2/checkpoint-800


# CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7  torchrun --nproc_per_node 8 --master_port 7860 ../src/web_demo.py \
#     --model_name_or_path ../Llama-2-7b-chat-hf \
#     --template llama2 \
#     # --finetuning_type lora \
#     # --checkpoint_dir outputs/output-sft-llama2/checkpoint-24000

# CUDA_VISIBLE_DEVICES=5 python ../src/web_demo.py \
#     --model_name_or_path /mnt/eye_team/jyhu/LLM_assets/models/chatglm2-6b \
#     --template chatglm2 \
#     --finetuning_type lora \
#     --checkpoint_dir ../outputs/Ihin/Ihin_v1.2.1/sft-chatglm2/checkpoint-9800

CUDA_VISIBLE_DEVICES=5 python ../src/web_demo.py \
    --model_name_or_path /mnt/eye_team/jyhu/Ihin_assets/share/Ihin-v1-2 \
    --template chatglm2 \