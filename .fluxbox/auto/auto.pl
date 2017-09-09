#!/usr/bin/perl
# melvin.alvarado
use strict;
use warnings;

# <a href="http://chromecastbg.alexmeub.com/images/orig_PVK-5085.jpg" target="_blank">
my @wallpapers;

my $html = "index.html";
open(HTML,$html) or die "Cannot open file $html\n";
while(<HTML>){
    my $l = $_;
    if($l=~/a href.*chromecastbg.alexmeub.com\/images\/orig_([0-9a-z.-]+)" target/i){
        print "adding $1\n";
        push(@wallpapers,$1);
    };
};
close(HTML);
my $total = scalar(@wallpapers);
print "Total size: $total\n";
my $sel = int(rand($total));

my $wall = "http://chromecastbg.alexmeub.com/images/orig_".$wallpapers[$sel];
print "--> $wall\n";
system("wget $wall -O $ENV{HOME}/.rand_wall");
system("feh --bg-scale $ENV{HOME}/.rand_wall")
