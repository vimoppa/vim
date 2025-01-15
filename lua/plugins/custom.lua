local filetype = require("mason-lspconfig.mappings.filetype")
-- custom plugin
return {
  -- auto-save configuration
  { "pocco81/auto-save.nvim", lazy = false, enabled = true },

  -- add vscode / github theme
  -- { "Mofiqul/vscode.nvim", lazy = false, enabled = true },
  { "martinsione/darkplus.nvim", lazy = false, enabled = true },
  -- { "projekt0n/github-nvim-theme", lazy = false, enabled = true },

  -- Configure LazyVim to load vscode theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darkplus",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.theme = "auto"
    end,
  },

  -- add graphql support
  { "jparise/vim-graphql", lazy = false, enabled = true },

  -- add markdown preview
  {
    "iamcco/markdown-preview.nvim",
    -- cmd = "MarkdownPreviewToggle",

    -- init = function()
    --   require("lazyvim.util").on_attach(function(_, buffer)
    --       -- stylua: ignore
    --     vim.keymap.set( "n", "<leader>ckpp", ":call MarkdownPreview", { buffer = buffer, desc = "Markdown Preview Toggle" })
    --     vim.keymap.set( "n", "<leader>ckps", ":call MarkdownPreviewStop", { buffer = buffer, desc = "Markdown Preview Toggle" })
    --     -- vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
    --   end)
    -- end,

    -- keys = {
    --   {
    --     "<leader>ckp",
    --     function()
    --       vim.cmd([[ :call MarkdownPreviewToggle() ]])
    --     end,
    --     desc = "Markdown Preview Toggle",
    --   },
    -- },

    config = function()
      vim.cmd([[ :call mkdp#util#install() ]])
    end,
  },

  -- add rust language support
  { import = "lazyvim.plugins.extras.lang.rust" },

  --  add typscript support, lazyvim extended package
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add python support, lazyvim extended package
  { import = "lazyvim.plugins.extras.lang.python" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add yaml extended package
  { import = "lazyvim.plugins.extras.lang.yaml" },

  -- add prettier configuration
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  -- add move-language support
  { "modocache/move.vim", lazy = false, enabled = true },

  -- add aws-sam lint support using cfn-lint
  { "speshak/vim-cfn", lazy = false, enabled = true },

  -- add copilot support
  -- { "github/copilot.vim", lazy = false, enabled = true },

  { import = "lazyvim.plugins.extras.lang.terraform" },

  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
    },

    -- If you have a recent version of lazy.nvim, you don't need to add this!
    build = "nvim -l build/init.lua",
  },

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
        "toml",
        "ron",
        "yaml",
        "markdown",
        "markdown_inline",
        "hcl",
        -- "graphql",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- Automatically format on save
      autoFormat = false,
      ---@type lspconfig.options
      servers = {
        html = {},
        cssls = {},
        bashls = {},
        -- yamlls = {},
        taplo = {},
        tailwindcss = {},
        terraformls = {},
        graphql = {},
        cfn_lint = {},
        -- sqlls = {},
        pylsp = {},
        gopls = {},
        rust_analyzer = {},
        move_analyzer = {},
        solidity_ls = {},
        -- tsserver = {},
        marksman = {},
        -- zk = {},
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
