#!/usr/bin/env perl

use strict;
use warnings;
system('mplayer ../sounds/shutdown.wav');
system("ssh mike\@notebook.local sudo shutdown -h now");
system("sudo shutdown -h now");
