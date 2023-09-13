MASTER_PORT=$(shuf -n 1 -i 10000-65535)

CUDA_VISIBLE_DEVICES=4,5,6,7 deepspeed --num_gpus=4 --master_port $MASTER_PORT ../src/train_bash.py \
    --deepspeed ../scripts/deepspeed_zero2.json \
    --stage pt \
    --model_name_or_path /mnt/eye_team/jyhu/LLM_assets/models/chatglm2-6b \
    --do_train \
    --dataset retina_pretrain \
    --dataset_dir /mnt/eye_team/jyhu/retina_gpt_assets/preprocessed \
    --template chatglm2 \
    --finetuning_type lora \
    --lora_target query_key_value \
    --output_dir ../outputs/retina_gpt/pt-chatglm2 \
    --overwrite_cache \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 1 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 100 \
    --learning_rate 5e-5 \
    --num_train_epochs 20 \
    --plot_loss \
    --fp16 \
    --evaluation_strategy steps \
    --load_best_model_at_end \
    --preprocessing_num_workers 32 \
    --val_size 0.001 \
    # --max_samples 2000 \

