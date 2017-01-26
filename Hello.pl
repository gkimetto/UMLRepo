#/usr/bin/perl
use strict;
use warnings;

my $my_ip_server;
my @server_list;
my @my_ip_server;
my $server;
my $ip;

print "Associative arrays Example \n ";

my %my_ip_server = ("Lion", "10.124.122.13",
					 "Cat", "10.12.12.3",
					  "Puppy", "12.23.34.45");
					  
	@server_list= keys %my_ip_server;
						
					  
print "Server                     IP ADDRESS                \n";
print "=====================================================\n";					  
					
#foreach my @server(%my_ip_server){
while (($server, $ip) = each (%my_ip_server))
{
	print $server,"                     ", $ip;                      
	print "\n"; 	
}
  
