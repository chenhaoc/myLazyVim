return {

  { -- complete framework, use lsp is ok
    "neoclide/coc.nvim",
    branch = "release",
    enabled = false,
  },

  { -- surround
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sc", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },

  { -- treesitter set dependencies
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "vim",
        "yaml",
      },
    },
  },

  { -- lspconfig
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- inlay_hints = { enabled = vim.fn.has("nvim-0.10") },
      -- inlay_hints = { enabled = false },
      -- ---@type lspconfig.options
      servers = {
        clangd = {},
        pyright = {},
      },
    },
  },

  { -- format
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        python = { "autopep8" },
      },
    },
  },

  -- { -- change name style such as camel/ascal/snake
  --   "Kurama622/style-transfer.nvim",
  --   cmd = { "TransferCamelCase", "TransferMixedCase", "TransferStrCase" },
  --   config = function()
  --     require("style_transfer").setup()
  --   end,
  --   keys = {
  --     { "crc", mode = "n", "<cmd>TransferCamelCase<cr>" },
  --     { "crm", mode = "n", "<cmd>TransferMixedCase<cr>" },
  --     { "cr_", mode = "n", "<cmd>TransferStrCase _<cr>" },
  --     { "cr-", mode = "n", "<cmd>TransferStrCase -<cr>" },
  --     { "cr.", mode = "n", "<cmd>TransferStrCase .<cr>" },
  --     { "cr ", mode = "n", "<cmd>TransferStrCase \\ <cr>" },
  --     { "rc", mode = "x", "<cmd>TransferCamelCase<cr>" },
  --     { "rm", mode = "x", "<cmd>TransferMixedCase<cr>" },
  --     { "r_", mode = "x", "<cmd>TransferStrCase _<cr>" },
  --     { "r-", mode = "x", "<cmd>TransferStrCase -<cr>" },
  --     { "r.", mode = "x", "<cmd>TransferStrCase .<cr>" },
  --   },
  -- },

  { -- git, but seems conflict with something in lazyvim and disabled by default
    "lewis6991/gitsigns.nvim",
    enabled = false,
    -- lazy = true,
    event = "BufRead",
    config = function()
      vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "keyword" })
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged_enable = true,
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true,
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 100,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })
    end,
    keys = {
      { "<leader>gg", mode = "n", "<cmd>Gitsigns toggle_current_line_blame<cr>" },
    },
  },
}
