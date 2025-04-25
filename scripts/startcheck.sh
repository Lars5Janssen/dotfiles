checkgitrepo () {
    /home/l/.local/cron/git_repo_check_cron.sh "$1" 10000 no-wait
}

checkgitrepo /home/l/dotfiles/
checkgitrepo /home/l/Projects/ansible/
