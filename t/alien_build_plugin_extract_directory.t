use Test2::Bundle::Extended;
use Alien::Build::Plugin::Extract::Directory;
use lib 't/lib';
use MyTest;
use Path::Tiny qw( path );
use Capture::Tiny qw( capture_merged );

subtest 'basic' => sub {

  my($build, $meta) = build_blank_alien_build;
  
  my $plugin = Alien::Build::Plugin::Extract::Directory->new;
  $plugin->init($meta);
  
  $build->install_prop->{download} = path('corpus/dist/foo-1.00')->absolute->stringify;
  
  my($out, $dir) = capture_merged { $build->extract };

  $dir = path($dir);

  ok( defined $dir && -d $dir, "directory created"   );
  note "dir = $dir";

  foreach my $name (qw( configure foo.c ))
  {
    my $file = $dir->child($name);
    ok -f $file, "$name exists";
  }
  
};

done_testing;
