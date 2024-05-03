return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      --- other options
      servers = {
        tsserver = {
          on_attach = function(client)
            -- this is important, otherwise tsserver will format ts/js
            -- files which we *really* don't want.
            client.server_capabilities.documentFormattingProvider = false
          end,
        },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = {},
    --   function(_, opts)
    --   local nls = require("null-ls").builtins
    --   opts.sources = vim.list_extend(opts.sources or {}, {
    --     nls.formatting.biome,
    --
    --     -- or if you like to live dangerously like me:
    --     nls.formatting.biome.with({
    --       args = {
    --         "check",
    --         "--apply-unsafe",
    --         "--formatter-enabled=true",
    --         "--organize-imports-enabled=true",
    --         "--skip-errors",
    --         "$FILENAME",
    --       },
    --     }),
    --   })
    -- end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["vue"] = { "prettier" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "prettier" },
        ["jsonc"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
      },
    },
  },
}
