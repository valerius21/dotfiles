return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "css",
        "graphql",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "prisma",
        "python",
        "query",
        "regex",
        "scss",
        "svelte",
        "tsx",
        "twig",
        "typescript",
        "vim",
        "vue",
        "yaml",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "astro",
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
      "vue",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
