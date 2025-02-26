#!/bin/bash -l
#SBATCH --partition=hmq
#SBATCH --job-name=parallel_job                         # Job name
#SBATCH --mail-type=ALL                            # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ks575@exeter.ac.uk                  # Where to send mail
#SBATCH --ntasks=1                                      # Run a single task
#SBATCH --cpus-per-task=64                         # Number of CPU cores per task
#SBATCH --mem=10gb                                       # Job memory request
#SBATCH --time=240:05:00                                 # Time limit hrs:min:sec
#SBATCH --output=flye_parallel_%j.log                        # Standard output and error log
#SBATCH --account=c.bass

pwd; hostname; date
export OMP_NUM_THREADS=64
pwd; hostname; date
echo "Running a program on $SLURM_JOB_NODELIST"
#
#/path/to/my/application
echo "Hello $USER, this is running on the $SLURM_CLUSTER_NAME cluster at `hostname` using PI account = $SLURM_JOB_ACCOUNT"
cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/racon/run1
module load shared sge Conda/Python2/2.7.15 ks575/minimap2/v2.17 samtools/1.9 ks575/Flye/v2.5
flye --pacbio-raw /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/Project_2912_subreads.copy.fasta.gz --out-dir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/bartek_proj_2912 --genome-size 400m --threads 64
