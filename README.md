# Introduction

This project manages the neovim configuration based on NVChard in an
port and extensible manner. It offers advanced authoring environment for
multiple programming languanges and structured document like LaTeX. 
The following screenshot is an demonstration of golang development
environment.

![neovim DAP sample](images/vim-dap-example.gif "neovim DAP sample")



## Pre-requisite

This project requires neovim 0.10.0 or above and the supporting
utilities as follows:

- [ripgrep][2] -- for telescope's live grep feature
- [dlv][3] -- golang debugger
- [jq][4] -- Powerful JSON CLI processor
- [fd][5] -- Simpler and faster alternative to find

To install these tools, you may use the package manager 
of the OS or other method you are familiar with.
Here is an example for MacOS using homebrew:

    brew install ripgrep gh jq

## Installation on MacOS X or Unix

Clone the dotneovim project:

    git clone https://github.com/schnell18/dotneovim

Create symlink so that `~/.config/nvim` to the directory of dotneovim 
you just cloned:

    ln -s ~/dotneovim ~/.config/nvim


[1]: https://github.com/junegunn/vim-plug
[2]: https://github.com/BurntSushi/ripgrep
[3]: https://github.com/go-delve/delve
[4]: https://stedolan.github.io/jq/
[5]: https://github.com/sharkdp/fd#installation
