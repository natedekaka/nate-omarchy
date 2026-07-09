return {
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    opts = { transparent_bg = false },
    config = function(_, opts)
      require("dracula").setup(opts)
      vim.cmd.colorscheme("dracula")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "dracula" },
  },
}
