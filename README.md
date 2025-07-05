# neovim-config

A place to store my neovim configs.

## Installation
    # Remove your existing config (CAUTION: Make sure you want to do this or create a backup first)
    rm -rf ~/.config/nvim

    # Clone the repository
    git clone https://github.com/chigges/nvim.git ~/.config

Your done! 

Everything should install itself automatically the next time you start nvim. You may need to reopen nvim after everything installs for it to work properly.

You can tell if it installed correctly if it says a little message in the bottom left when nvim starts.

I hope this serves you as a good config or at least gets you started on creating your own config.

# Brief explanation

**/init.lua** - This is the file that is initially run when nvim opens. Make sure you require any directories in your **/lua** folder you want to have run their separate init.lua file.

**/lua** - Any lua scripts you want to require should be placed here.

**/lua/plugins** - Plugins I want lazy.nvim to install. Each file is a list of package objects
