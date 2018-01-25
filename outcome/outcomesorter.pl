use strict;
use Cwd;
use File::Spec;
use File::Basename;

#open STDOUT, ">filelist.txt" or die "can't open file filelist.txt:$!";
my $data;
my $have=0;

chdir dirname(__FILE__);
my $cwd = getcwd;
#print "$cwd.\n";
my @files = <*>;
open(RT,">out.txt") or die $!;
$data= "Statistics of BLASTing    

Sequences producing significant alignments:                       Score     E
                                                                  (Bits)  Value";
my $file;
foreach $file(@files)
{chdir dirname(__FILE__);
	my $path = File::Spec->catfile( $cwd, $file );
#	print $path;
	&filelist($path);
#	print $file."\n";
}

sub filelist
{
	my $path =pop(@_);
#	print $path;
	my $file_name = basename $path;
#	print"$path";

		my $tem;
	if(-d $file_name)#
	{$data=$data."

$file_name

";
	#	print "$path\n";

		chdir $path or die "can't chdir $path:$!";
		my $cwd = dirname(__FILE__);
		my @files = <*>;
		my $file;
		my $count = 0;
		foreach $file(@files)
		{
			$count++;
			my $path = File::Spec->catfile( $cwd, $file );
			&filelist($path);
		}#print "@files\n";
		if ($count == @files)#
		{
			my $dir_name = dirname $path; 
#			print $cwd."\n"."\n"."\n"."\n";

			chdir ".." or die "can't chdir $dir_name\..:$!";
		}
	}
	else
	{#print $cwd."\n";
		if($file_name ne "outcomesorter.pl"){#print "!!!!!!!!!";
open(FH,"$file_name") or die "Can't open query files!!  ";my $lasty=0;my $lastx=0;my $have=0;my $lengthtocan=0;my $lengthlong=0;my $coverlong=0;my $percentage=0;
#		print <FH>;
		foreach(<FH>)
		{ #my $text="Sequences producing significant alignments:";
			if (($_=~ m/Length/g)&&($lengthtocan eq 0)){$lengthlong=$_;$lengthlong=~ s/\D+//;
			$lengthtocan=1;
#			print "lengthlong  $lengthlong\n";
		}
			if ($lasty !=0)
			{$lasty ++;
				if ($lasty ==3)
				{$tem=$tem.$_;    
					}
				}
			if ($_=~ m/Sequences producing significant alignments:/g){$data=    $data."\n";
			$lasty=1;
			
#			print $_;
#		last;
		}
		if ($lastx !=0)
			{$lastx ++;
				if (($lastx <=6)&&($lastx>=4))
				{$tem=$tem.$_;  	if ($_=~ /\/(\d+)\s/){$coverlong=$_;$coverlong=$1;
			$percentage=$coverlong/$lengthlong;
			$tem=$tem."  Coverage  =  $percentage    "."  Length  =  $lengthlong    ";
			if($percentage>=0.4)
			{$data=$data.$tem;
				}$tem="";
#			print "coverlong  "."$coverlong\n$percentage\n";
      
		}  
					}
				}
			if (($_=~ m/>/g)&&($have eq 0)){$have =1;
			$lastx=1;
			
#			print $_;
#		last;
		}
			
			}close(FH);
#		print "$path\n";
}}
	}
  print RT $data;    	
	close (RT);