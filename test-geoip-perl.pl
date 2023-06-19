#!/usr/bin/perl
use strict;
use POSIX;
use Geo::IP;

my $geo;
my $ip;
my $gi = Geo::IP->new(GEOIP_STANDARD);

$ip = '212.102.38.1';
$geo = $gi->country_code_by_addr( $ip );
printf "%s = %s (should display CZ, not IT)\n", $ip, $geo;

$ip = '195.181.160.1';
$geo = $gi->country_code_by_addr( $ip );
printf "%s = %s (should display CZ, not GB)\n", $ip, $geo;

$ip = '185.25.95.1';
$geo = $gi->country_code_by_addr( $ip );
printf "%s = %s (should display CZ, not CH)\n", $ip, $geo;

$ip = '45.146.164.152';
$geo = $gi->country_code_by_addr( $ip );
printf "%s = %s (should display RU, not GB)\n", $ip, $geo;

$ip = '45.155.205.43';
$geo = $gi->country_code_by_addr( $ip );
printf "%s = %s (should display RU, not DE)\n", $ip, $geo;

$ip = '77.104.244.65';
$geo = $gi->country_code_by_addr( $ip );
printf "%s = %s (should display CZ, not DE)\n", $ip, $geo;

$ip = '217.170.207.111';
$geo = $gi->country_code_by_addr( $ip );
printf "%s = %s (should display NO, not US?)\n", $ip, $geo;

my $gi6 = Geo::IP->open('/usr/share/GeoIP/GeoIPv6.dat');
if ( $gi6) {
  $ip = '2a01:9421:3003:300::141';
  $geo = $gi6->country_code_by_addr_v6($ip);
  printf "%s = %s (should display CZ)\n", $ip, $geo;

  $ip = '2001:4de0:ac19::0001:000b:001b';
  $geo = $gi6->country_code_by_addr_v6($ip);
  printf "%s = %s (should display NL)\n", $ip, $geo;

  $ip = '2a00:1450:4014:80c::200e';
  $geo = $gi6->country_code_by_addr_v6($ip);
  printf "%s = %s (should display IE)\n", $ip, $geo;
}
