" vim_init plugin execute custom vim init command from config file
" (git root or current dir)

if exists("g:vim_init_config_name")
    let config_name = g:vim_init_config_name
else
    let config_name = ".vimrc_local"
endif

let g:git_root = substitute(system("git rev-parse --show-toplevel"), '^[\s\n]\+\|[\s\n]\+$', "", "g")

if match(config_name, "/") == 0 " passed absolute path
    exec("source " . config_name)
elseif !empty(git_root)
    let config_file = git_root . "/" . config_name
    if filereadable(config_file)
        exec("source " . config_file)
        finish
    endif
elseif filereadable(config_name)
    if (getcwd() . "/" . config_name) != ($HOME . "/.vimrc") " prevent double running $HOME/.vimrc
        exec("source " . config_name)
    endif
endif
