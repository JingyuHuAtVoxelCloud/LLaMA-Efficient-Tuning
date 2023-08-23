MASTER_PORT=$(shuf -n 1 -i 10000-65535)

CUDA_VISIBLE_DEVICES=4 deepspeed --num_gpus=1 --master_port $MASTER_PORT ../src/train_bash.py \
    --deepspeed deepspeed_zero3.json \
    --stage sft \
    --model_name_or_path ../models/Llama-2-70b-chat-hf\
    --do_predict \
    --dataset Ihin_test \
    --dataset_dir ../data/medicalgpt \
    --template llama2 \
    --output_dir ../outputs/output-llama2  \
    --per_device_eval_batch_size 1 \
    --predict_with_generate \
    --fp16

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