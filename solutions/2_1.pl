#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use POSIX qw(strftime);

my $date=strftime "%y%m%d", localtime;#

my $log = $date."_codeadvent_2_log.txt";
my $outt = $date."_codeadvent_2.txt";
my $file1="input.txt";
#my $file2="input.txt";

open(my $OUTLOG, '>', $log) or die "Cannot open file '$log' $!";
open(my $OUT, '>', $outt) or die "Cannot open file '$outt' $!";
open my $IN1, '<', $file1 or die "Cannot not open $file1: $!";
chomp(my @lines = <$IN1>);
my $v=0;
foreach(@lines){
	$_ =~ s/\R\z//;
	$_ =~ s/://;
	#print "$_\n";
	my @tmp=split(/ /,$_);
	my @tmp2=split(/-/,$tmp[0]);
	my $l=$tmp2[0];my $u=$tmp2[1];my $c=$tmp[1];my $s=$tmp[2];
	my $n=()=$s=~/\Q$c/g;
	if($l<=$n && $u>=$n){$v++}	
}
close $IN1;
print "The total number of valid passwords is: ".$v."!\n";
