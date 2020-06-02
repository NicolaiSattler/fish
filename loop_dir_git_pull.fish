function loop_dir_git_pull
    set currentFolder $PWD

    cd $argv
    
    for d in (find . -maxdepth 2 -name .git -type d -prune)
        cd $d/..
        echo $d
       
        git fetch
    
        set local_sha (git rev-parse --verify HEAD)
        set remote_sha (git rev-parse --verify FETCH_HEAD)

        if test "$local_sha" != "$remote_sha"
            git pull
        end
        
        cd ..

    end
    cd $currentFolder
  end