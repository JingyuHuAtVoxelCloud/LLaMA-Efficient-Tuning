# CUDA_VISIBLE_DEVICES=0 python ../src/train_bash.py \
#     ../configs/exp_configs/chatglm3/pred.yaml

CUDA_VISIBLE_DEVICES=0,1 accelerate launch  \
    --config_file ../configs/accelerate_default_config.yaml \
    --num_processes 2 \
    ../src/train_bash.py \
    ../configs/exp_configs/openmodel/chatglm2_6b_pred.yaml