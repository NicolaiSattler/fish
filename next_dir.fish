function next_dir
    set foundcwd 0
    set cwd $PWD
    set error 'There is no next directory to navigate to...'

    if [ -z $cwd ]
        echo $error
    else
        echo $cwd

        for d in ../*/
                        
            set needle (string split "/" -- $d)[2]
            set regex (string join '' $needle '$')

            if [ $foundcwd = 1 ]
                cd $d
                break
            end

            if string match -r $regex $cwd
                set foundcwd 1
            end
        end
    end
end


