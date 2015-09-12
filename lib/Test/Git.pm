module Test::Git {

    use File::Temp;
    use Git::Repository;

    sub test_repository (
        :$init,
        Capture() :$temp,
        :$git = 'git'
    ) is export
    {
        temp $*CWD = tempdir( |$temp );
        run( $git, 'init', |$init );
        Git::Repository.new();
    }

}
