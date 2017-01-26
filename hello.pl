#!/usr/bin/perl


#!/usr/bin/perl
#Tools of Titans

use strict;
use warnings;



my $curr_max;
my $value_in;
my $maximum;

print "Scratch";

$maximum = &max (2,4,6,17,18,88,2,31);

&count_lines_entered;

sub max
{
  $curr_max= shift @_;
  
foreach (@_)
{
	print " ", $_;
	

	if ($_ > $curr_max)
	{
		$curr_max = $_ ;
		
	}

}

	print "\n Largest no is ...", $curr_max, "\n" ;
}


sub count_lines_entered
{
	print "Enter a line and enter";
	while (defined(<STDIN>)){
		print "Read one line";
		}
	}

