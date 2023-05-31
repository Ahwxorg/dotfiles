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
     ["<leader>g"] = {"<cmd> Telescope <CR>", "Telescope"},
     ["<leader>e"] = {"<cmd> NvimTreeToggle<CR>", "NvimTreeToggle"},
  },

  i = {
     ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    -- ...
  }
}

-- more keybinds!

return M
