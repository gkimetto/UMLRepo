#!/usr/bin/perl


#Week 2 Study Perl

use strict;
use warnings;


my @months;
my %calendar_months;

print "Example Data Structures: ";

@months =("January","Febuary","March","April","May","June");

foreach my $months(@months){
	print "\n";
	print $months;

}

print "\nHash Data Structutre";

%calendar_months=("January" => 1, "Febuary" => 2, "March" => 3, "April" => 4, "May" => 5, "June" => 6);


foreach my $calendar_months(%calendar_months)
{
	print " \n";
	print $calendar_months;
}

@months=keys %calendar_months;

foreach my $months(@months)
{
	print $months, " \n";
}


