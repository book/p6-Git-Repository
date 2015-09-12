use Test;
use Git::Repository;

throws-like
   { Git::Repository.new( git => <hopefully does not exist> ) },
   X::AdHoc,
   message => "'hopefully does not exist' failed to run";

throws-like
   { Git::Repository.new( git => <perl6> ) },
   X::AdHoc,
   message => "'perl6' does not look like git";

done-testing;
