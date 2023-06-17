return {
  {
    "VidocqH/lsp-lens.nvim",
    opts = {
      enable = true,
      include_declaration = true, -- Reference include declaration
      sections = { -- Enable / Disable specific request
        definition = true,
        references = true,
        implementation = true,
      },
      ignore_filetype = {
        "prisma",
      },
    },
  },
}
