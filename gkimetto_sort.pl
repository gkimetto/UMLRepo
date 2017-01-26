#!/usr/bin/perl


# Program Name : Gilbert_Kimetto_Assignment_1
# Author’s Name : Gilbert Kimetto  
# Purpose of the program:
#                      A Perl program that reads in an arbitrary number of strings from the command line and
#                      displays them sorted alphabetically.
# How invoke the the program -
#           
#           perl Gilbert_Kimetto_Assignment_1 argument1 argument1 argument1 argument1 	
#
# Example :
#           perl Gilbert_Kimetto_Assignment_1 server user_name password file_name size
use strict;
use warnings;





print "Gilbert Kimetto \n";
print "Assignment 1 : \n";


my @line_arguments=(@ARGV);

my @sorted_arguments;
my @reverse_arguments;

#Check for the number of arguments entered if enough arguments missing show command usage
if ($#line_arguments +1 <=1)
{
	sub_show_usage();
}

else{



	if ((grep { $_ eq "--reverse"} @line_arguments) || (grep { $_ eq "-r"} @line_arguments))

		{
			sub_reverse_arguments(@line_arguments);
		}
	else 
		{
			sub_sort_arguments(@line_arguments);
		}
}


#Method to Show Usage if incorrect arguments are entered
sub sub_show_usage{

	print "\nUsage :\n";
    print " \n";
    print "Invalid command line arguments. Please supply two or more strings to sort. \n";
    print "\n";
    print "           perl gkimetto_sort.pl argument1 argument2 argument3 argument4\n"; 	
    print "\n";
    print "Example :\n";
    print "           perl gkimetto_sort.pl server user_name password file_name size\n";
    print "Options:\n";
	print "		-r or --reverse  To reverse the sort order of the arguments.";
    print "\n";
    exit;
		

}
#If correct input entered with more than 1 argument sort 
sub sub_sort_arguments
{
	print "Sorted Arguments (Ascending) [a-z]: \n";
		@sorted_arguments=sort(@line_arguments);
		sub_print_arguments(@sorted_arguments);

		
}
#
#Method to reverse the aplhabetic order the arguments entered -f --r is entered
#        --Will do the same thing if --reverse is entered
sub sub_reverse_arguments
{
	print "Reversed Arguments (Descending) [z-a]: \n";
	@sorted_arguments=sort(@line_arguments);

	@reverse_arguments=reverse(@sorted_arguments);

#Remove the last argument from the reversed list  either "--reverse" or "-r" then display results
#Ideally would prefer to call the print function.

	pop @reverse_arguments;
	foreach my $line_arguments (@reverse_arguments){
        print $line_arguments;
		print " \n";
        
		
	} 
}

#Subroutine called to print the contents of an array sent to it

sub sub_print_arguments
{
foreach my $line_arguments(@sorted_arguments)
	{
		print "$line_arguments";
		print " \n";
	}
}

#Unit Tests:
__END__


