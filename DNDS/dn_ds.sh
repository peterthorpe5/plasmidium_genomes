cd /storage/home/users/pjt6/plas/Pete/ProteinSeq/



#/shelf/apps/pjt6/conda/envs/python27/bin/python get_clustr_sequences.py 


###########################################################################################
# effectors
cd /storage/home/users/pjt6/plas/Pete/ProteinSeq/effectors
rm *fasta_*
rm -rf back_translated

filenames=*.fasta



for f in ${filenames}
do
	#echo "Running muscle ${f}"
	cmd="muscle -in ${f} -out ${f}_aligned.fasta" 
	echo ${cmd}
	eval ${cmd}
	wait
	
done
###############################

filenames2=*_aligned.fasta
for file in ${filenames2}
do
	echo "Running muscle ${f}"
	cmd="muscle -in ${file} -out ${file}_refine.fasta -refine" 
	echo ${cmd}
	eval ${cmd}
	wait
done
mkdir back_translated

python /storage/home/users/pjt6/plas/Pete/ProteinSeq/Align_back_translate.py

#####################
cd back_translated/
filenames3=*_refine.fasta
for file in ${filenames3}
do
	echo "Running trimal ${file}"
	cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal  
    -in ${file}  
    -out ${file}.phy
    -phylip 
    -gappyout" 
	echo ${cmd}
	#eval ${cmd}
	wait
done



cd back_translated/


filenames3=*translated.fasta
for file in ${filenames3}
do
	echo "Running trimal ${file}"
	cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal   
    -in ${file}  
    -out ${file}.phy
    -phylip 
    -nogaps" 
	echo ${cmd}
	eval ${cmd}
	wait
done

mkdir phy_files

mv *.phy ./phy_files/

cd phy_files


filenames=*.phy

# phyml
export PATH=/storage/home/users/pjt6/phyml-20140723/src/:$PATH

#codonphyml
export PATH=/storage/home/users/pjt6/codonPHYML_dev/src/:$PATH



## nucleotide version
mkdir files_done
for f in ${filenames}
do
	echo "Running codonphyml ${f}"
	cmd="codonphyml -i ${f} -m GY --fmodel F3X4 -t e -f empirical -w g -a e" #--optBrent 3
	echo ${cmd}
	eval ${cmd}
	wait
	cmd2="mv ${f} ./files_done"
	echo ${cmd2}
	eval ${cmd2}
done

grep "Probability: o3=" -H *_stats.txt > /storage/home/users/pjt6/plas/Pete/ProteinSeq/effector_no_gaps_RBBH_orthofinder_DN_DS.txt


##############################################################################################################
# BUSCO
cd /storage/home/users/pjt6/plas/Pete/ProteinSeq/busco/
rm *fasta_*
rm -rf back_translated

filenames=*.fasta



for f in ${filenames}
do
	#echo "Running muscle ${f}"
	cmd="muscle -in ${f} -out ${f}_aligned.fasta" 
	echo ${cmd}
	eval ${cmd}
	wait
	
done
###############################

filenames2=*_aligned.fasta
for file in ${filenames2}
do
	echo "Running muscle ${f}"
	cmd="muscle -in ${file} -out ${file}_refine.fasta -refine" 
	echo ${cmd}
	eval ${cmd}
	wait
done
mkdir back_translated

python /storage/home/users/pjt6/plas/Pete/ProteinSeq/Align_back_translate.py

#####################
cd back_translated/
filenames3=*_refine.fasta
for file in ${filenames3}
do
	echo "Running trimal ${file}"
	cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal  
    -in ${file}  
    -out ${file}.phy
    -phylip 
    -gappyout" 
	echo ${cmd}
	#eval ${cmd}
	wait
done



cd back_translated/
filenames3=*translated.fasta



filenames3=*translated.fasta
for file in ${filenames3}
do
	echo "Running trimal ${file}"
	cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal   
    -in ${file}  
    -out ${file}.phy
    -phylip 
    -nogaps" 
	echo ${cmd}
	eval ${cmd}
	wait
done

mkdir phy_files

mv *.phy ./phy_files/

cd phy_files


filenames=*.phy

# phyml
export PATH=/storage/home/users/pjt6/phyml-20140723/src/:$PATH

#codonphyml
export PATH=/storage/home/users/pjt6/codonPHYML_dev/src/:$PATH



## nucleotide version
mkdir files_done
for f in ${filenames}
do
	echo "Running codonphyml ${f}"
	cmd="codonphyml -i ${f} -m GY --fmodel F3X4 -t e -f empirical -w g -a e" #--optBrent 3
	echo ${cmd}
	eval ${cmd}
	wait
	cmd2="mv ${f} ./files_done"
	echo ${cmd2}
	eval ${cmd2}
done

grep "Probability: o3=" -H *_stats.txt > /storage/home/users/pjt6/plas/Pete/ProteinSeq/busco_no_gaps_RBBH_orthofinder_DN_DS.txt

###############################################################################################################
# sub

cd /storage/home/users/pjt6/plas/Pete/ProteinSeq/sub
rm *fasta_*
rm -rf back_translated

filenames=*.fasta



for f in ${filenames}
do
	#echo "Running muscle ${f}"
	cmd="muscle -in ${f} -out ${f}_aligned.fasta" 
	echo ${cmd}
	eval ${cmd}
	wait
	
done
###############################

filenames2=*_aligned.fasta
for file in ${filenames2}
do
	echo "Running muscle ${f}"
	cmd="muscle -in ${file} -out ${file}_refine.fasta -refine" 
	echo ${cmd}
	eval ${cmd}
	wait
done
mkdir back_translated

python /storage/home/users/pjt6/plas/Pete/ProteinSeq/Align_back_translate.py

#####################
cd back_translated/
filenames3=*_refine.fasta
for file in ${filenames3}
do
	echo "Running trimal ${file}"
	cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal  
    -in ${file}  
    -out ${file}.phy
    -phylip 
    -gappyout" 
	echo ${cmd}
	#eval ${cmd}
	wait
done



cd back_translated/
filenames3=*translated.fasta


filenames3=*translated.fasta
for file in ${filenames3}
do
	echo "Running trimal ${file}"
	cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal   
    -in ${file}  
    -out ${file}.phy
    -phylip 
    -nogaps" 
	echo ${cmd}
	eval ${cmd}
	wait
done

mkdir phy_files

mv *.phy ./phy_files/

cd phy_files


filenames=*.phy

# phyml
export PATH=/storage/home/users/pjt6/phyml-20140723/src/:$PATH

#codonphyml
export PATH=/storage/home/users/pjt6/codonPHYML_dev/src/:$PATH



## nucleotide version
mkdir files_done
for f in ${filenames}
do
	echo "Running codonphyml ${f}"
	cmd="codonphyml -i ${f} -m GY --fmodel F3X4 -t e -f empirical -w g -a e" #--optBrent 3
	echo ${cmd}
	eval ${cmd}
	wait
	cmd2="mv ${f} ./files_done"
	echo ${cmd2}
	eval ${cmd2}
done

grep "Probability: o3=" -H *_stats.txt > ~/newton/comparative_genomics/all_nems/sub_no_gaps_RBBH_orthofinder_DN_DS.txt

###############################################################################################
# gros

cd /storage/home/users/pjt6/plas/Pete/ProteinSeq/gros/
rm *fasta_*
rm -rf back_translated

filenames=*.fasta



for f in ${filenames}
do
	#echo "Running muscle ${f}"
	cmd="muscle -in ${f} -out ${f}_aligned.fasta" 
	echo ${cmd}
	eval ${cmd}
	wait
	
done
###############################

filenames2=*_aligned.fasta
for file in ${filenames2}
do
	echo "Running muscle ${f}"
	cmd="muscle -in ${file} -out ${file}_refine.fasta -refine" 
	echo ${cmd}
	eval ${cmd}
	wait
done
mkdir back_translated

python /storage/home/users/pjt6/plas/Pete/ProteinSeq/Align_back_translate.py

#####################
cd back_translated/
filenames3=*_refine.fasta
for file in ${filenames3}
do
	echo "Running trimal ${file}"
	cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal  
    -in ${file}  
    -out ${file}.phy
    -phylip 
    -gappyout" 
	echo ${cmd}
	#eval ${cmd}
	wait
done



cd back_translated/
filenames3=*translated.fasta




filenames3=*translated.fasta
for file in ${filenames3}
do
	echo "Running trimal ${file}"
	cmd="/storage/home/users/pjt6/trimal-1.4.1/source/trimal   
    -in ${file}  
    -out ${file}.phy
    -phylip 
    -nogaps" 
	echo ${cmd}
	eval ${cmd}
	wait
done

mkdir phy_files

mv *.phy ./phy_files/

cd phy_files


filenames=*.phy

# phyml
export PATH=/storage/home/users/pjt6/phyml-20140723/src/:$PATH

#codonphyml
export PATH=/storage/home/users/pjt6/codonPHYML_dev/src/:$PATH



## nucleotide version
mkdir files_done
for f in ${filenames}
do
	echo "Running codonphyml ${f}"
	cmd="codonphyml -i ${f} -m GY --fmodel F3X4 -t e -f empirical -w g -a e" #--optBrent 3
	echo ${cmd}
	eval ${cmd}
	wait
	cmd2="mv ${f} ./files_done"
	echo ${cmd2}
	eval ${cmd2}
done
grep "Probability: o3=" -H *_stats.txt > ~/newton/comparative_genomics/all_nems/gros_no_gaps_RBBH_orthofinder_DN_DS.txt










