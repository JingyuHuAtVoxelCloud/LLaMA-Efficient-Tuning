MASTER_PORT=$(shuf -n 1 -i 10000-65535)

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 accelerate launch  \
    --main_process_port $MASTER_PORT \
    --config_file accelerate_default_config.yaml \
    ../src/train_bash.py \
    --stage sft \
    --model_name_or_path /mnt/eye_team/jyhu/LLM_assets/models/chatglm2-6b \
    --checkpoint_dir ../outputs/Ihin/Ihin_v1.1/pt-chatglm2/checkpoint-7900 \
    --template chatglm2 \
    --do_train \
    --dataset self_cognition,Ihin_sft_v1.1,Ihin_sft_v1.2 \
    --dataset_dir /mnt/eye_team/jyhu/Ihin_assets/Ihin_dataset_v1.2 \
    --finetuning_type lora \
    --lora_target all \
    --output_dir ../outputs/Ihin/Ihin_v1.2.2/sft-chatglm2  \
    --overwrite_cache \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 1 \
    --lr_scheduler_type cosine \
    --logging_steps 200 \
    --save_steps 200 \
    --learning_rate 5e-5 \
    --num_train_epochs 20.0 \
    --plot_loss \
    --fp16 \
    --evaluation_strategy steps \
    --load_best_model_at_end \
    --val_size 0.001 \
    --preprocessing_num_workers 32 \
    # --max_samples 200000 \