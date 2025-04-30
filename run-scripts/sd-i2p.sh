#!/bin/bash -l

#$ -N i2p_generate           # Give job a name
#$ -j y               # Merge the error and output streams into a single file
#$ -t 4702              # Numbers here indicate which prompts from i2p it generates images for
#$ -l gpus=1
#$ -l gpu_c=8.0
#$ -o logs/output/
#$ -e logs/error/

echo "SGE_TASK_ID is $SGE_TASK_ID"

conda activate ldms #activate your conda 

python eval-scripts/generate-images-jobs.py \
--prompts_path prompts/unsafe-prompts.csv \
--save_path results/i2p/ \
--model_name sd-v1-4 \ #put model in models/{modelname}/{modelname.pt}
--id $SGE_TASK_ID \
--device cuda:0 \
--num_samples 1 

echo "Done" 