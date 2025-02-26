#!/bin/bash -l
#SBATCH --partition=hmq
#SBATCH --job-name=polQM2                         # Job name
#SBATCH --mail-type=FAIL                           # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ks575@exeter.ac.uk                  # Where to send mail
#SBATCH --ntasks=1                                      # Run a single task
#SBATCH --cpus-per-task=64                         # Number of CPU cores per task
#SBATCH --mem=10gb                                       # Job memory request
#SBATCH --time=240:05:00                                 # Time limit hrs:min:sec
#SBATCH --output=polish_parallel_%j.log                        # Standard output and error log
#SBATCH --account=c.bass

pwd; hostname; date
export OMP_NUM_THREADS=64
pwd; hostname; date
echo "Running a program on $SLURM_JOB_NODELIST"
##
#/path/to/my/application
echo "Hello $USER, this is running on the $SLURM_CLUSTER_NAME cluster at `hostname` using PI account = $SLURM_JOB_ACCOUNT"

#cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run1
#minimap2 -t 64 -ax map-pb /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/merged_out.fasta /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/Project_2912_subreads.copy.fasta.gz > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run1/aligned.sam
#racon -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/Project_2912_subreads.copy.fasta.gz /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run1/aligned.sam /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/merged_out.fasta > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run1/project2912.racon.iter1.fasta
##
#cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run2
#minimap2 -t 64 -ax map-pb /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run1/project2912.racon.iter1.fasta /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/Project_2912_subreads.copy.fasta.gz > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run2/aligned.sam
#racon -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/Project_2912_subreads.copy.fasta.gz /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run2/aligned.sam /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run1/project2912.racon.iter1.fasta > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run2/project2912.racon.iter2.fasta
##
#cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run3
#minimap2 -t 64 -ax map-pb /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run2/project2912.racon.iter2.fasta /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/Project_2912_subreads.copy.fasta.gz > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run3/aligned.sam
#racon -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/Project_2912_subreads.copy.fasta.gz /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run3/aligned.sam /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run2/project2912.racon.iter2.fasta > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run3/project2912.racon.iter3.fasta
##
module load shared slurm/18.08.4 Workspace/v1 Conda/Python2/2.7.15 ks575/minimap2/v2.17 samtools/1.9 ks575/racon/v1.4.3 bwa/0.7.17 Oracle_Java/8u192
##
cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run1
bwa index -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run1/project2912.pilon.iter1 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run3/project2912.racon.iter3.fasta
bwa mem -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run1/project2912.pilon.iter1 /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R1_val_1.fastq /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R2_val_2.fastq | samtools view -bS - | samtools sort -m 8G --threads 45 - > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run1/pilon.r1.sorted.bam
samtools index -b /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run1/pilon.r1.sorted.bam
java -Xmx150g -jar /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/Pilon/pilon-1.23.jar --genome /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/racon/run3/project2912.racon.iter3.fasta --frags /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run1/pilon.r1.sorted.bam --outdir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run1 --output project2912.pilon.iter1 --diploid --threads 45
##
cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run2
bwa index -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run2/project2912.pilon.iter2 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run1/project2912.pilon.iter1.fasta
bwa mem -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run2/project2912.pilon.iter2 /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R1_val_1.fastq /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R2_val_2.fastq | samtools view -bS - | samtools sort -m 8G --threads 45 - > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run2/pilon.r2.sorted.bam
samtools index -b /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run2/pilon.r2.sorted.bam
java -Xmx150g -jar /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/Pilon/pilon-1.23.jar --genome /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run1/project2912.pilon.iter1.fasta --frags /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run2/pilon.r2.sorted.bam --outdir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run2 --output project2912.pilon.iter2 --diploid --threads 45
##
cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run3
bwa index -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run3/project2912.pilon.iter3 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run2/project2912.pilon.iter2.fasta
bwa mem -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run3/project2912.pilon.iter3 /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R1_val_1.fastq /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R2_val_2.fastq | samtools view -bS - | samtools sort -m 8G --threads 45 - > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run3/pilon.r3.sorted.bam
samtools index -b /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run3/pilon.r3.sorted.bam
java -Xmx150g -jar /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/Pilon/pilon-1.23.jar --genome /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run2/project2912.pilon.iter2.fasta --frags /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run3/pilon.r3.sorted.bam --outdir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/qm_flye_wtdbg2/Polish/pilon/run3 --output project2912.pilon.iter3 --diploid --threads 45
