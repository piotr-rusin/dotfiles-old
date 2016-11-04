

function is_no_virtual_env_active
    not set -q VIRTUAL_ENV
end


eval (python -m virtualfish compat_aliases projects auto_activation)
