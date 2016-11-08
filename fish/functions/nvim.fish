function nvim -d "Run neovim with support for deoplete and pylama maker"

    begin
        # neomake needs to be able to access pylama installed in the virtualenv
        set -lx PATH $PATH "$HOME/.virtualenvs/neovim/bin"

        command nvim
    end
end

