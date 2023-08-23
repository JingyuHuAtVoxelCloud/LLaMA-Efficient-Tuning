CUDA_VISIBLE_DEVICES=4,5,6,7 accelerate launch --config_file accelerate_config.yaml src/train_bash.py \
    --stage ppo \
    --model_name_or_path Llama-2-7b-chat-hf \
    --do_train \
    --dataset ft_train \
    --dataset_dir data/medicalgpt \
    --template llama2 \
    --finetuning_type lora \
    --resume_lora_training False \
    --checkpoint_dir outputs/output-sft-llama2/checkpoint-24000 \
    --reward_model outputs/output-rm-llama2/checkpoint-800 \
    --output_dir outputs/output-rl-llama2 \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 1 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 1000 \
    --learning_rate 1e-5 \
    --num_train_epochs 1.0 \
    --fp16 \
    --plot_loss \
    --evaluation_strategy steps \
    --load_best_model_at_end \
    --dev_ratio 0.01 \
    --preprocessing_num_workers 32 \
    --max_samples 2000 \