return {
  "ibhagwan/fzf-lua",
  opts = {
    defaults = {
      -- formatter = "path.filename_first",
      formatter = "path.filename_first",
      fzf_opts = {
        ["--layout"] = "default",
      },

      winopts = {
        width = 0.9,
        preview = {
          horizontal = "right:50%", -- right|left:size
          delay = 50,
          scrollchars = { "┃", "" },
        },
      },
    },
  },
}
