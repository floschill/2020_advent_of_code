#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use POSIX qw(strftime);

my $date=strftime "%y%m%d", localtime;#

my $log = $date."_codeadvent_3_1_log.txt";
my $outt = $date."_codeadvent_3_1.txt";
my $file1="input.txt";
#my $file2="input.txt";

open(my $OUTLOG, '>', $log) or die "Cannot open file '$log' $!";
open(my $OUT, '>', $outt) or die "Cannot open file '$outt' $!";
open my $IN1, '<', $file1 or die "Cannot not open $file1: $!";
chomp(my @lines = <$IN1>);
my $v=0;my $i=0;
foreach(@lines){
	$_ =~ s/\R\z//;
	print "$_\n";
	my @tmp=split(//,$_);
	if($tmp[$i] eq "#"){$v++;}
	$i=$i+3;
	if($i>30){$i=$i-31;}
}
close $IN1;
print "The total number of trees ecountered is: ".$v."!\n";
