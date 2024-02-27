# CUDA_VISIBLE_DEVICES=1 python ../src/web_demo.py \
#     --model_name_or_path ../Llama-2-7b-chat-hf \
#     --template llama2 \
#     --finetuning_type lora \
#     --checkpoint_dir ../outputs/output-pt-llama2/checkpoint-12600

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python ../src/web_demo.py \
    --model_name_or_path ../models/Llama-2-70b-chat-hf \
    --template llama2 \
    # --finetuning_type lora \
    # --checkpoint_dir ../outputs/output-pt-llama2/checkpoint-100