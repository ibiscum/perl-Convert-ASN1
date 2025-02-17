use strict;
use warnings;



use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Convert between perl data structures and ASN.1 encoded packets",
  "AUTHOR" => "Graham Barr <gbarr\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Convert-ASN1",
  "LICENSE" => "perl",
  "NAME" => "Convert::ASN1",
  "PREREQ_PM" => {},
  "TEST_REQUIRES" => {
    "Math::BigInt" => "1.997",
    "Test::More" => "0.90"
  },
  "VERSION" => "0.33",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Math::BigInt" => "1.997",
  "Test::More" => "0.90"
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
