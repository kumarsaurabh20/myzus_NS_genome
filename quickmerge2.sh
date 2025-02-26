#!/bin/bash -l
#SBATCH --partition=defq
#SBATCH --job-name=qm_f_w2                         # Job name
#SBATCH --mail-type=END,FAIL                            # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ks575@exeter.ac.uk                  # Where to send mail
#SBATCH --ntasks=1                                      # Run a single task
#SBATCH --cpus-per-task=10                              # Number of CPU cores per task
#SBATCH --mem=150gb                                       # Job memory request
#SBATCH --time=24:05:00                                 # Time limit hrs:min:sec
#SBATCH --output=qm_parallel_%j.log                        # Standard output and error log
#SBATCH --account=c.bass

pwd; hostname; date
export OMP_NUM_THREADS=10
pwd; hostname; date
echo "Running a program on $SLURM_JOB_NODELIST"

module load Workspace/v1 quickmerge/0.3
#/path/to/my/application
echo "Hello $USER, this is running on the $SLURM_CLUSTER_NAME cluster at `hostname` using PI account = $SLURM_JOB_ACCOUNT"
cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2
merge_wrapper.py -l 2420871 -ml 7000 $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run3/bartek.project2912.flye.pilon.iter3.fasta $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/run3/bartek.project2912.pilon.iter3.fasta
date
