MASTER_PORT=$(shuf -n 1 -i 10000-65535)

CUDA_VISIBLE_DEVICES=0,1,2,3 deepspeed --num_gpus=4 --master_port $MASTER_PORT ../src/train_bash.py \
    --deepspeed deepspeed.json \
    --stage sft \
    --model_name_or_path ../models/Llama-2-7b-chat-hf \
    --template llama2 \
    --do_train \
    --dataset self_cognition,Ihin_sft \
    --dataset_dir ../data/medicalgpt \
    --finetuning_type lora \
    --output_dir ../outputs/Ihin/Ihin-sft-llama2  \
    --overwrite_cache \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 800 \
    --learning_rate 5e-5 \
    --num_train_epochs 200.0 \
    --plot_loss \
    --fp16 \
    --evaluation_strategy steps \
    --load_best_model_at_end \
    --val_size 0.001 \
    --preprocessing_num_workers 32 \
    # --max_samples 200000 \