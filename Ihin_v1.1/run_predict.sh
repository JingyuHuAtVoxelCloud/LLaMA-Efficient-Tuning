MASTER_PORT=$(shuf -n 1 -i 10000-65535)

CUDA_VISIBLE_DEVICES=0,1,2,3,4 accelerate launch \
    --main_process_port $MASTER_PORT \
    --config_file accelerate_default_config.yaml \
    ../src/train_bash.py \
    --stage sft \
    --model_name_or_path /mnt/eye_team/jyhu/LLM_assets/models/chatglm2-6b \
    --checkpoint_dir ../outputs/Ihin/Ihin_v1.1/sft-chatglm2/checkpoint-20000 \
    --do_predict \
    --dataset Ihin_test \
    --dataset_dir /mnt/eye_team/jyhu/Ihin_assets/Ihin_dataset_v1.1 \
    --template chatglm2 \
    --output_dir ../outputs/Ihin/Ihin_v1.1/sft-chatglm2  \
    --per_device_eval_batch_size 1 \
    --predict_with_generate

## sft
# CUDA_VISIBLE_DEVICES=0 python src/train_bash.py \
#     --stage sft \
#     --model_name_or_path Llama-2-7b-chat-hf \
#     --do_predict \
#     --dataset ft_test \
#     --dataset_dir data/medicalgpt \
#     --template llama2 \
#     --finetuning_type lora \
#     --checkpoint_dir outputs/output-sft-llama2/checkpoint-24000 \
#     --output_dir outputs/output-sft-llama2  \
#     --per_device_eval_batch_size 8 \
#     --predict_with_generate