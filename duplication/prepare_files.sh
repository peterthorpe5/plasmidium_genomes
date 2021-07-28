# prepare gff as so:

 python re_format_GFF.py --gff sks048.gff3 -o sks048_gene_mc.gff3 -s sl -m yes

etc ... for the others. 

>>> fasta =  """Cultured_proteins.fasta  PublishedReference_proteins.fasta  sks047_proteins.fasta  sks048_proteins.fasta""".split()
>>> 
>>> 
>>> for i in fasta:
	print("diamond makedb --in %s -d %s" % (i, i.split("_proteins.fasta")))

	
diamond makedb --in Cultured_proteins.fasta -d ['Cultured', '']
diamond makedb --in PublishedReference_proteins.fasta -d ['PublishedReference', '']
diamond makedb --in sks047_proteins.fasta -d ['sks047', '']
diamond makedb --in sks048_proteins.fasta -d ['sks048', '']
>>> for i in fasta:
	print("diamond makedb --in %s -d %s" % (i, i.split("_proteins.fasta")[0]))

	
diamond makedb --in Cultured_proteins.fasta -d Cultured
diamond makedb --in PublishedReference_proteins.fasta -d PublishedReference
diamond makedb --in sks047_proteins.fasta -d sks047
diamond makedb --in sks048_proteins.fasta -d sks048
>>> for i in fasta:
	print("diamond blastp -p 16 --outfmt 6 --sensitive -e 1e-5 -v -q %s -d %s -o %s.tab" % (i, i.split("_proteins.fasta")[0], i.split("_proteins.fasta")[0]))

	
diamond blastp -p 16 --outfmt 6 --sensitive -e 1e-5 -v -q Cultured_proteins.fasta -d Cultured -o Cultured.tab
diamond blastp -p 16 --outfmt 6 --sensitive -e 1e-5 -v -q PublishedReference_proteins.fasta -d PublishedReference -o PublishedReference.tab
diamond blastp -p 16 --outfmt 6 --sensitive -e 1e-5 -v -q sks047_proteins.fasta -d sks047 -o sks047.tab
diamond blastp -p 16 --outfmt 6 --sensitive -e 1e-5 -v -q sks048_proteins.fasta -d sks048 -o sks048.tab


# run mcscanx

/storage/home/users/pjt6/shelf_apps/apps/MCScanX/duplicate_gene_classifier /storage/home/users/pjt6/plas/Pete/gff/cl_cl/cl_cl





