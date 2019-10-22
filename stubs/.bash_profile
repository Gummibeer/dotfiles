export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GREP_OPTIONS="--color=auto"
export PATH="$HOME/.composer/vendor/bin:$PATH"

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
