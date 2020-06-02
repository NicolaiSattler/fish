function loop_dir_git_gc
    set currentFolder $PWD

    cd $argv[1]
    
    for d in (find . -maxdepth 2 -name .git -type d -prune)
        cd $d/..

        echo $d/..

        git gc --auto 
        
        cd ..

    end

    cd $currentFolder
end
