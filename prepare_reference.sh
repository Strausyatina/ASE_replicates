#########################################################
# 							#
# 		ASE Replicates Progect			#
# 		   ..bla-bla-bla..			#
#							#
#   Authors: Mendelevich Asya, Svetlana Vinogradova	#
#							#
#########################################################
#
# DESCRIPTION:
#   Function for full reference preprocessing:
#     - Creating pseudogenomes from reference genomes and vcf file(s)
#     - F1-cross vcf files
#     - Gene-Transcript-Exon Annotations
#
# Please, use --help|-h for help.
#

# =====================================================
# 0. ARGUMENTS HANDLING                               ||
# =====================================================
help_message() {
  echo 
  echo "Usage: prepare_reference.sh --ref /path/to/reference_genome.fa --gtf /path/to/reference_genome.gtf --name_mat line1 --name_pat line2 --vcf /path/to/joined.vcf --o_dir /path/to/output/dir"
  echo
  echo "   --ref,-r        path to reference_genome.fa file (necessary)"
  echo "   --gtf,-g        path to reference_genome.gtf file (necessary)"
  echo "   --name_mat,-m   name of maternal line/sample (necessary for case of merged vcf: names should coincide with names in vcf; if not provided: 'mat')"
  echo "   --name_pat,-p   name of paternal line/sample (necessary for case of merged vcf: names should coincide with names in vcf; if not provided: 'pat')"
  echo "   --vcf_mat,-M    path to maternal vcf file (eigther --vcf or pair --vcf_mat & --vcf_pat is necessary; separate vcf will dominate if both provided)"
  echo "   --vcf_pat,-P    path to paternal vcf file (eigther --vcf or pair --vcf_mat & --vcf_pat is necessary; separate vcf will dominate if both provided)"
  echo "   --vcf,-V        path to joined vcf file with --name_mat and --name_pat columns (eigther --vcf or pair --vcf_mat & --vcf_pat is necessary; separate vcf will dominate if both provided)"
  echo "   --o_dir,-o      path to output directory (necessary)"
  echo
  echo "Requirements:"
  echo
  echo "  bash(v4.2.46)"
  echo "  gcc(v6.2.0)"
  echo "  python(v3.6.0)"
  echo 
  echo "Restrictions: "
  echo
  echo "  * uses "/" ar directory path delimiter."
  echo
  exit 1
}
while [[ $# -gt 0 ]]
do
  case "$1" in 
    --help | -h)
      help_message
      exit
      ;;
    --ref | -r)
      ref_fa=$2
      ;;
    --gtf | -g)
      ref_gtf=$2
      ;;
    --name_mat | -m)
      name_mat=$2
      ;;
    --name_pat | -p)
      name_pat=$2
      ;;
    --vcf_mat | -M)
      vcf_mat=$2
      ;;
    --vcf_pat | -P)
      vcf_pat=$2
      ;;
    --vcf | -V)
      vcf_joint=$2
      ;;
    --o_dir | -o)
      o_dir=$2
      ;;
  esac
  shift
  shift
done

raise_variable_absence() {
  echo "ERROR: Not all variables provided. Try --help."
  exit  
}

if [[ $ref_fa -eq "" || $ref_gtf -eq "" || $o_dir -eq "" || (($vcf_mat -eq "" || $vcf_pat -eq "") && $vcf_joint -eq "") ]]
then 
  raise_variable_absence
fi

if [[ $name_mat -eq "" ]]
then
  if [[ $vcf_mat -ne "" && $vcf_pat -ne "" ]]
  then
    name_mat="mat"
    echo "WARNING: Maternal name was not provided, set to 'mat'."
  else
    echo "ERROR: Names should be provided in case of joint vcf."
    raise_variable_absence
  fi
fi

if [[ $name_pat -eq "" ]]
then
  if [[ $vcf_mat -ne "" && $vcf_pat -ne "" ]]
  then
    name_mat="pat"
    echo "WARNING: Paternal name was not provided, set to 'pat'"
  else
    echo "ERROR: Names should be provided in case of joint vcf."
    raise_variable_absence
  fi
fi

# =====================================================
# 1. VCF FILES PREPARATION			      ||
# =====================================================

# -----------------------------------------------------
# 1.1. SEPARATE VCFs				      |
# -----------------------------------------------------

if [[ $vcf_mat -eq "" ]]
then
  python vcf_separation.py --vcf_joint --vcf_separate $o_dir"" 
# *** TODO: paths to scripts! ***  
fi 
if [[ $vcf_pat -eq "" ]]
then

fi

# -----------------------------------------------------
# 1.2. F1 VCF, F1 EXON VCF, SNP POSITIONS	      |
# -----------------------------------------------------
#



