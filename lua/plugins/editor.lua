return {
  -- { -- add symbols-outline
  --   "simrat39/symbols-outline.nvim",
  --   cmd = "SymbolsOutline",
  --   keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  --   config = true,
  -- },

  -- snacks picker instead
  -- { -- find file qickly, should install fzf first
  --   "ibhagwan/fzf-lua",
  --   dependencies = { "echasnovski/mini.icons" },
  --   -- dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("fzf-lua").setup({
  --       fzf_colors = {
  --         false, -- inherit fzf colors that aren't specified below from
  --         -- the auto-generated theme similar to `fzf_colors=true`
  --         ["fg"] = { "fg", "CursorLine" },
  --         ["bg"] = { "bg", "Normal" },
  --         ["hl"] = { "fg", "Comment" },
  --         ["hl+"] = { "fg", "Statement" },
  --         ["info"] = { "fg", "PreProc" },
  --         ["prompt"] = { "fg", "Conditional" },
  --         ["marker"] = { "bg", "Keyword" },
  --         ["spinner"] = { "fg", "Label" },
  --         ["pointer"] = { "fg", "Exception" },
  --         ["header"] = { "fg", "Comment" },
  --         ["gutter"] = "-1",
  --       },
  --     })
  --   end,
  --   -- <C-p> set in lua/config/keymaps.lua
  --   -- keys = {
  --   -- { "<C-p>", mode = "n", "<cmd>FzfLua files<cr>" },
  --   -- },
  -- },
  --
  -- use default config in lazyvim
  -- { -- lsp completion plugin
  --   "hrsh7th/nvim-cmp",
  --   -- enabled = false,
  --   optional = true,
  --   opts = function(_, opts)
  --     -- if you wish to use autocomplete
  --     table.insert(opts.sources, 1, {
  --       name = "llm",
  --       group_index = 1,
  --       priority = 100,
  --     })
  --
  --     opts.performance = {
  --       -- It is recommended to increase the timeout duration due to
  --       -- the typically slower response speed of LLMs compared to
  --       -- other completion sources. This is not needed when you only
  --       -- need manual completion.
  --       fetching_timeout = 10000,
  --     }
  --   end,
  -- },
  {
    "saghen/blink.cmp",
    -- enabled = false,
    opts = {
      completion = {
        menu = {
          scrollbar = false,
          border = "rounded",
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:FloatBorder",
        },
        documentation = { window = { border = "rounded" } },
        trigger = {
          prefetch_on_insert = false,
          show_on_blocked_trigger_characters = {},
        },
        list = {
          selection = {
            preselect = false,
          },
        },
      },
      signature = { window = { border = "single" } },
      keymap = {
        -- set to 'none' to disable the 'default' preset
        preset = "none",
        ["<C-e>"] = { "hide" },
        ["<C-y>"] = { "select_and_accept" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },

        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        -- ["<C-y>"] = {
        --   function(cmp)
        --     cmp.show({ providers = { "llm" } })
        --   end,
        -- },
      },
      -- sources = {
      --   -- if you want to use auto-complete
      --   default = { "llm" },
      --   providers = {
      --     llm = {
      --       name = "llm",
      --       module = "llm.common.completion.frontends.blink",
      --       timeout_ms = 10000,
      --       score_offset = 100,
      --       async = true,
      --     },
      --   },
      -- },
    },
  },

  { -- file explorer
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      filesystem = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every
        },
        -- time the current file is changed while the tree is open.
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      },
      window = {
        mappings = {
          ["u"] = "navigate_up",
          ["C"] = "set_root",
          ["<C-v>"] = "open_vsplit",
          ["<C-h>"] = "open_split",
        },
      },
    },
  },

  { -- need install lazygit first
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.api.nvim_set_hl(0, "LazyGitFloat", { fg = "#c9ece2", bg = "NONE" })
      vim.api.nvim_set_hl(0, "LazyGitBorder", { fg = "#4b5263", bg = "NONE" })
      vim.keymap.set("t", "<C-c>", function()
        vim.api.nvim_win_close(vim.api.nvim_get_current_win(), true)
        vim.api.nvim_command("LLMAppHandler CommitMsg")
      end, { desc = "AI Commit Msg" })
    end,
  },

  -- run code
  {
    "Kurama622/FloatRun",
    cmd = { "FloatRunToggle", "FloatTermToggle" },
    opts = function()
      return {
        ui = {
          border = "rounded",
          float_hl = "Normal",
          border_hl = "FloatBorder",
          blend = 0,
          height = 0.5,
          width = 0.7,
          x = 0.5,
          y = 0.5,
        },
        run_command = {
          cpp = "g++ -std=c++11 %s -Wall -o {} && {}",
          python = "python3 %s",
          lua = "lua %s",
          sh = "bash %s",
          Zsh = "bash %s",
          [""] = "",
        },
      }
    end,
    keys = {
      { "<leader>tx", mode = { "n", "t" }, "<cmd>FloatRunToggle<cr>" },
      { "<F5>", mode = { "n", "t" }, "<cmd>FloatRunToggle<cr>" },
      { "<F2>", mode = { "n", "t" }, "<cmd>FloatTermToggle<cr>" },
      -- { "<F14>", mode = { "n", "t" }, "<cmd>FloatTerm<cr>" },
    },
  },
}
