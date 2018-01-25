#cd '/root/Desktop/Bioinformatics_Experiment/Experiment03/Step04_Annotation/blast' 

echo "TBLASTn System"
read -p "submit mode:1 for pair-wise_mode,2 for proteins_mode(GeneSort Directory)    " mod
if test $mod -eq "1";
then
echo "Pair-wise alignment(Using TBLASTn)"
echo "Changed the source code of this script if another BLAST tool is needed!!"
read -p "Submit Queryseqname:"  val
echo "Queryseqname Input:$val"
for file in ./*.nin
do
    if test -f $file
    then
filename=${file##*/}  
cutfilename=${filename%%.*} 
 tblastn -query $val.fna -db $cutfilename -out ./outcome/$cutfilename.out -evalue 0.001
#        TBLASTn the query input with all the databases in the db directory 
    fi 
    
done


else
for query in ./GeneSort/*.txt
do
cutqueryname=${query##*/}  
 mkdir ./outcome/$cutqueryname
for file in ./db/*.nin
do
    if test -f $file
    then
   
filename=${file##*/}  
cutfilename=${filename%%.*} 
 tblastn -query ./GeneSort/$cutqueryname -db ./db/$cutfilename -out ./outcome/$cutqueryname/$cutfilename.out -evalue 0.001
#        TBLASTn all the proteins sequences recorded in a Fasta format text file with all the databases in the db directory. The results are going to be store in the directory with the names same as the sequence information tag in the query text file.
    fi  
    
done
    done  



fi