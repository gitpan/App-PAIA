
use strict;
use warnings;

use 5.010000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Patrons Account Information API command line client",
  "AUTHOR" => "Jakob Vo\x{df}",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-PAIA",
  "EXE_FILES" => [
    "bin/paia"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::PAIA",
  "PREREQ_PM" => {
    "App::Cmd" => "0.322",
    "HTTP::Tiny" => "0.024",
    "IO::Socket::SSL" => "1.56",
    "JSON::PP" => "2.27103",
    "Net::SSLeay" => "1.49",
    "URI" => "1.59"
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "0.24",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "App::Cmd" => "0.322",
  "HTTP::Tiny" => "0.024",
  "IO::Socket::SSL" => "1.56",
  "JSON::PP" => "2.27103",
  "Net::SSLeay" => "1.49",
  "URI" => "1.59"
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



