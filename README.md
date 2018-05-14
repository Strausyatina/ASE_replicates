# Prerequisites as input:

1. RNA-seq data for F1-cross, fastq file (single end or paired end)

  > For example, `rep_i.fastq` for each of i={1..N} replicates. 

2. Reference genome

  > For example, `GRCm38_68.fa`.
  ```
  wget ftp://ftp-mouse.sanger.ac.uk/ref/GRCm38_68.fa
  ```

3. gtf annotation for the reference genome

  > For example, `Mus_musculus.GRCm38.68.gtf.gz` for corresponding reference genome version.
  ```
  wget ftp://ftp.ensembl.org/pub/release-68/gtf/mus_musculus/Mus_musculus.GRCm38.68.gtf.gz
  ```

4. Two vcf files for maternal and paternal imbred line (should be "compatible" with reference genome)
  
  > For example, `129S1_SvImJ.mgp.v5.snps.dbSNP142.vcf.gz` and `CAST_EiJ.mgp.v5.snps.dbSNP142.vcf.gz` for 129S1 and CAST mice lines.
  ```
  wget ftp://ftp-mouse.sanger.ac.uk/current_snps/strain_specific_vcfs/129S1_SvImJ.mgp.v5.snps.dbSNP142.vcf.gz
  wget ftp://ftp-mouse.sanger.ac.uk/current_snps/strain_specific_vcfs/CAST_EiJ.mgp.v5.snps.dbSNP142.vcf.gz
  ```
    or

    Joint vcf file for multiple species, where two lines are presented (should be "compatible" with reference genome)
  
  > For example, `mgp.v5.merged.snps_all.dbSNP142.vcf.gz` for multiple mice lines.
  ```
  wget ftp://ftp-mouse.sanger.ac.uk/current_snps/mgp.v5.merged.snps_all.dbSNP142.vcf.gz
  ```
  > *Note: remember about vcf calling by mutect, varscan, etc*


# Reference preparation:

## Pseudogenomes:

## F1-cross vcf files:

## Gene-Transcript-Exon Annotations:

...

# Pipeline-specific fastq aligning:

For different tools there is required an alignment with:

* Unique read placement

* Multiple read placement

# Pipeline specific bam processing:

#

# Replicates analysis:




