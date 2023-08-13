-- custom plugin
return {
  -- auto-save configuration
  { "pocco81/auto-save.nvim", lazy = false, enabled = true },

  -- add vscode theme
  { "Mofiqul/vscode.nvim" },

  -- Configure LazyVim to load vscode theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.theme = "auto"
    end,
  },

  --  add typscript support, lazyvim extended package
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add prettier configuration
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  -- add move-language support
  { "modocache/move.vim", lazy = false, enabled = true },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.cmd([[ set foldmethod=expr ]])
      vim.cmd([[ set foldexpr=nvim_treesitter#foldexpr() ]])
      vim.cmd([[ set nofoldenable ]])
    end,
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "vim",
        "vimdoc",
        "lua",

        "html",
        "css",
        "bash",
        "javascript",
        "tsx",
        "typescript",
        "python",
        "go",
        "rust",
        "solidity",
        "move",

        "query",
        "regex",

        "terraform",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "hcl",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        html = {},
        cssls = {},
        bashls = {},
        yamlls = {},
        tailwindcss = {},
        terraformls = {},
        graphql = {},
        -- sqlls = {},
        pylsp = {},
        gopls = {},
        rust_analyzer = {},
        move_analyzer = {},
        solidity_ls = {},
        -- tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
