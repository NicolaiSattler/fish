function loop_dir_git_push
    set currentFolder $PWD

    cd $argv[1]
    
    for d in (find . -mindepth 1 -name .git -type d -prune)
        cd $d/..

        echo $d/..

        git push
        
        cd ..

    end

    cd $currentFolder
end