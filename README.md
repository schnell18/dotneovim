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

[1]: https://github.com/junegunn/vim-plug
