#!/usr/bin/env perl

use strict;
use warnings;
system('bash shutdown.sh');
system("ssh mike\@notebook.local sudo shutdown -h now");
system("sudo shutdown -h now");
