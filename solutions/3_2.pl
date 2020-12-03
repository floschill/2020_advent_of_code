#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use POSIX qw(strftime);

my $date=strftime "%y%m%d", localtime;#

my $log = $date."_codeadvent_3_2_log.txt";
my $outt = $date."_codeadvent_3_2.txt";
my $file1="input.txt";
#my $file2="input.txt";

open(my $OUTLOG, '>', $log) or die "Cannot open file '$log' $!";
open(my $OUT, '>', $outt) or die "Cannot open file '$outt' $!";
open my $IN1, '<', $file1 or die "Cannot not open $file1: $!";
chomp(my @lines = <$IN1>);
close $IN1;
my $v=0;#1
my $w=0;#3
my $x=0;#5
my $y=0;#7
my $i=0;#1
my $j=0;#3
my $k=0;#5
my $l=0;#7
foreach(@lines){
	$_ =~ s/\R\z//;
	my @tmp=split(//,$_);
	if($tmp[$i] eq "#"){$v++;}
	$i++;
	if($i>30){$i=$i-31;}
	if($tmp[$j] eq "#"){$w++;}
	$j=$j+3;
	if($j>30){$j=$j-31;}
	if($tmp[$k] eq "#"){$x++;}
	$k=$k+5;
	if($k>30){$k=$k-31;}
	if($tmp[$l] eq "#"){$y++;}
	$l=$l+7;
	if($l>30){$l=$l-31;}
}
open $IN1, '<', $file1 or die "Cannot not open $file1: $!";
chomp(@lines = <$IN1>);
close $IN1;
my $z=0;
my $m=0;
for(my $a=0;$a<=322;$a=$a+2){
	$lines[$a] =~ s/\R\z//;
	my @tmp=split(//,$lines[$a]);
	if($tmp[$m] eq "#"){$z++;}
	$m++;
	if($m>30){$m=$m-31;}
}

my $multi=$v*$w*$x*$y*$z;
print "$v\t$w\t$x\t$y\t$z\n";
print "The total number of trees ecountered is: ".$multi."!\n";
