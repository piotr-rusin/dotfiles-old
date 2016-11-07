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

