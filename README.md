# 简介

dotneovim 是一种利用 git 管理 Neovim 配置及插件的方式。
本项目使用了纯 Lua 脚本配置 noevim，并借助 LSP，实现了可扩展的多语言开发环境。
以下为 golang 的开发环境示例：


![neovim DAP sample](images/vim-dap-example.gif "neovim DAP sample")

本项目要求使用 neovim 0.6.0+， 添加或更新插件时需要执行：

    :PlugUpdate

## 必备工具

为获得最佳使用效果，请安装以下命令工具：

- [ripgrep][2] -- 用于 telescope 插件的 live grep
- [dlv][3] -- golang debugger
- [jq][4] -- Powerful JSON CLI processor
- [fd][5] -- Simpler and faster alternative to find

可使用 homebrew 安装 ripgrep, gh, jq :

    brew install ripgrep gh jq

本项目使用的部分 LSP 插件，比如 bashls，dockerls 使用了 WebAssembly 技术，
需要用 17.3.0 以上版本 node。

## MacOS X 及 Unix 安装方法

请使用以下命令将 dotvim 克隆到本地

    git clone https://github.com/schnell18/dotneovim ~/.neovim

然后请创建符号链接，指向 home 目录下的.vim/vimrc 文件：

    ln -s ~/.neovim ~/.config/nvim


## LSP 服务器安装与配置

本项目使用的 LSP 服务器均为 [nvim-lsp-installer][5] 管理。
如需安装你所需的 LSP 插件，请在 neovim 中运行`:LspInstallInfo`命令。
然后在弹窗中选择你所需插件并按`i`按键。安装完成后还需在`~/.config/nvim/lua`
目录下创建 lspxxx(xxx 为 LSP 插件的名称） 的目录，该目录下创建一个名为`init.lua`的文件，
其中包含：


    _M = {}

    function _M.enrich(config)

      return config

    end

    return _M

如果 LSP 插件不正常，可以通过查看`~/.cache/nvim/lsp.log`文件进行排错。

## Plugin installed

本项目采用 [plug][1] 管理插件，以下是预装的插件清单：

- tpope/vim-sensible
- sainnhe/edge
- neovim/nvim-lspconfig
- williamboman/nvim-lsp-installer
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
- rcarriga/nvim-dap-ui
- theHamsta/nvim-dap-virtual-text
- mfussenegger/nvim-dap-python
- pwntester/octo.nvim
- tpope/vim-commentary
- tpope/vim-repeat
- godlygeek/tabular
- hotoo/pangu.vim
- glepnir/dashboard-nvim
- folke/which-key.nvim
- romgrk/barbar.nvim
- folke/todo-comments.nvim
- folke/trouble.nvim
- ray-x/guihua.lua
- ray-x/navigator.lua
- onsails/lspkind-nvim
- hashivim/vim-terraform
- vim-test/vim-test
- rcarriga/vim-ultest
- preservim/vimux


[1]: https://github.com/junegunn/vim-plug
[2]: https://github.com/BurntSushi/ripgrep
[3]: https://github.com/go-delve/delve
[4]: https://stedolan.github.io/jq/
[5]: https://github.com/sharkdp/fd#installation
