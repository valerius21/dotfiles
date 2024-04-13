return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "flake8",
        "prettierd",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "stylua",
        "typescript-language-server", -- DOC recommendation from his NextJS video
      },
    },
  },
}
