#!/bin/bash
#$ -cwd
#Abort on any error,
#set -e

#echo Running on $HOSTNAME
#echo Current PATH is $PATH
#source $HOME/.bash_profile

################################################################
# Variables: FILLL IN DOWN TO THE END OF VARIABLES


min_len_gene="5"
threads=32
python_directory=$HOME/public_scripts/gene_model_testing/
Working_directory=/storage/home/users/pjt6/plas/Pete/ProteinSeq/

diamond_db=/storage/home/users/blastDatabases/nr_PT.dmnd


# taxonomy id for HGT
species_tx_id=5850
tax_filter_out=418103
#  plasmodium (Plasmodium)
tax_filter_up_to=33208 



# END OF VARIABLES !!!!!!!!!!!!!!!!!!!!!!
########################################################
#conda activate genemodel

cd ${Working_directory}

fasta_files=Cultured_proteins.fasta
for f in ${fasta_files}
do
    test_fa=${f}
    folder=${f:0:$((${#f}-6))}
    mkdir ${folder}
    cd ${folder}

    echo "running diamond-BLAST against NR"
    diam_p="diamond blastp -p 16 --more-sensitive -e 0.00001 
        -v -q ../${f} 
        -d ${diamond_db}  
        -a aa.fasta_vs_nr.da"
    echo ${diam_p}
    eval ${diam_p}
    wait

    
    echo "converting diamond-BLAST output"
    diam_v="diamond view -a aa.fasta*.daa -f tab -o aa.fasta_vs_nr.tab"
    echo ${diam_v}
    eval ${diam_v}
    wait
    
    echo "converting diamond-BLAST output to xml for blast2 go"
    diam_v="diamond view -a aa.fasta*.daa --outfmt 5 -o aa.fasta_vs_nr.xml"
    echo ${diam_v}
    eval ${diam_v}
    wait
    
    echo "adding tx_id and descriptions to diamond-BLAST output"
    tax="python $HOME/public_scripts/Diamond_BLAST_add_taxonomic_info/Diamond_blast_to_taxid.py
        -i aa.fasta_vs_nr.tab 
        -p /storage/home/users/blastDatabases/ 
        -o aa.fasta_vs_nr_tax.tab"
    echo ${tax}
    eval ${tax}
    wait
    
    echo "predicting HGT"
    HGT="python $HOME/public_scripts/Lateral_gene_transfer_prediction_tool/Lateral_gene_transfer_predictor.py 
            -i *_vs_nr_tax.tab 
            --tax_filter_out ${tax_filter_out} 
            --tax_filter_up_to ${tax_filter_up_to}
            -p /storage/home/users/blastDatabases/ -o LTG_results.out"
    
    echo ${HGT}
    eval ${HGT}
    wait
    #
    
    #Filter taxomony commands:
    echo "filtering blast results"
    filter_top_blasts="python ${python_directory}/top_BLAST_hit_filter_out_tax_id.py 
                    -i *_vs_nr_tax.tab 
                    -t ${tax_filter_out} 
                    -p /storage/home/users/blastDatabases/ 
                    -o top_not_phylum_${tax_filter_out}.hits"
    echo ${filter_top_blasts}
    eval ${filter_top_blasts}
    wait
    
    filter_species="python ${python_directory}/top_BLAST_hit_filter_out_tax_id.py 
                -i *_vs_nr_tax.tab 
                -t ${species_tx_id}
                -p /storage/home/users/blastDatabases/ 
                -o top_not_species_tx_id_${species_tx_id}.hits"
    echo ${filter_species}
    eval ${filter_species}
    wait
    cd ${Working_directory}
done

