source ~/.git-prompt.sh

GIT_PS1_SHOWCOLORHINTS=1
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

alias sdev="php {{symfony2_console_path|default('app/console')}} --env=dev"
alias sprod="php {{symfony2_console_path|default('app/console')}} --env=prod"
alias stest="php {{symfony2_console_path|default('app/console')}} --env=test"

alias rm="rm -i"
alias h="history|grep "
alias f="find . |grep "

cd {{ symfony2_project_root|default('/var/www') }}
