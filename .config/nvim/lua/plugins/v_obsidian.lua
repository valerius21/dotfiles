local obsidian_file_path = "~/obsidian/club-mate-believer/"
return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = obsidian_file_path,
        },
      },
    },
  },
}
