# Ihin_AW
# CUDA_VISIBLE_DEVICES=0,1 accelerate launch  \
#     --config_file ../configs/accelerate_default_config.yaml \
#     --num_processes 2 \
#     ../src/train_bash.py \
#     ../configs/exp_configs/Ihin_AW/sft_test_gpu.yaml


CUDA_VISIBLE_DEVICES=0,1 accelerate launch  \
    --config_file ../configs/accelerate_default_config.yaml \
    --num_processes 2 \
    ../src/train_bash.py \
    ../configs/exp_configs/agent/sft.yaml