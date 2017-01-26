#!/usr/bin/perl


# Program Name : Gilbert_Kimetto_Assignment_1
# Author’s Name : Gilbert Kimetto  
# Purpose of the program:
#                      A Perl program that reads in an arbitrary number of strings from the command line and
#                      displays them sorted alphabetically.
# How invoke the the program -
#           
#           perl gkimetto_mod_ip_mamager.pl
#
# Example :
#           perl gkimetto_mod_ip_mamager.pl 

# #an IP address tracking tool and network status tool. Basically it assumes you have a contiguous set of IP addresses available to you in the same subnet.

# It will check the availability of an ip address by doing a nslookup and system ping

# It will track the claimed IP addressed in an address book list of "server name and IP address". It will look something like below:

#      IP Address Manager
#      =================== 

# [ 1.] Enter Network IP Details
# [ 2.] List all available IP Addresses
# [ 3.] Enter/Claim and IP Address
# [ 4.] Check IP Address availability (nslookup, ping)
# [ 5.] Release IP address
# [ 6.] Quit    
use strict;
use warnings;

use Data::Validate::IP qw (is_ipv4 is_ipv6);
use Net::Ping;

use Switch;

my $ip_mgr_choice;

##Network scalar variables:

my $subnet_mask;
my $gateway;
my $lower_ip_range;
my $upper_ip_range;
my $ip_to_add;


while (1)
{
print "\n		IP Address Manager";      
print "\n		==================="; 
print "\n";
print "\n [ 1.] Enter Network IP Details";
print "\n [ 2.] List all available IP Addresses";
print "\n [ 3.] Enter/Claim and IP Address";
print "\n [ 4.] Check IP Address availability (nslookup, ping)";
print "\n [ 5.] Release IP address";
print "\n [ 6.] Quit";
print "\n";
print "\n Please make a selection [1 - 6. Press 6 To Quit.]  ";


chomp($ip_mgr_choice=<STDIN>);
#chomp($ip_mgr_choice);

#Get users response and call the appropriate Function
switch ($ip_mgr_choice){

	case 1
	{
		&enter_ip_network_details;

	}
	case 2
	{
		&print_network_details;

	}
	case 3
	{
		print "Please enter an IPv4 address to add to the Database \n";
		&claim_ip_addess;

	}
	case 4
	{
		
		&claim_ip_addess;

	}
	case 5
	{

	}
	case 6
	{
		$ip_mgr_choice=0;
	}
	else {
		print "You made an invalid selection : Try again. \n"
	}
}
}
#Subroutine to get as much information on the network details.
#If the file does not exist create a new one

sub enter_ip_network_details{
	#Check for file with existing IPs if none create NEW one.

	print "Please enter the following : \n";
	print "Subnet Mask:\n";
	chomp($subnet_mask=<STDIN>);
    
	&check_valid_ip_address($subnet_mask);


	print "Gateway :\n";
	chomp($gateway=<STDIN>);
	
	&check_valid_ip_address($gateway);

	print "Range of IPs to manage in this Subnet :\n";
	print "\n";
	print "From IP :\n";
	chomp($lower_ip_range=<STDIN>);
	
	&check_valid_ip_address($lower_ip_range);

	print "To IP    :\n";
	chomp($upper_ip_range=<STDIN>);
	
	&check_valid_ip_address($upper_ip_range);


}

#Subroutine to List all available IP Addresses already in the file

sub list_all_free_ips{
	print "Available IPs :";

}

#Subroutine to Enter/Claim an individual IP Address

sub claim_ip_addess
{
	print "Please enter an ip address to Add :";
	chomp($ip_to_add=<STDIN>);
	
#Verify that the address is valid if invalid program exits

	&check_valid_ip_address($ip_to_add);

	my $ping_test = Net::Ping->new();

	my ($ret, $duraation, $ip_add)=$ping_test->ping($ip_to_add);

	print $ret;
	print $duraation;
	print $ip_add;


	

}
#Read and IP address, verify the format is correct
#Check that it is not already in use



# Subroutine to Check IP Address availability (nslookup, ping)
# Subroutine to Release IP address and make it available for use again.


#Subrouting to verify that the format is correct

sub check_valid_ip_address
{
	my $ip_to_check = $_[0];
	#my $ip_to_check = $subnet_mask;
	#print $ip_to_check;
	if (is_ipv4($ip_to_check))
	{
		;
	}
	
	else 
	{
		print "This is not a Valid IP Address. Please try again. \n";
		exit;
	}
	
#Print Network Details:

sub print_network_details{

	print "\n   NETWORK SUMMARY: \n";
	print "\n   ================ \n";
	print "\n   Netmask         : ", $subnet_mask;
	print "\n   Gateway          : ", $gateway," \n";
	print "\n   IP Address Range : ", $lower_ip_range, " - ", $upper_ip_range, "\n";
	print "\n   Press any key to continue";


}


}


