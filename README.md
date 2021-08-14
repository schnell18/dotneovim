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

## Python, golang, Rust Language Server 配置

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

## jtdls Java Language Server 的设置

jdtls Java Language Server有多种安装方式，具体可以参考[nvim-jdtls官方文档][7]。

以下为MacOS X上推荐安装方法。
安装 OpenJDK 11+。建议使用 SDKMan 安装。示例：

    sdk install java 11.0.2.hs-adpt

安装 Gradle。建议使用 SDKMan 安装。示例：

    sdk install gradle

安装 jdtls Java Language Server
从 [Eclipse 官网下载][8] jdtls, 以 1.2.0 为例：

    wget https://download.eclipse.org/jdtls/milestones/1.2.0/jdt-language-server-1.2.0-202106301459.tar.gz
    mkdir -p ~/apps/jdtls
    tar -xzvf jdt-language-server-1.2.0-202106301459.tar.gz -C ~/apps/jdtls

创建名为 java-lsp.sh 的可执行脚本，包含以下内容：

    #!/bin/sh

    # NOTE:
    # This doesn't work as is on Windows. You'll need to create an equivalent `.bat` file instead
    #
    # NOTE:
    # If you're not using Linux you'll need to adjust the `-configuration` option
    # to point to the `config_mac' or `config_win` folders depending on your system.

    JAR="$HOME/apps/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
    GRADLE_HOME=$HOME/.sdkman/candidates/groovy/current $HOME/.sdkman/candidates/java/11.0.2-open/bin/java \
      -Declipse.application=org.eclipse.jdt.ls.core.id1 \
      -Dosgi.bundles.defaultStartLevel=4 \
      -Declipse.product=org.eclipse.jdt.ls.core.product \
      -Dlog.protocol=true \
      -Dlog.level=ALL \
      -Xms1g \
      -Xmx2G \
      -jar $(echo "$JAR") \
      -configuration "$HOME/apps/jdtls/config_mac" \
      -data "${1:-$HOME/workspace}" \
      --add-modules=ALL-SYSTEM \
      --add-opens java.base/java.util=ALL-UNNAMED \
      --add-opens java.base/java.lang=ALL-UNNAMED

如果是Linux系统，请把-configuration 改为__"$HOME/apps/jdtls/config_mac"__


[1]: https://github.com/junegunn/vim-plug
[2]: https://github.com/BurntSushi/ripgrep
[3]: https://github.com/cli/cli
[4]: https://github.com/golang/tools/blob/master/gopls/README.md
[5]: https://github.com/BurntSushi/ripgre://github.com/microsoft/pyright
[6]: https://github.com/rust-analyzer/rust-analyzer
[7]: https://github.com/mfussenegger/nvim-jdtls#language-server-installation
[8]: https://download.eclipse.org/jdtls/milestones/
