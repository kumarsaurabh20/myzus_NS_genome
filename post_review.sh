#!/bin/bash -l
#SBATCH --partition=hmq
#SBATCH --job-name=9B_3Ddna                         # Job name
#SBATCH --mail-type=FAIL                            # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ks575@exeter.ac.uk                  # Where to send mail
#SBATCH --ntasks=1                                      # Run a single task
#SBATCH --cpus-per-task=24                         # Number of CPU cores per task
#SBATCH --mem=10gb                                       # Job memory request
#SBATCH --time=240:05:00                                 # Time limit hrs:min:sec
#SBATCH --output=3D-DNA_926B_parallel_%j.log                        # Standard output and error log
#SBATCH --account=c.bass

pwd; hostname; date
export OMP_NUM_THREADS=24
pwd; hostname; date
echo "Running a program on $SLURM_JOB_NODELIST"
#
#/path/to/my/application
echo "Hello $USER, this is running on the $SLURM_CLUSTER_NAME cluster at `hostname` using PI account = $SLURM_JOB_ACCOUNT"
module purge
module load shared slurm/18.08.4 samtools/1.9 Oracle_Java/8u192 ks575/BedTools/v2.9.1 ks575/BioAWK/v1.0.0 Workspace/v1 bwa/0.7.17 ks575/GNUtls/v3.6.5 Conda/Python2/2.7.15
module load ks575/GCC/v6.1.0 cuda92/toolkit/9.2.88
module load ks575/lastz/v1.0.4 ks575/3D-DNA/180419 ks575/GNU_parallel/v20191122
cd $WORKSPACE/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/test/NS2/post_review/
work_dir=$WORKSPACE/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/test/myjuicerdir
export PATH=$PATH:$WORKSPACE/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/test/myjuicerdir/scripts/common:$WORKSPACE/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/test/juicer/misc
##$work_dir/scripts/juicer.sh -z $work_dir/references/draft.fa -y $work_dir/restriction_sites/draft_DpnII.txt -D $work_dir -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/draft/chrom.sizes
TMPDIR=$WORKSPACE/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/test/926B/post_review/tmp
TMP=$TMPDIR
TEMP=$TMPDIR
export TMPDIR TMP TEMP
#run-asm-pipeline.sh --editor-repeat-coverage 6 $work_dir/references/draft.fa $WORKSPACE/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/test/926B/aligned/merged_nodups.txt
run-asm-pipeline-post-review.sh --sort-output -r /nobackup/beegfs/workspace/ks575/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/test/NS2/post_review/draft.rawchrom.review.assembly /nobackup/beegfs/workspace/ks575/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/test/myjuicerdir/references/draft.fa /nobackup/beegfs/workspace/ks575/Data/Myzus/Hi-C_Dec_2019/NS/Hi_C/test/NS2/aligned/merged_nodups.txt
