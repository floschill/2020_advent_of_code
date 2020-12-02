#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use POSIX qw(strftime);

my $date=strftime "%y%m%d", localtime;#

my $log = $date."_codeadvent_2_2_log.txt";
my $outt = $date."_codeadvent_2_2.txt";
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
	my @tmp3=split(//,$tmp[2]);
	if($tmp[1] eq $tmp3[$tmp2[0]-1] || $tmp[1] eq $tmp3[$tmp2[1]-1]){
		if($tmp[1] eq $tmp3[$tmp2[0]-1] && $tmp[1] eq $tmp3[$tmp2[1]-1]){
			next;
		}
		$v++
	}
}
close $IN1;
print "The total number of valid passwords is: ".$v."!\n";
