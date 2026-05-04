return {
  {
    "LazyVim/LazyVim",
    init = function()
      vim.filetype.add({
        filename = {
          [".env"] = "sh",
        },
        pattern = {
          ["%.env%.[%w_.-]+"] = "sh",
          ["%.envrc"] = "sh",
        },
      })
    end,
  },
}
