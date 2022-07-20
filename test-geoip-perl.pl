#!/usr/bin/perl
use strict;
use POSIX;
use Geo::IP;

my $geo;
my $ip;
my $gi = Geo::IP->new(GEOIP_STANDARD);

$ip = '212.102.38.1';
$geo = $gi->country_code_by_addr( $ip );
printf "%s =  %s (should display CZ, not IT)\n", $ip, $geo;

$ip = '195.181.160.1';
$geo = $gi->country_code_by_addr( $ip );
printf "%s =  %s (should display CZ, not GB)\n", $ip, $geo;

$ip = '185.25.95.1';
$geo = $gi->country_code_by_addr( $ip );
printf "%s =  %s (should display CZ, not CH)\n", $ip, $geo;
