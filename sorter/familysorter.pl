use strict;
use Cwd;
use File::Spec;
use File::Basename;
chdir dirname(__FILE__);
#open STDOUT, ">filelist.txt" or die "can't open file filelist.txt:$!";
my $data;my $class;
my %hash=("F16"=>"","Cellulosimicrobium funkei"=>"","Isoptericola dokdonensis"=>"","Oerskovia turbata"=>"","Oerskovia enterophila"=>"","Isoptericola variabilis"=>"","Xylanimonas cellulosilytica"=>"","Cellulosimicrobium cellulans J36"=>"","Cellulomonas fimi"=>"","Cellulomonas flavigena"=>"","Promicromonospora sukumoe"=>"","Actinotalea fermentans"=>"","Demequina aestuarii"=>"");

open(RT,"out.txt") or die $!;
open(RO,">sort.txt") or die $!;my $key;    #Demequina aestuarii
while(<RT>)
{if ($_=~ /M768\_(\d+)/){
$class="M768_"."$1";
#print "!!!!!!!!!!!";
#print RO "\n\n$class\n";
}
if($_=~ /Cellulosimicrobium cellulans F1/)
{$hash{"F16"}=$hash{"F16"}."  ".$class;
	}

	if($_=~ /Cellulosimicrobium funkei/)
{$hash{"Cellulosimicrobium funkei"}=$hash{"Cellulosimicrobium funkei"}."  ".$class;
	}if($_=~ /Isoptericola dokdonensis/)
{$hash{"Isoptericola dokdonensis"}=$hash{"Isoptericola dokdonensis"}."  ".$class;
	}if($_=~ /Oerskovia turbata/)
{$hash{"Oerskovia turbata"}=$hash{"Oerskovia turbata"}."  ".$class;
	}if($_=~ /erskovia enterophila/)
{$hash{"Oerskovia enterophila"}=$hash{"Oerskovia enterophila"}."  ".$class;
	}if($_=~ /Isoptericola variabilis/)
{$hash{"Isoptericola variabilis"}=$hash{"Isoptericola variabilis"}."  ".$class;
	}if($_=~ /Xylanimonas cellulosilytica/)
{$hash{"Xylanimonas cellulosilytica"}=$hash{"Xylanimonas cellulosilytica"}."  ".$class;
	}if($_=~ /Cellulosimicrobium cellulans J36/)
{$hash{"Cellulosimicrobium cellulans J36"}=$hash{"Cellulosimicrobium cellulans J36"}."  ".$class;
	}if($_=~ /Cellulomonas fimi/)
{$hash{"Cellulomonas fimi"}=$hash{"Cellulomonas fimi"}."  ".$class;
	}if($_=~ /Cellulomonas flavigena/)
{$hash{"Cellulomonas flavigena"}=$hash{"Cellulomonas flavigena"}."  ".$class;
	}if($_=~ /Promicromonospora sukumoe/)
{$hash{"Promicromonospora sukumoe"}=$hash{"Promicromonospora sukumoe"}."  ".$class;
	}if($_=~ /Actinotalea fermentans/)
{$hash{"Actinotalea fermentans"}=$hash{"Actinotalea fermentans"}."  ".$class;
	}if($_=~ /Demequina aestuarii/)
{$hash{"Demequina aestuarii"}=$hash{"Demequina aestuarii"}."  ".$class;
	}

	}
	print RO "Ran's Sorter2017 by References\n";
		foreach $key(  sort     keys %hash)
{#print "\n\n";
	print RO "$key => $hash{$key}\n\n";
	}
#print RO %hash;
close (RT);
close (RO);