#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use POSIX qw(strftime);

my $date=strftime "%y%m%d", localtime;#

my $log = $date."_codeadvent_1_log.txt";
my $outt = $date."_codeadvent_1.txt";
my $file1="input.txt";
#my $file2="input.txt";

open(my $OUTLOG, '>', $log) or die "Cannot open file '$log' $!";
open(my $OUT, '>', $outt) or die "Cannot open file '$outt' $!";
open my $IN1, '<', $file1 or die "Cannot not open $file1: $!";
chomp(my @lines = <$IN1>);
my $arrsize=@lines;

foreach(@lines){
	$_ =~ s/\R\z//;
	my $a=$_;
	for(my $i=0; $i< $arrsize; $i++){
		my $b=$lines[$i];
		for(my $j=0; $j< $arrsize; $j++){
			my $c=$lines[$j];
			if($a+$b+$c==2020){my $sum=$a+$b+$c; my $multi=$a*$b*$c; print $a." + ".$b." + ".$c." = ".$sum."!\nMulti = ".$multi."!\n";}
		}
	}
}
close $IN1;
