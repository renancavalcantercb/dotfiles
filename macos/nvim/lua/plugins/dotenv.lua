return {
  {
    "LazyVim/LazyVim",
    init = function()
      vim.filetype.add({
        filename = {
          [".env"] = "dotenv",
        },
        pattern = {
          ["%.env%.[%w_.-]+"] = "dotenv",
          ["%.envrc"] = "sh",
        },
      })
      vim.treesitter.language.register("bash", "dotenv")
    end,
  },
}
