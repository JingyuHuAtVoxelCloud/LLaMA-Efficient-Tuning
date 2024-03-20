CUDA_VISIBLE_DEVICES=0 python ../src/export_model.py \
    --model_name_or_path /mnt/local/jyhu/llm_assets/models/Yi-34B-Chat  \
    --adapter_name_or_path /mnt/local/jyhu/LLaMA-Efficient-Tuning/outputs/retina_gpt/pt-yi-34b-chat/checkpoint-1500 \
    --template yi \
    --finetuning_type lora \
    --export_dir /mnt/local/jyhu/LLaMA-Efficient-Tuning/outputs/retina_gpt/export_model \
    --export_size 2 \
    --export_legacy_format False