#!/usr/bin/perl
# melvin.alvarado
use strict;
use warnings;

my $wall;
my $output = "$ENV{HOME}/.rand_wall";

my $html = "$ENV{HOME}/.fluxbox/auto/c9541b08";
system("wget https://clients3.google.com/cast/chromecast/home/v/c9541b08 -O $html");

open(HTML,$html) or die "Cannot open file $html\n";
while(<HTML>){
    my $l = $_;
    if($l=~/PIN/){
        my @data = split(/https:/,$l);
        my $cnt=0;
        foreach(@data){
            $wall = $_;
            print "=> $cnt $wall\n\n";
            ++$cnt;
            if( $wall =~ /lh(\d+).googleusercontent.com..([a-z0-9-_]+)..u003ds1280-w1280-h720-p-k-no-nd-mv/i ){
                print ">> $2\n";
                $wall = "https://lh$1.googleusercontent.com/$2=s2560-w2560-h1440-p-k-no-nd-mv";
                system("wget $wall -O $output");
                system("feh --bg-scale $output");
                last;
            };
            if( $wall =~ /lh(\d+).googleusercontent.com..([a-z0-9-_]+)..u003ds1920-w1920-h1080-p-k-no-nd-mv/i ){
                print ">> $2\n";
                $wall = "https://lh$1.googleusercontent.com/$2=s2560-w2560-h1440-p-k-no-nd-mv";
                system("wget $wall -O $output");
                system("feh --bg-scale $output");
                last;
            };
        }
    };
};
close(HTML);
