#!/usr/bin/perl -w

#use strict;

my %symbolsList = ();
my $stateCount = 0;

if ($#ARGV != 0) { die "USAGE: str2fst <symbol_file>\n"; }

my $symfile = $ARGV[0];
open(SYMS,$symfile) or die "Could not open symbols file.\n";
while(<SYMS>)
{
 chomp;
 my @line1 = split /\t/;
 my $symbol = shift @line1;
 $symbolsList{$symbol} = 1;
}
close(SYMS) or die "Couldn't close symbols file properly.\n";

while(<STDIN>)
{
 chomp;
 my @words = split / /;
 for(my $w = 0; $w <= $#words; $w++)
 {
  print "$stateCount\t";
  $stateCount++;
  print "$stateCount\t";
  my $word=$words[$w];
  if (exists($symbolsList{$word})) 
  {
   print "$word\t$word\n";
  } 
  else 
  {
   print "<unk>\t<unk>\n";
  }
 }
 print "$stateCount\n";
}
