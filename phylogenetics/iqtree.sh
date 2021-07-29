cd /storage/home/users/pjt6/plas/Pete/ProteinSeq/pfam/
# trim al gappy alignment
#/storage/home/users/pjt6/shelf_apps/apps/iqtree-1.6.12-Linux/bin/iqtree -s al_nems_vs_SPRY_domains_min_70AA_trimAl.fasta \
-st AA -m TEST -bb 1000 -alrt 1000 -mem 200GB -nt AUTO 

cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal  
-in c_backtranslated.fasta  
-out c_backtranslated_gappy.fasta
-fasta
-gappyout" 
echo ${cmd}
#eval ${cmd}

kir_align_backtranslated.fasta

cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal  
-in kir_align_backtranslated.fasta
-out kir_align_backtranslated_gappy.fasta
-fasta
-gappyout" 
echo ${cmd}
#eval ${cmd}

# trim al
#/storage/home/users/pjt6/shelf_apps/apps/iqtree-1.6.12-Linux/bin/iqtree -s kir_align_backtranslated_gappy.fasta \
#-st AA -m TEST -bb 1000 -alrt 1000 -mem 200GB -nt AUTO 

/storage/home/users/pjt6/shelf_apps/apps/iqtree-1.6.12-Linux/bin/iqtree -s c_backtranslated_gappy.fasta \
-st AA -m TEST -bb 1000 -alrt 1000 -mem 200GB -nt AUTO 
