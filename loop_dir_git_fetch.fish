function loop_dir_git_fetch
    set currentFolder $PWD

    cd $argv[1]
    
    for d in (find . -mindepth 1 -name .git -type d -prune)
        cd $d/..

        echo $d/..

        git fetch --prune
        
        cd ..

    end

    cd $currentFolder
end