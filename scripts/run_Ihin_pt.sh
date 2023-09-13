MASTER_PORT=$(shuf -n 1 -i 10000-65535)

CUDA_VISIBLE_DEVICES=0,1,2,3 deepspeed --num_gpus=4 --master_port $MASTER_PORT ../src/train_bash.py \
    --deepspeed deepspeed.json \
    --stage pt \
    --model_name_or_path /mnt/eye_team/jyhu/LLaMA-Efficient-Tuning/Llama-2-7b-chat-hf \
    --do_train \
    --dataset Ihin_pretrain \
    --dataset_dir ../data/medicalgpt \
    --template llama2 \
    --finetuning_type lora \
    --output_dir ../outputs/output-pt-llama2-Ihin \
    --overwrite_cache \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 100 \
    --learning_rate 5e-5 \
    --num_train_epochs 2.0 \
    --plot_loss \
    --fp16 \
    --evaluation_strategy steps \
    --load_best_model_at_end \
    --preprocessing_num_workers 32 \
    --dev_ratio 0.001 \
    --max_samples 20000 \
