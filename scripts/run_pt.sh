# Description: Script to run the training of the model

# run pretraining for Ihin
# accelerate launch \
#     --config_file ../configs/accelerate_default_config.yaml \
#     --num_processes 2 \
#     ../src/train_bash.py \
#     ../configs/exp_configs/Ihin_AW/pt.yaml

accelerate launch \
    --config_file ../configs/accelerate_default_config.yaml \
    --num_processes 2 \
    ../src/train_bash.py \
    ../configs/exp_configs/retina_gpt/chatglm3/pt.yaml