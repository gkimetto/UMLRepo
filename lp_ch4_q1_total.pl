#!/usr/bin/perl

use strict;
use warnings;


my @fred= qw {1 3 5 7 9};
my $fred_total = total(@fred);
print "The total of \@fred is $fred_total.\n";

print "Enter some numbers on separate lines :";
my $user_total = total(<STDIN>);
print "The total of those number numbers is $user_total. \n";

#subroutine total returns the total of a list of numbers

sub total 
{
	my $current_total;
	foreach (@_){
		 $current_total+= $_;
	}

	$current_total;
}