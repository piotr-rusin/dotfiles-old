set __OLD_PATH $PATH
set __OLD_PYTHONPATH $PYTHONPATH


function is_neovim_active_virtualenv
    [ (basename "$VIRTUAL_ENV") = neovim ]
end


function add_neovim_to_paths \
    -d "Add neovim-related python packages to PATH and PYTHONPATH" \

    if not is_neovim_active_virtualenv
        set -gx PYTHONPATH \
        "$HOME/.virtualenvs/neovim/lib/python3.5/site-packages" $PYTHONPATH

        set -gx PATH "$HOME/.virtualenvs/neovim/bin" $PATH
    end
end


function reset_paths \
    -d "Reset PATH and PYTHONPATH to their former values" \

    set -gx PYTHONPATH $__OLD_PYTHONPATH
    set -gx PATH $__OLD_PATH
end


function is_no_virtualenv_active
    not set -q VIRTUAL_ENV
end


function nvim \
    -d "Run neovim with support for deoplete and pylama maker"

    begin
        # python packages required by deoplete are installed
        # in the virtualenv
        set -lx PYTHONPATH $PYTHONPATH \
        "$HOME/.virtualenvs/neovim/lib/python3.5/site-packages"
        # neomake needs to be able to access pylama installed
        # in the virtualenv
        set -lx PATH $PATH "$HOME/.virtualenvs/neovim/bin"

        command nvim
    end
end


function add_idle_py \
    -d "Add idle.py to a newly created virtual environment" \
    --on-event virtualenv_did_create

    set -l ERROR_COLOR (set_color --bold red)
    if is_no_virtualenv_active
        echo "$ERROR_COLOR No virtualenv is active!"
    else
        cp "$HOME/.virtualenvs/idle.py" "$VIRTUAL_ENV/bin"
    end
end

eval (python -m virtualfish compat_aliases projects auto_activation)
