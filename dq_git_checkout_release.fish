function dq_git_checkout_release

    set rootdq '/mnt/c/DataQuint'
    set currentFolder $PWD
    set releaseVersions "release/v1.5.7.0" "release/v1.5.6.1" "release/v1.5.6" "hotfix/v1.5.5.3" "hotfix/v1.5.5.2" "hotfix/v1.5.5.1" "hotfix/v1.5.5.0" "release/v1.5.5" "release/v1.5.4" "release/v1.5.3" "release/v1.1.3.0" "release/v1.1.2" "release/v1.0.7.0" "release/v1.0.6.1" "release/v1.0.6.0" "release/v1.0.6" "hotfix/v1.0.5.3" "hotfix/v1.0.5.2" "hotfix/v1.0.5.1" "hotfix/v1.0.5.1" "release/v1.0.5.0" "release/v1.0.5" "release/v1.0.5.0" "release/v1.0.4.1" "release/v1.0.4.0" "release/v1.0.4" "release/v1.0.3.1" "release/v1.0.3.0" "release/v1.0.3" "release/v1.0.2.0" "release/v1.0.2.1" "release/v1.0.2" "release/v1.0.1.1" "release/v1.0.1" "release/v1.0.0"

    cd $rootdq

    for d in (find . -mindepth 1 -name .git -type d -prune)
        cd $d/..
        echo $d

        set repo_has_changes (git status --porcelain --untracked-files=no)

        if test -n "$repo_has_changes"
            echo 'Repo has changes...'
        else
            git fetch
            git checkout master

            for b in $releaseVersions
                set branch_on_origin (git branch -r --list origin/$b)
                set branch_not_merged_to_master (git branch -r --list --no-merged master origin/$b)

                if test -n "$branch_on_origin"
                    if test -n "$branch_not_merged_to_master"
                        git checkout $b
                        git pull
                        break
                    end
                end
            end
        end
        
        cd ..
    end
end