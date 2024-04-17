local obsidian_file_path = "~/obsidian/club-mate-believer/"
return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
      "BufReadPre " .. obsidian_file_path .. "**.md",
      "BufNewFile " .. obsidian_file_path .. "**.md",
    },
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
