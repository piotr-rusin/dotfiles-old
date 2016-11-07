function add_idle_py \
    -d "Add idle.py to a newly created virtual environment" \
    --on-event virtualenv_did_create

    set -l ERROR_COLOR (set_color --bold red)
    if not set -q VIRTUAL_ENV
        echo "$ERROR_COLOR No virtualenv is active!"
    else
        cp "$HOME/.virtualenvs/idle.py" "$VIRTUAL_ENV/bin"
    end
end

eval (python -m virtualfish compat_aliases projects auto_activation)
