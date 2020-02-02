eval "$(starship init bash)"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GREP_OPTIONS="--color=auto"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1

alias artisan='php artisan'
_artisan()
{
        COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
        COMMANDS=`php artisan --raw --no-ansi list | sed "s/[[:space:]].*//g"`
        COMPREPLY=(`compgen -W "$COMMANDS" -- "${COMP_WORDS[COMP_CWORD]}"`)
        return 0
}
complete -F _artisan artisan

alias phpunit="vendor/bin/phpunit"
alias laravel="composer create-project laravel/laravel && rsync -uaq laravel/ . && rm -rf laravel/ && yarn install"
alias stancy="composer create-project gummibeer/stancy-template laravel && rsync -uaq laravel/ . && rm -rf laravel/ && yarn install"
