#!/bin/bash -l
#SBATCH --partition=hmq
#SBATCH --job-name=pilonflye                         # Job name
#SBATCH --mail-type=ALL                            # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ks575@exeter.ac.uk                  # Where to send mail
#SBATCH --ntasks=1                                      # Run a single task
#SBATCH --cpus-per-task=64                         # Number of CPU cores per task
#SBATCH --mem=10gb                                       # Job memory request
#SBATCH --time=240:05:00                                 # Time limit hrs:min:sec
#SBATCH --output=pilon_parallel_%j.log                        # Standard output and error log
#SBATCH --account=c.bass

pwd; hostname; date
export OMP_NUM_THREADS=64
pwd; hostname; date
echo "Running a program on $SLURM_JOB_NODELIST"
#
#/path/to/my/application
echo "Hello $USER, this is running on the $SLURM_CLUSTER_NAME cluster at `hostname` using PI account = $SLURM_JOB_ACCOUNT"
module load shared slurm/18.08.4 samtools/1.9 bwa/0.7.17 Oracle_Java/8u192
##cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run1
##bwa index -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run1/bartek.project2912.racon.iter3 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/racon/run3/bartek.project2912.racon.iter3.fasta
##bwa mem -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run1/bartek.project2912.racon.iter3 /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R1_val_1.fastq /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R2_val_2.fastq | samtools view -bS - | samtools sort -m 8G --threads 45 - > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run1/pilon.r1.sorted.bam
##samtools index -b /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run1/pilon.r1.sorted.bam
##java -Xmx150g -jar /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/Pilon/pilon-1.23.jar --genome /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/racon/run3/bartek.project2912.racon.iter3.fasta --frags /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run1/pilon.r1.sorted.bam --outdir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run1 --output bartek.project2912.flye.pilon.iter1 --diploid --threads 45
##
##cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run2
##bwa index -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run2/bartek.project2912.pilon.iter2 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run1/bartek.project2912.flye.pilon.iter1.fasta
##bwa mem -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run2/bartek.project2912.pilon.iter2 /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R1_val_1.fastq /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R2_val_2.fastq | samtools view -bS - | samtools sort -m 8G --threads 45 - > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run2/pilon.r2.sorted.bam
##samtools index -b /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run2/pilon.r2.sorted.bam
##java -Xmx150g -jar /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/Pilon/pilon-1.23.jar --genome /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run1/bartek.project2912.flye.pilon.iter1.fasta --frags /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run2/pilon.r2.sorted.bam --outdir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run2 --output bartek.project2912.flye.pilon.iter2 --diploid --threads 45
##
##cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run3
##bwa index -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run3/bartek.project2912.pilon.iter3 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run2/bartek.project2912.flye.pilon.iter2.fasta
##bwa mem -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run3/bartek.project2912.pilon.iter3  /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R1_val_1.fastq /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18338_LDI15829_ACAGTG_R2_val_2.fastq | samtools view -bS - | samtools sort -m 8G --threads 45 - > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run3/pilon.r3.sorted.bam
##samtools index -b /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run3/pilon.r3.sorted.bam
##java -Xmx150g -jar /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/Pilon/pilon-1.23.jar --genome /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run2/bartek.project2912.flye.pilon.iter2.fasta --frags /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run3/pilon.r3.sorted.bam --outdir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/flye/Polish/pilon/run3 --output bartek.project2912.flye.pilon.iter3 --diploid --threads 45
##
cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run1
bwa index -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run1/bartek.project2913.racon.iter3 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/racon/run3/bartek.project2913.racon.iter3.fasta
bwa mem -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run1/bartek.project2913.racon.iter3 /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18344_LDI15835_ATGTCA_R1_val_1.fastq /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18344_LDI15835_ATGTCA_R2_val_2.fastq | samtools view -bS - | samtools sort -m 8G --threads 45 - > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run1/pilon.r1.sorted.bam
samtools index -b /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run1/pilon.r1.sorted.bam
java -Xmx150g -jar /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/Pilon/pilon-1.23.jar --genome /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/racon/run3/bartek.project2913.racon.iter3.fasta --frags /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run1/pilon.r1.sorted.bam --outdir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run1 --output bartek.project2913.flye.pilon.iter1 --diploid --threads 45
##
cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run2
bwa index -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run2/bartek.project2913.pilon.iter2 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run1/bartek.project2913.flye.pilon.iter1.fasta
bwa mem -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run2/bartek.project2913.pilon.iter2 /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18344_LDI15835_ATGTCA_R1_val_1.fastq /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18344_LDI15835_ATGTCA_R2_val_2.fastq | samtools view -bS - | samtools sort -m 8G --threads 45 - > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run2/pilon.r2.sorted.bam
samtools index -b /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run2/pilon.r2.sorted.bam
java -Xmx150g -jar /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/Pilon/pilon-1.23.jar --genome /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run1/bartek.project2913.flye.pilon.iter1.fasta --frags /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run2/pilon.r2.sorted.bam --outdir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run2 --output bartek.project2913.flye.pilon.iter2 --diploid --threads 45
##
cd $WORKSPACE/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run3
bwa index -p /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run3/bartek.project2913.pilon.iter3 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run2/bartek.project2913.flye.pilon.iter2.fasta
bwa mem -t 64 /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run3/bartek.project2913.pilon.iter3  /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18344_LDI15835_ATGTCA_R1_val_1.fastq /nobackup/beegfs/workspace/ks575/Data/Myzus/Myzus_mapping/Trimmed_Resequencing_Data_18_03_2019/old_batch/1404_LIB18344_LDI15835_ATGTCA_R2_val_2.fastq | samtools view -bS - | samtools sort -m 8G --threads 45 - > /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run3/pilon.r3.sorted.bam
samtools index -b /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run3/pilon.r3.sorted.bam
java -Xmx150g -jar /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2912/wtdbg2/Polish/pilon/Pilon/pilon-1.23.jar --genome /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run2/bartek.project2913.flye.pilon.iter2.fasta --frags /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run3/pilon.r3.sorted.bam --outdir /nobackup/beegfs/workspace/ks575/Data/Myzus/Barteks_PB/Project_2913/flye/Polish/pilon/run3 --output bartek.project2913.flye.pilon.iter3 --diploid --threads 45
