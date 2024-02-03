return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "prettierd",
        "eslint-lsp",
        "typescript-language-server", -- DOC recommendation from his NextJS video
        "rust-analyzer",
      },
    },
  },
}
