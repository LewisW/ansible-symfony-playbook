source ~/.git-prompt.sh

GIT_PS1_SHOWCOLORHINTS=1
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

alias sdev="{{symfony2_php_path}} app/console --env=dev"
alias sprod="{{symfony2_php_path}} app/console --env=prod"
alias stest="{{symfony2_php_path}} app/console --env=test"

alias rm="rm -i"
alias h="history|grep "
alias f="find . |grep "

cd {{ symfony2_project_root }}