local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar",
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require("dap-go").debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require("dap-go").debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gotests = {
  plugin = true,
  n = {
    ["<leader>gtc"] = {
      "<cmd> GoTestAdd <CR>",
      "Add unit test for method/func under cursor"
    },
    ["<leader>gta"] = {
      "<cmd> GoTestsAll <CR>",
      "Add unit tests for all methods/funcs"
    },
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    },
    [",g"] = {
      "<cmd> !go run %<CR>",
      "Run current go program"
    },
  }
}

M.general_nav = {
  plugin = true,
  n = {
    ["<C-h>"] = {
      "<C-w>h",
      "Move to left window"
    },
    ["<C-j>"] = {
      "<C-w>j",
      "Move to lower window"
    },
    ["<C-k>"] = {
      "<C-w>k",
      "Move to upper window"
    },
    ["<C-l>"] = {
      "<C-w>l",
      "Move to right window"
    },
    ["<C-Up>"] = {
      ":resize +2<CR>",
      "Increase window size by 2"
    },
    ["<C-Down>"] = {
      ":resize -2<CR>",
      "Decrease window size by 2"
    },
    ["<C-Left>"] = {
      ":vertical resize -2<CR>",
      "Shrink window size by 2"
    },
    ["<C-Right>"] = {
      ":vertical resize +2<CR>",
      "Enlarge window size by 2"
    },
    ["<S-l>"] = {
      ":bnext<CR>",
      "Go to next buffer"
    },
    ["<S-h>"] = {
      ":bprevious<CR>",
      "Go to previous buffer"
    },
  },
  v = {
    ["<"] = {
      "<gv",
      "Stay in indent mode"
    },
    [">"] = {
      ">gv",
      "Stay in indent mode"
    },
    ["<A-j>"] = {
      ":move .+1<CR>==",
      "Move text down"
    },
    ["<A-k>"] = {
      ":move .-2<CR>==",
      "Move text up"
    },
    ["p"] = {
      '"_dP',
      "Copy paste"
    },
  },
  x = {
    ["J"] = {
      ":move '>+1<CR>gv-gv",
      "Move text down"
    },
    ["K"] = {
      ":move '<-2<CR>gv-gv",
      "Move text up"
    },
    ["<A-j>"] = {
      ":move >+1<CR>gv-gv",
      "Move text down"
    },
    ["<A-k>"] = {
      ":move <-2<CR>gv-gv",
      "Move text up"
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>tt"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>te"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}
---adfadf
M.misc = {
  plugin = true,
  v = {
    ["vae"] = {
     ":!vault-encrypt.sh<CR>",
      "Encrypt as ansile-vault string"
    },
    ["vad"] = {
      ":!vault-decrypt.sh<CR>",
      "Decrypt ansile-vault string"
    },
  },
}


require("core.utils").load_mappings("general_nav")
require("core.utils").load_mappings("misc")
return M
