#!/usr/bin/env perl

use strict;
use warnings;

my $current_directory = '/home/mike/Documents/spyware';

system("mplayer $current_directory/sounds/shutdown.wav ");
system("ssh mike\@notebook.local sudo shutdown -h now");
system("sudo shutdown -h now");

my $current_directory = '/home/mike/Documents/spyware';

system("mplayer $current_directory/sounds/shutdown.wav ");
system("ssh mike\@notebook.local sudo shutdown -h now");
system("sudo shutdown -h now");
