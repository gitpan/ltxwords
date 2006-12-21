# Makefile.PL -- Makefile for ltxwords
# Author          : Johan Vromans
# Created On      : Sat Dec 16 00:04:34 2006
# Last Modified By: Johan Vromans
# Last Modified On: Thu Dec 21 15:13:06 2006
# Update Count    : 10
# Status          : Released

use ExtUtils::MakeMaker;

my @scripts = qw (ltxwords);
my $usrbin = "/usr/bin";
my $installscript = $Config{installscript};

print STDERR <<EOD unless $installscript eq $usrbin;

WARNING: This Makefile will install user accessible scripts.
The location for these scripts is $installscript.
You may consider to pass INSTALLSCRIPT=$usrbin (or some other
convenient location) to "make install".
EOD

print STDERR <<EOD;

IMPORTANT: For each target language, the corresponding module
Lingua::<language>::Numbers must be installed.

EOD

WriteMakefile
  (
   NAME         => "$scripts[0]",
   VERSION_FROM => "script/$scripts[0]",
   ($] >= 5.005) ?
   ( AUTHOR	=> 'Johan Vromans (jvromans@squirrel.nl)',
     ABSTRACT	=> 'Generate Words macro for LaTeX' ) : (),
   PREREQ_PM	=> { 'Getopt::Long' => 2.1,
		     'Lingua::EN::Numbers' => 0,
		     'Lingua::NL::Numbers::GroeneBoekje' => 0,
		   },
   EXE_FILES    => [ map { "script/$_" } @scripts ],
 );
