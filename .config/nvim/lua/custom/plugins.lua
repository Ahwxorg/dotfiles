local overrides = require("custom.configs.overrides")
local cmp = require "cmp"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "bash",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vim",
        "lua",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true
  },
  {
    "andreadev-it/shade.nvim",
    keys = "<Bslash>",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },
  --
  --
  -- Code QoL (syntax highlighting, autotagging, etc)
  --
  --
  {
    'codota/tabnine-nvim',
    build = "./dl_binaries.sh",
    enabled = true,
    lazy = false,
    setup = function ()
      require "custom.configs.code.tabnine"
    end
  },
  {
    "wuelnerdotexe/vim-astro",
    enabled = true,
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.code.rust-tools"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "razak17/tailwind-fold.nvim",
    opts= {},
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact' },
  },
  {
    "chikko80/error-lens.nvim",
    event = "BufRead",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    opts = {
      {
        enabled = true,
        auto_adjust = {
          enable = true,
          fallback_bg_color = "#281478", -- mandatory if enable true (e.g. #281478)
          step = 7, -- inc: colors should be brighter/darker
          total = 30 -- steps of blender
        },
        prefix = 6, -- distance code <-> diagnostic message
        -- default colors
        colors = {
          error_fg = "#FF6363", -- diagnostic font color
          error_bg = "#4B252C", -- diagnostic line color
          warn_fg = "#FA973A",
          warn_bg = "#403733",
          info_fg = "#5B38E8",
          info_bg = "#281478",
          hint_fg = "#25E64B",
          hint_bg = "#147828"
        }
      }
    },
  },
  {
    "code-biscuits/nvim-biscuits",
    event = "BufReadPost",
    opts = {
      show_on_start = false,
      cursor_line_only = true,
      default_config = {
        min_distance = 10,
        max_length = 50,
        prefix_string = " 󰆘 ",
        prefix_highlight = "Comment",
        enable_linehl = true,
      },
    },
  },
  {
    "m-demare/hlargs.nvim",
    event = "BufWinEnter",
    config = function()
      require("hlargs").setup {
        hl_priority = 200,
      }
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    dependencies = "nvim-treesitter",
    config = function()
      require("illuminate").configure {
        under_cursor = true,
        max_file_lines = nil,
        delay = 100,
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        filetypes_denylist = {
          "NvimTree",
          "Trouble",
          "Outline",
          "TelescopePrompt",
          "Empty",
          "dirvish",
          "fugitive",
          "alpha",
          "packer",
          "neogitstatus",
          "spectre_panel",
          "toggleterm",
          "DressingSelect",
          "aerial",
        },
      }
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"
  
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      throttle = true,
      max_lines = 0,
      patterns = {
        default = {
          "class",
          "function",
          "method",
        },
      },
    },
  },
  {
    "utilyre/barbecue.nvim",
    event = "LspAttach",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {},
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    init = function()
      vim.g.code_action_menu_show_details = true
      vim.g.code_action_menu_show_diff = true
      vim.g.code_action_menu_show_action_kind = true
    end,
    config = function()
      dofile(vim.g.base46_cache .. "git")
    end,
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    opts = {
      mappings = {
        "<C-u>",
        "<C-d>",
      }
    },
  },
  -- 
  --
  -- Tools
  --
  --
  -- {
  --   "jcdickinson/codeium.nvim",
  --   cmd = "Codeium",
  --   event = "BufReadPost",
  --   commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
  --   config = function()
  --     require("codeium").setup {}
  --   end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      {
        "sindrets/diffview.nvim",
        config = true,
      },
    }
  },
  --
  --
  -- Quality of Life
  --
  --
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("custom.configs.ui.todo").setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    },
   config = function()
      require "custom.configs.qol.noice"
   end,
  },
  -- {
  --   "sunjon/shade.nvim",
  --   enabled = true,
  --   config = function()
  --     require'shade'.setup({
  --       overlay_opacity = 50,
  --       opacity_step = 1
  --     })
  --   end,
  -- }

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

-- local overrides = require("custom.configs.overrides")

--                               ---@type NvPluginSpec[]
--                               local plugins = {
--                               
--                                 -- Override plugin definition options
--                               
--                                 {
--                                   "neovim/nvim-lspconfig",
--                                   dependencies = {
--                                     -- format & linting
--                                     {
--                                       "jose-elias-alvarez/null-ls.nvim",
--                                       config = function()
--                                         require "custom.configs.null-ls"
--                                       end,
--                                     },
--                                   },
--                                   config = function()
--                                     require "plugins.configs.lspconfig"
--                                     require "custom.configs.lspconfig"
--                                   end, -- Override to setup mason-lspconfig
--                                 },
--                               
--                                 -- override plugin configs
--                                 {
--                                   "williamboman/mason.nvim",
--                                   opts = overrides.mason
--                                 },
--                               
--                                 {
--                                   "nvim-treesitter/nvim-treesitter",
--                                   opts = overrides.treesitter,
--                                 },
--                               
--                                 {
--                                   "nvim-tree/nvim-tree.lua",
--                                   opts = overrides.nvimtree,
--                                 },
--                               
--                                 -- Install a plugin
--                                 {
--                                   "max397574/better-escape.nvim",
--                                   event = "InsertEnter",
--                                   config = function()
--                                     require("better_escape").setup()
--                                   end,
--                                 },
--                               
--                                 -- To make a plugin not be loaded
--                                 -- {
--                                 --   "NvChad/nvim-colorizer.lua",
--                                 --   enabled = false
--                                 -- },
--                               
--                                 -- All NvChad plugins are lazy-loaded by default
--                                 -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
--                                 -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
--                                 -- {
--                                 --   "mg979/vim-visual-multi",
--                                 --   lazy = false,
--                                 -- }
--                               }
--                               
--                               return plugins
