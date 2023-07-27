---@type MappingsTable
local M = {}

M.disabled = {
  n = {
      ["<leader>g"] = "",
  }
}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    -- ["g"] = { ":Telescope", "Open Telescope", opts = { nowait = true } },
  },
}

M.abc = {
  n = {
     ["<leader>g"] = {"<cmd> Telescope git_commits <CR>", "Telescope"},
     ["<leader>e"] = {"<cmd> NvimTreeToggle<CR>", "NvimTreeToggle"},
     ["<leader>f"] = {"<cmd> NvimTreeFocus<CR>", "NvimTreeFocus"},
  },

  i = {
     ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    -- ...
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
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
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

-- more keybinds!

return M
