#!/usr/bin/perl
#use strict;
use Data::Dumper;

$filename=<STDIN>;
chomp $filename;
print "Filename:".$filename."\n";

open(FH, $filename) or die $!;

   $/='>';   $tocan=-1;   
while(<FH>)
{

    $tocan++;
#    chomp;

    my ($id, @ary) =  split /\s+/;
    my $seq = join '', @ary; 
    $highest=0;
    my $ratio = &GC_content($seq);
    if ($ratio >= $highest) {
#        $highest = $ratio;
        $result[$tocan][0] = $id;$result[$tocan][1]= $ratio;
        $seq=~ s/\W//g;$content[$tocan]=$seq;

}
#print join "\n", @result;

sub GC_content {
    my ($seq) = @_;
if ($seq =~ s/([CG])/$1/g !=0){
my $ratio = $seq =~ s/([CG])/$1/g / length($seq) * 100;} else {$ratio="NotNucleotides";}
    return $ratio
}
}
  
 close(FH);

  


print @result;

for(my $i = 0; $i < @result; $i++){
#    if($all_file[$i]=~/$str/g){
chdir "GeneSort";
open(FH, ">$result[$i][0]--$result[$i][1].txt") or die $!;

print FH ">$result[$i][0]\n";
 print FH $content[$i];
  
 close(FH);
        print "Seqid:$result[$i][0]\nGC  Content is:$result[$i][1]\nContent is:$content[$i].\n\n\n\n"
#    }
}

=POD


 
 
 
=CUT



