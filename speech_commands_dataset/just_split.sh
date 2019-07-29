#!/bin/bash
set -eux

work_dir=${1:-$(pwd)/google_speech_commands}
mkdir -p ${work_dir}

data_dir=/home/yli2000/dataset/google_speech_commands

# split data
output_dir=${work_dir}/splitted_data
python3 google_speech_commmands_dataset_to_our_format_with_split.py \
    --input_dir `realpath ${data_dir}` \
    --train_list_fullpath train.txt \
    --valid_list_fullpath valid.txt \
    --test_list_fullpath test.txt \
    --wanted_words yes,no,up,down,left,right,on,off,stop,go \
    --output_dir `realpath ${output_dir}`
echo "Dataset is prepared at ${output_dir}"
