cd /storage/home/users/pjt6/plas/Pete/VCFs/
/storage/home/users/pjt6/rtg-tools-3.10.1/rtg vcfstats --allele-lengths sks047VsPkA1H1_Assemblytics_AnnotatedVariants.vcf > sks047VsPkA1H1_Assemblytics_AnnotatedVariants_SNP_stats.txt
/storage/home/users/pjt6/rtg-tools-3.10.1/rtg vcfstats --allele-lengths sks048VsPkA1H1_Assemblytics_AnnotatedVariants.vcf > sks048VsPkA1H1_Assemblytics_AnnotatedVariants_SNP_stats.txt
/storage/home/users/pjt6/rtg-tools-3.10.1/rtg vcfstats --allele-lengths sks047VsPkA1H1_Assemblytics_RawVariants.vcf > sks047VsPkA1H1_Assemblytics_RawVariants_SNP_stats.txt
/storage/home/users/pjt6/rtg-tools-3.10.1/rtg vcfstats --allele-lengths sks048VsPkA1H1_Assemblytics_RawVariants.vcf > sks048VsPkA1H1_Assemblytics_RawVariants_SNP_stats.txt
/storage/home/users/pjt6/rtg-tools-3.10.1/rtg vcfstats --allele-lengths sks047VsPkA1H1_ONTSV_AnnotatedVariants.vcf > sks047VsPkA1H1_ONTSV_AnnotatedVariants_SNP_stats.txt
/storage/home/users/pjt6/rtg-tools-3.10.1/rtg vcfstats --allele-lengths sks048VsPkA1H1_ONTSV_AnnotatedVariants.vcf > sks048VsPkA1H1_ONTSV_AnnotatedVariants_SNP_stats.txt
/storage/home/users/pjt6/rtg-tools-3.10.1/rtg vcfstats --allele-lengths sks047VsPkA1H1_ONTSV_RawVariants.vcf > sks047VsPkA1H1_ONTSV_RawVariants_SNP_stats.txt
/storage/home/users/pjt6/rtg-tools-3.10.1/rtg vcfstats --allele-lengths sks048VsPkA1H1_ONTSV_RawVariants.vcf > sks048VsPkA1H1_ONTSV_RawVariants_SNP_stats.txt

# claulate the PI per vcf 
# the three rep on cherry
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks047VsPkA1H1_Assemblytics_AnnotatedVariants.vcf --window-pi 10000 --out sks047VsPkA1H1_Assemblytics_AnnotatedVariants.10000.sitepi 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks048VsPkA1H1_Assemblytics_AnnotatedVariants.vcf --window-pi 10000 --out sks048VsPkA1H1_Assemblytics_AnnotatedVariants.10000.sitepi 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks047VsPkA1H1_Assemblytics_RawVariants.vcf --window-pi 10000 --out sks047VsPkA1H1_Assemblytics_RawVariants.10000.sitepi 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks048VsPkA1H1_Assemblytics_RawVariants.vcf --window-pi 10000 --out sks048VsPkA1H1_Assemblytics_RawVariants.10000.sitepi 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks047VsPkA1H1_ONTSV_AnnotatedVariants.vcf --window-pi 10000 --out sks047VsPkA1H1_ONTSV_AnnotatedVariants.10000.sitepi 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks048VsPkA1H1_ONTSV_AnnotatedVariants.vcf --window-pi 10000 --out sks048VsPkA1H1_ONTSV_AnnotatedVariants.10000.sitepi 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks047VsPkA1H1_ONTSV_RawVariants.vcf --window-pi 10000 --out sks047VsPkA1H1_ONTSV_RawVariants.10000.sitepi 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks048VsPkA1H1_ONTSV_RawVariants.vcf --window-pi 10000 --out sks048VsPkA1H1_ONTSV_RawVariants.10000.sitepi 


# to investigate expected versus observer heterozygosity

/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks047VsPkA1H1_Assemblytics_AnnotatedVariants.vcf --het --out sks047VsPkA1H1_Assemblytics_AnnotatedVariants.het 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks048VsPkA1H1_Assemblytics_AnnotatedVariants.vcf --het --out sks048VsPkA1H1_Assemblytics_AnnotatedVariants.het 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks047VsPkA1H1_Assemblytics_RawVariants.vcf --het --out sks047VsPkA1H1_Assemblytics_RawVariants.het 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks048VsPkA1H1_Assemblytics_RawVariants.vcf --het --out sks048VsPkA1H1_Assemblytics_RawVariants.het 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks047VsPkA1H1_ONTSV_AnnotatedVariants.vcf --het --out sks047VsPkA1H1_ONTSV_AnnotatedVariants.het 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks048VsPkA1H1_ONTSV_AnnotatedVariants.vcf --het --out sks048VsPkA1H1_ONTSV_AnnotatedVariants.het 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks047VsPkA1H1_ONTSV_RawVariants.vcf --het --out sks047VsPkA1H1_ONTSV_RawVariants.het 
/storage/home/users/pjt6/shelf_apps/apps/vcftools_0.1.12b/bin/vcftools --vcf sks048VsPkA1H1_ONTSV_RawVariants.vcf --het --out sks048VsPkA1H1_ONTSV_RawVariants.het 
