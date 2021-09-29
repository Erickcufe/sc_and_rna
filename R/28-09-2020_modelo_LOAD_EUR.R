# install.packages("furrr")
# devtools::install_github("Erickcufe/seekerBio")
# devtools::install_github("Erickcufe/hgdp", ref = "erick")
# 
# usethis::git_sitrep()
# usethis::create_github_token()
# gitcreds::gitcreds_set()

library(tidyverse)
alzheimer <- seekerBio::seeker_gwas("alzheimer")
AD <- alzheimer[alzheimer$P.VALUE <= 5e-8,]
AD <- AD[stringr::str_detect(AD$DISEASE.TRAIT, "late onset"),]
SNPs_AD <- seekerBio::seeker_snp_freq(AD$SNPS) %>%
  seekerBio::seeker_snp_freq_format()

readr::write_csv(AD,"data/AlzheimerLOAD_GWAS.csv")
readr::write_csv(SNPs_AD[[1]],"data/AlzheimerLOAD_SNPs_freq.csv")

arq_AD <- seekerBio::seeker_snp_arq(SNPs_AD[[1]]$SNP) %>%
  select("SNP","seq_region_name", "start")
context_AD <- seekerBio::seeker_snp_context(SNPs_AD[[1]]$SNP)

readr::write_csv(arq_AD,"data/AlzheimerLOAD_SNPs_arquitec.csv")
readr::write_csv(context_AD,"data/AlzheimerLOAD_SNPs_contex.csv")
