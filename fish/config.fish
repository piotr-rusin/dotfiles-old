function is_virtual_env_neovim
    [ (basename "$VIRTUAL_ENV") = neovim ]
end


function add_neovim_to_paths \
    -d "Add neovim-related python packages to PATH and PYTHONPATH" \
    --on-event virtualenv_will_activate

    if not is_virtual_env_neovim
        set -gx PYTHONPATH \
        "$HOME/.virtualenvs/neovim/lib/python/site-packages" $PYTHONPATH

        set -gx PATH "$HOME/.virtualenvs/neovim/bin" $PATH
    end
end


function is_no_virtual_env_active
    not set -q VIRTUAL_ENV
end


function add_idle_py \
    -d "Add idle.py to a newly created virtual environment" \
    --on-event virtualenv_did_create

    set -l ERROR_COLOR (set_color --bold red)
    if is_no_virtual_env_active
        echo "$ERROR_COLOR No virtualenv is active!"
    else
        cp "$HOME/.virtualenvs/idle.py" "$VIRTUAL_ENV/bin"
    end
end

eval (python -m virtualfish compat_aliases projects auto_activation)
