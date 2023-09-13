python ../src/export_model.py \
    --model_name_or_path /mnt/eye_team/jyhu/LLM_assets/models/chatglm2-6b \
    --template chatglm2 \
    --finetuning_type lora \
    --dataset_dir /mnt/eye_team/jyhu/LLaMA-Efficient-Tuning/data \
    --checkpoint_dir ../outputs/Ihin/Ihin_v1.1/sft-chatglm2/checkpoint-20000 \
    --output_dir ../outputs/Ihin/Ihin_v1.1/sft-chatglm2/merged_checkpoint-20000