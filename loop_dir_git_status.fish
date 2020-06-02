function loop_dir_git_status
    set currentFolder $PWD

    cd $argv
    
    for d in (find . -mindepth 1 -maxdepth 2 -name .git -type d -prune)
        cd $d/..

        echo $d
        
        git status -s -b -u --show-stash

        cd ..
    end

    cd $currentFolder
  end