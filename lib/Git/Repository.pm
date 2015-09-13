class Git::Repository {

    has $.git-dir;      # GIT_DIR
    has $.work-tree;    # GIT_WORK_TREE
    has $.git;          # git binary

    submethod BUILD ( :$!git = 'git', :$!git-dir, :$!work-tree ) {

        # test the git program
        if run( $!git, '--version', :out ) -> $proc {
            die "'$!git' does not look like git"
              if $proc.out.get !~~ m/^ git \s version /;
        }
        else {
            die "'$!git' failed to run";
        }

    }

    # pseudo code handling git => (param list) consistently without need of ,
    # handles git => (666), git => (a => 42), git => (666, a => 42) correctly
    multi method run(:$init!, List() :$git) {
        git( |$git.Capture );
    }
}

