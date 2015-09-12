use v6;
use Test;

use Git::Repository;
use Test::Git;

my $r = test_repository( init => () );
isa-ok( $r, 'Git::Repository' );

done-testing;
