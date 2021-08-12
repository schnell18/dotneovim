# 简介

dotneovim 是一种高效的管理 Vim 配置及插件的方式。
本项目要求使用 neovim 0.5.0+，采用 [plug][1] 管理以下插件：

- mhinz/vim-startify
- tpope/vim-sensible
- sainnhe/edge
- neovim/nvim-lspconfig
- nvim-lua/completion-nvim
- SirVer/ultisnips
- honza/vim-snippets
- nvim-lua/popup.nvim
- nvim-lua/plenary.nvim
- nvim-telescope/telescope.nvim
- nvim-treesitter/nvim-treesitter
- nvim-treesitter/playground
- kyazdani42/nvim-web-devicons
- kyazdani42/nvim-tree.lua
- glepnir/galaxyline.nvim
- nvim-telescope/telescope-dap.nvim
- mfussenegger/nvim-dap
- mfussenegger/nvim-dap-python
- pwntester/octo.nvim
- tpope/vim-commentary
- tpope/vim-repeat
- tpope/vim-unimpaired
- godlygeek/tabular
- hotoo/pangu.vim

添加或更新插件时需要执行：

    :source %
    :PackInstall

## MacOS X 及 Unix 安装方法

请使用以下命令将 dotvim 克隆到本地

    git clone https://github.com/schnell18/dotneovim ~/.neovim

然后请创建符号链接，指向 home 目录下的.vim/vimrc 文件：

    ln -s ~/.neovim ~/.config/nvim

## 依赖命令行工具

为获得最佳使用效果，请安装以下命令工具:

- [ripgrep][2] -- 用于telescope 插件的 live grep
- [gh][3] -- github CLI
- [gopls][4] -- golang language server
- [pyright][5] -- Python language server
- [rust\_analyzer][6] -- Rust language server

可使用 homebrew 安装 ripgrep, gh, rust\_analyzer :

    brew install ripgrep gh rust_analyzer

安装 gopls 请使用以下命令:

    GO111MODULE=on go get golang.org/x/tools/gopls@latest

如果有无法连接的问题，请尝试使用代理服务。

安装pyright请使用以命令:

    npm install -g pyright

[1]: https://github.com/junegunn/vim-plug
[2]: https://github.com/BurntSushi/ripgrep
[3]: https://github.com/cli/cli
[4]: https://github.com/golang/tools/blob/master/gopls/README.md
[5]: https://github.com/BurntSushi/ripgre://github.com/microsoft/pyright
[6]: https://github.com/rust-analyzer/rust-analyzer
