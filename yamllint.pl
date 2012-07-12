#!/usr/bin/perl
#
# Nikhil Mulley
#
# $HeadURL$
# $Rev:$
# Check the syntax for .yaml files
# supports multiple yaml files
use strict;
use warnings;
se YAML qw'freeze thaw Bless LoadFile';
use Data::Dumper;
use Getopt::Std;
our ($opt_d);
getopts('d');
for my $file (@ARGV) {
    my $buf = ();
    print "INFO| Checking $file ... \n" if $opt_d;
    eval {
        local $SIG{'__DIE__'};
       $buf = LoadFile($file);
       print "INFO| $file: OK \n";
    };
    print STDERR "ERROR| $file: NOT OK \n" if $@;
    print STDERR "ERROR| $file : $@ \n" if $@;
    print STDERR "VERBOSE| $file \n", Data::Dumper->Dumper($buf) , "\n" if $opt_d;
}
