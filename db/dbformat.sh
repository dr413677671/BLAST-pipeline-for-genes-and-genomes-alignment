cd `dirname $0`

echo "Please put all the source data for databases under the current operating path. \n be sure that the environment variable was set to the BLAST bin path before running this prograam!!"

for file in ./*
do
    if test -f $file
    then
filename=${file##*/}  
cutfilename=${filename%%.*} 
 makeblastdb -in  $filename -out $cutfilename  -dbtype nucl
#        set databses based on all the sequences in Fasta format in current directory
    fi
    
done
