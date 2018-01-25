# BLAST pipeline for genes' and genomes' alignment
Ran Duan / March 17th 2017 ;)
Email: 413677671@qq.com


Information
===================
The pipeline was initially designed to tackle the issue of automatically doing genes-to-genomes and genomes-to-genoems alignment using BLAST(The Basic Local Alignment Search Tool). It is consisted of three main fuctions: building up the testing samples genomes database in the directory db, runing BLASTing automatically to do pair-wise alignment of the query sequences(proteins or genomes)and the subject sequences- the database and sorting the overall outcome by filtering the coverage and identity values of the BLAST results.

The latest build has been tested in a genomics project, but we're still trying to keep stuffs as simple as possible for users(e.g. you can input some option in command mode in some scripts). Still it may requried to be modified 
manually in source codes to fit in different sorts of works in hand.If you're
having any trouble with building the environment after following the instructions 
below please contact the email above for help.


Environment Settings
===================

The program is tested to work properly under CentOS 7 and Perl 5.26.1. 

Install BLAST first before using the pipeline. The updated BLAST toolkit local version can be downloaded from NCBI website(https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download).

The Linux environment should be set properly to run at the main path of BLAST bin. 
It can be simply done by using command for example:

vim /etc/profile    
export CLASSPATH=./$BLAST_PATH$/bin

Otherwise, absolute path should be repalced in the source code of TBLASTn.sh. Also, you should always pay attention to capital letters in Linux command.




Scripts Function
================================================

（1） dbformat.sh - automatically build databse based on the sequences in Fasta format

（2） TBLASTn.sh - 
Mode 1:  TBLASTn the query input with all the databases in the db directory 
Mode 2:  TBLASTn all the proteins sequences recorded in a Fasta format text file with all the databases in the db directory. The results are going to be stored in the directory with the names same as the sequence information tag in the query text file.

（3） GeneSorter.pl - merge and split the assembled proteins sequences fasta text into single ones. If the sequenced is nucleotides the sequence information will be appended the GC content ratio, otherwise it would be referenced as NonNucleotides.

（4）outcomesort.pl - merge and assemble the important part of the BLAST results.
The important information will be kept and the query cover will be calculated using the formula: HitIdentity/ HitCover

（5）familysort.pl - sort the outcome in the order of subject sequences e.g. find the hits scored the most and assemble the information of all the hits related to a specific subjkect sequence into one outcome.


Commands Example
=================================


1) Pair-wise genomes-to-genomes alignment

Place the target genomes in the root path, then execute dbformat.sh to build the databases for TBLASTn£¨if error shows permission denied then execute command chmod 777 $dbformat.sh_FILE_PATH$ to authorized administration range).
Run TBLASTn.sh and select Mode1(For more information please check the incode comments)£¬
The operating path should be relocated to the db directory and then a query sequence in the db directory can be selected for the alignment to all the other databses existed in the db directory.


2) HypothesisProteins-to-genomes alignment
Execute GeneSorter.pl to disassemble the hyphosysis proteins into individualed ones.
Run TBLASTn.sh and select Mode2, the alignment results are stored in ths outcome directory with a directory of their names.
Execute outcomesort.pl  tto take out the redundence, keep the highest-scored hits, and eventually sorted with queryid which is shown in out.txt. 
Run familysort.pl to sort the outcome in subject databases.	

And, lastly, if you want a to use the pipeline for a specific project, please browse the in-code comments for more detailed usage.


References
===================

Altschul, S.F., Gish, W., Miller, W., Myers, E.W. & Lipman, D.J. (1990) "Basic local alignment search tool." J. Mol. Biol. 215:403-410. PubMed

Wall, Larry. "The Perl programming language." (1994).

>>>>>>> 672fa71f49784c1a27415353512b81f8a7cd0ba1
