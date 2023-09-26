python ../src/export_model.py \
    --model_name_or_path /mnt/eye_team/jyhu/LLM_assets/models/chatglm2-6b \
    --template chatglm2 \
    --finetuning_type lora \
    --dataset_dir /mnt/eye_team/jyhu/LLaMA-Efficient-Tuning/data \
    --checkpoint_dir  ../outputs/retina_gpt/sft-chatglm2_230919/checkpoint-400\
    --output_dir ../outputs/retina_gpt/sft-chatglm2_230919/merged_checkpoint-400