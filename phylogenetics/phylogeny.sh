
cd /storage/home/users/pjt6/plas/Pete/ProteinSeq/pfam/
# https://github.com/peterthorpe5/public_scripts/tree/master/domain_searching

conda activate hmm

nt="/storage/home/users/pjt6/plas/Pete/gff/allnt.fasta"
python_repo="/storage/home/users/pjt6/public_scripts/domain_searching"

# hmmsearch
hmmsearch --cut_ga --domtblout ../Cultured_proteins_kir.hmm.tab kir.hmm ../Cultured_proteins.fasta
hmmsearch --cut_ga --domtblout ../Cultured_proteins_sica_alpha.hmm.tab sica_alpha.hmm ../Cultured_proteins.fasta
hmmsearch --cut_ga --domtblout ../Cultured_proteins_sica_beta.hmm.tab sica_beta.hmm ../Cultured_proteins.fasta
hmmsearch --cut_ga --domtblout ../Cultured_proteins_sica_c.hmm.tab sica_c.hmm ../Cultured_proteins.fasta
hmmsearch --cut_ga --domtblout ../PublishedReference_proteins_kir.hmm.tab kir.hmm ../PublishedReference_proteins.fasta
hmmsearch --cut_ga --domtblout ../PublishedReference_proteins_sica_alpha.hmm.tab sica_alpha.hmm ../PublishedReference_proteins.fasta
hmmsearch --cut_ga --domtblout ../PublishedReference_proteins_sica_beta.hmm.tab sica_beta.hmm ../PublishedReference_proteins.fasta
hmmsearch --cut_ga --domtblout ../PublishedReference_proteins_sica_c.hmm.tab sica_c.hmm ../PublishedReference_proteins.fasta
hmmsearch --cut_ga --domtblout ../sks047_proteins_kir.hmm.tab kir.hmm ../sks047_proteins.fasta
hmmsearch --cut_ga --domtblout ../sks047_proteins_sica_alpha.hmm.tab sica_alpha.hmm ../sks047_proteins.fasta
hmmsearch --cut_ga --domtblout ../sks047_proteins_sica_beta.hmm.tab sica_beta.hmm ../sks047_proteins.fasta
hmmsearch --cut_ga --domtblout ../sks047_proteins_sica_c.hmm.tab sica_c.hmm ../sks047_proteins.fasta
hmmsearch --cut_ga --domtblout ../sks048_proteins_kir.hmm.tab kir.hmm ../sks048_proteins.fasta
hmmsearch --cut_ga --domtblout ../sks048_proteins_sica_alpha.hmm.tab sica_alpha.hmm ../sks048_proteins.fasta
hmmsearch --cut_ga --domtblout ../sks048_proteins_sica_beta.hmm.tab sica_beta.hmm ../sks048_proteins.fasta
hmmsearch --cut_ga --domtblout ../sks048_proteins_sica_c.hmm.tab sica_c.hmm ../sks048_proteins.fasta

conda activate python27
# get the AA domain
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  Cultured_proteins_kir.hmm.tab -o Cultured_proteins_kir.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  sks047_proteins_kir.hmm.tab -o sks047_proteins_kir.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  Cultured_proteins_sica_alpha.hmm.tab -o Cultured_proteins_sica_alpha.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  sks047_proteins_sica_alpha.hmm.tab -o sks047_proteins_sica_alpha.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  Cultured_proteins_sica_beta.hmm.tab -o Cultured_proteins_sica_beta.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  sks047_proteins_sica_beta.hmm.tab -o sks047_proteins_sica_beta.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  Cultured_proteins_sica_c.hmm.tab -o Cultured_proteins_sica_c.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  sks047_proteins_sica_c.hmm.tab -o sks047_proteins_sica_c.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  PublishedReference_proteins_kir.hmm.tab -o PublishedReference_proteins_kir.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  sks048_proteins_kir.hmm.tab -o sks048_proteins_kir.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  PublishedReference_proteins_sica_alpha.hmm.tab -o PublishedReference_proteins_sica_alpha.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  sks048_proteins_sica_alpha.hmm.tab -o sks048_proteins_sica_alpha.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  PublishedReference_proteins_sica_beta.hmm.tab -o PublishedReference_proteins_sica_beta.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  sks048_proteins_sica_beta.hmm.tab -o sks048_proteins_sica_beta.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  PublishedReference_proteins_sica_c.hmm.tab -o PublishedReference_proteins_sica_c.hmm.AA.fasta 
python ${python_repo}/get_DOMAIN_region_i_want_from_fasta_amino_acid.py -i ../all.fa --hmm  sks048_proteins_sica_c.hmm.tab -o sks048_proteins_sica_c.hmm.AA.fasta 

# extract min len 100 AA
python ${python_repo}/rewrite_as_fasta.py -i Cultured_proteins_kir.hmm.AA.fasta  -l 100 -o Cultured_proteins_kir.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks047_proteins_kir.hmm.AA.fasta  -l 100 -o sks047_proteins_kir.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i Cultured_proteins_sica_alpha.hmm.AA.fasta  -l 100 -o Cultured_proteins_sica_alpha.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks047_proteins_sica_alpha.hmm.AA.fasta  -l 100 -o sks047_proteins_sica_alpha.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i Cultured_proteins_sica_beta.hmm.AA.fasta  -l 100 -o Cultured_proteins_sica_beta.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks047_proteins_sica_beta.hmm.AA.fasta  -l 100 -o sks047_proteins_sica_beta.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i Cultured_proteins_sica_c.hmm.AA.fasta  -l 100 -o Cultured_proteins_sica_c.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks047_proteins_sica_c.hmm.AA.fasta  -l 100 -o sks047_proteins_sica_c.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i PublishedReference_proteins_kir.hmm.AA.fasta  -l 100 -o PublishedReference_proteins_kir.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks048_proteins_kir.hmm.AA.fasta  -l 100 -o sks048_proteins_kir.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i PublishedReference_proteins_sica_alpha.hmm.AA.fasta  -l 100 -o PublishedReference_proteins_sica_alpha.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks048_proteins_sica_alpha.hmm.AA.fasta  -l 100 -o sks048_proteins_sica_alpha.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i PublishedReference_proteins_sica_beta.hmm.AA.fasta  -l 100 -o PublishedReference_proteins_sica_beta.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks048_proteins_sica_beta.hmm.AA.fasta  -l 100 -o sks048_proteins_sica_beta.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i PublishedReference_proteins_sica_c.hmm.AA.fasta  -l 100 -o PublishedReference_proteins_sica_c.hmm.AA.filtered.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks048_proteins_sica_c.hmm.AA.fasta  -l 100 -o sks048_proteins_sica_c.hmm.AA.filtered.fasta 

# align them 
muscle -in kir.hmm.AA.filtered.fasta -out kir.hmm.AA.filtered.fasta.aln
muscle -in kir.hmm.AA.filtered.fasta.aln -out kir.hmm.AA.filtered.fasta.refine.fasta
muscle -in alpha.hmm.AA.filtered.fasta -out alpha.hmm.AA.filtered.fasta.aln
muscle -in alpha.hmm.AA.filtered.fasta.aln -out alpha.hmm.AA.filtered.fasta.refine.fasta
muscle -in beta.hmm.AA.filtered.fasta -out beta.hmm.AA.filtered.fasta.aln
muscle -in beta.hmm.AA.filtered.fasta.aln -out beta.hmm.AA.filtered.fasta.refine.fasta
muscle -in c.hmm.AA.filtered.fasta -out c.hmm.AA.filtered.fasta.aln
muscle -in c.hmm.AA.filtered.fasta.aln -out c.hmm.AA.filtered.fasta.refine.fasta

python ${python_repo}/rewrite_as_fasta.py -i kir.hmm.AA.filtered.fasta.refine.fasta -o kir.hmm.AA.filtered.fasta.refine.fasta2
python ${python_repo}/rewrite_as_fasta.py -i alpha.hmm.AA.filtered.fasta -o alpha.hmm.AA.filtered.fasta.refine.fasta2
python ${python_repo}/rewrite_as_fasta.py -i beta.hmm.AA.filtered.fasta.refine.fasta -o beta.hmm.AA.filtered.fasta.refine.fasta2
python ${python_repo}/rewrite_as_fasta.py -i c.hmm.AA.filtered.fasta.refine.fasta -o c.hmm.AA.filtered.fasta.refine.fasta2




python ${python_repo}/rewrite_as_fasta.py -i kir.nt.fasta    -o kir.nt.fasta2
python ${python_repo}/rewrite_as_fasta.py -i beta_nt.fasta   -o beta_nt.fasta2
python ${python_repo}/rewrite_as_fasta.py -i alpha_nt.fasta  -o alpha_nt.fasta2
python ${python_repo}/rewrite_as_fasta.py -i c.hmm.nt.fasta  -o c.hmm.nt.fasta2


# get the nt coding seq for the dommains:
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm Cultured_proteins_kir.hmm.tab -o Cultured_proteins_kir.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm sks047_proteins_kir.hmm.tab -o sks047_proteins_kir.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm Cultured_proteins_sica_alpha.hmm.tab -o Cultured_proteins_sica_alpha.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm sks047_proteins_sica_alpha.hmm.tab -o sks047_proteins_sica_alpha.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm Cultured_proteins_sica_beta.hmm.tab -o Cultured_proteins_sica_beta.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm sks047_proteins_sica_beta.hmm.tab -o sks047_proteins_sica_beta.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm Cultured_proteins_sica_c.hmm.tab -o Cultured_proteins_sica_c.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm sks047_proteins_sica_c.hmm.tab -o sks047_proteins_sica_c.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm PublishedReference_proteins_kir.hmm.tab -o PublishedReference_proteins_kir.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm sks048_proteins_kir.hmm.tab -o sks048_proteins_kir.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm PublishedReference_proteins_sica_alpha.hmm.tab -o PublishedReference_proteins_sica_alpha.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm sks048_proteins_sica_alpha.hmm.tab -o sks048_proteins_sica_alpha.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm PublishedReference_proteins_sica_beta.hmm.tab -o PublishedReference_proteins_sica_beta.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm sks048_proteins_sica_beta.hmm.tab -o sks048_proteins_sica_beta.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm PublishedReference_proteins_sica_c.hmm.tab -o PublishedReference_proteins_sica_c.hmm.nt.fasta
python ${python_repo}/get_DOMAIN_region_I_want_from_fasta_Nucleotide.py -i ${nt} --hmm sks048_proteins_sica_c.hmm.tab -o sks048_proteins_sica_c.hmm.nt.fasta

# rewrite:

python ${python_repo}/rewrite_as_fasta.py -i Cultured_proteins_kir.hmm.nt.fasta -l 300 -o  Cultured_proteins_kir.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks047_proteins_kir.hmm.nt.fasta -l 300 -o  sks047_proteins_kir.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i Cultured_proteins_sica_alpha.hmm.nt.fasta -l 300 -o  Cultured_proteins_sica_alpha.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks047_proteins_sica_alpha.hmm.nt.fasta -l 300 -o  sks047_proteins_sica_alpha.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i Cultured_proteins_sica_beta.hmm.nt.fasta -l 300 -o  Cultured_proteins_sica_beta.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks047_proteins_sica_beta.hmm.nt.fasta -l 300 -o  sks047_proteins_sica_beta.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i Cultured_proteins_sica_c.hmm.nt.fasta -l 300 -o  Cultured_proteins_sica_c.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks047_proteins_sica_c.hmm.nt.fasta -l 300 -o  sks047_proteins_sica_c.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i PublishedReference_proteins_kir.hmm.nt.fasta -l 300 -o  PublishedReference_proteins_kir.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks048_proteins_kir.hmm.nt.fasta -l 300 -o  sks048_proteins_kir.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i PublishedReference_proteins_sica_alpha.hmm.nt.fasta -l 300 -o  PublishedReference_proteins_sica_alpha.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks048_proteins_sica_alpha.hmm.nt.fasta -l 300 -o  sks048_proteins_sica_alpha.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i PublishedReference_proteins_sica_beta.hmm.nt.fasta -l 300 -o  PublishedReference_proteins_sica_beta.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks048_proteins_sica_beta.hmm.nt.fasta -l 300 -o  sks048_proteins_sica_beta.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i PublishedReference_proteins_sica_c.hmm.nt.fasta -l 300 -o  PublishedReference_proteins_sica_c.hmm.nt2.fasta 
python ${python_repo}/rewrite_as_fasta.py -i sks048_proteins_sica_c.hmm.nt.fasta -l 300 -o  sks048_proteins_sica_c.hmm.nt2.fasta 


