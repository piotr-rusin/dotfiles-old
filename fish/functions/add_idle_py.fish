function add_idle_py --on-event virtualenv_did_create
    set -l ERROR_COLOR (set_color --bold red)
    if not set -q VIRTUAL_ENV
        echo "$ERROR_COLOR No virtualenv is active!"
    cp "$HOME/.virtualenvs/idle.py" "$VIRTUAL_ENV/bin"
end
