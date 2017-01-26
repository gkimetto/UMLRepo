
# declare the unit testing module and declare the
# number of tests you want to run
use Test::Simple tests => 4;
# Add unit tests below:
ok(1+1 == 2);
ok(1+1 < 3);
ok(4+1 <= 5);
ok(6+1 == 7);
