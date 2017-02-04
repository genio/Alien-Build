use Test2::Bundle::Extended;
use Alien::Build::Plugin::PkgConfig::Negotiate;
use lib 't/lib';
use MyTest;

subtest 'pick' => sub {

  my $pick = Alien::Build::Plugin::PkgConfig::Negotiate->_pick;
  
  ok $pick, 'has a pick';
  note "pick = $pick";

};

done_testing;
