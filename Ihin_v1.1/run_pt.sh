CUDA_VISIBLE_DEVICES=0,1,2,3 accelerate launch \
    --config_file accelerate_default_config.yaml \
    ../src/train_bash.py \
    --stage pt \
    --model_name_or_path /mnt/eye_team/jyhu/LLM_assets/models/chatglm2-6b \
    --do_train \
    --dataset Ihin_pretrain \
    --dataset_dir /mnt/eye_team/jyhu/Ihin_assets/Ihin_dataset_v1.1 \
    --template chatglm2 \
    --finetuning_type lora \
    --lora_target query_key_value \
    --output_dir ../outputs/Ihin/Ihin_v1.1/pt-chatglm2 \
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
    # --max_samples 200000 \