require("gruvbox").setup({
  terminal_colors = true,   -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    emphasis = true,
    comments = true,
    folds = true,
    strings = false,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,      -- invert background for search, diffs, statuslines and errors
  contrast = "hard",   -- can be "hard", "soft" or empty string
  palette_overrides = {
    ColorType = "#000000",
  },
  overrides = {
    String = { fg = "#ff7373" },
    Type = { fg = "#f5f507" },
    Include = { fg = "#a486eb" },
    Keyword = { fg = "#9797fc" },
    PreProc = { fg = "#ffd68f" },
    --Function = {link = "GruvboxOrange"},
    Function = { fg = "#d65d0e", bold = true },
    Comment = { fg = "#2a9c2a", italic = true },
    Statement = { fg = "#9797fc" },
    Conditional = { fg = "#9797fc" },
    Repeat = { fg = "#9797fc" },
    Operator = { fg = "#9797fc" },
    Define = { fg = "#9797fc" },
    Macro = { fg = "#b254c7" },
    PreCondit = { fg = "#9797fc" },
    Constant = { fg = "#fab36b" },
    Character = { fg = "#d6b296" },
    Number = { fg = "#d6b296" },
    Float = { fg = "#d6b296" },
    Structure = { fg = "#9797fc" },
    typedef = { fg = "#9797fc" },
    StorageClass = { fg = "#9797fc" },
    Boolean = { fg = "#9797fc" },
  },
  dim_inactive = false,
  transparent_mode = false,
})

function EnableTransparency()
  vim.cmd [[
      hi Normal guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi CursorLine guibg=#1c1c1c
      hi CursorColumn guibg=#1c1c1c
      hi Pmenu guibg=NONE guifg=#ebdbb2
      hi PmenuSel guibg=NONE guifg=#ebdbb2
      hi FloatBorder guibg=NONE guifg=#928374
      hi WinSeparator guibg=NONE guifg=#3c3836

      hi NormalFloat guibg=#1c1c1c guifg=#3c3836
      hi FloatBorder guibg=NONE guifg=#3c3836
      hi LspSignatureActiveParameter guifg=#ffffff guibg=NONE gui=bold
    ]]
end

-- #202020 or #282828
function DisableTransparency()
  vim.cmd [[
      hi Normal guibg=#101010 ctermbg=NONE
      hi LineNr guibg=#101010 ctermbg=NONE
      hi SignColumn guibg=#232323 ctermbg=NONE
      hi EndOfBuffer guibg=#101010 ctermbg=NONE
      hi CursorLine guibg=#1c1c1c
      hi CursorColumn guibg=#1c1c1c
      hi Pmenu guibg=#1d2021 guifg=#ebdbb2
      hi PmenuSel guibg=#3c3836 guifg=#ebdbb2
      hi FloatBorder guibg=#101010 guifg=#928374
      hi WinSeparator guibg=#101010 guifg=#3c3836

      hi NormalFloat guibg=#1c1c1c guifg=#3c3836
      hi FloatBorder guibg=NONE guifg=#3c3836
      hi LspSignatureActiveParameter guifg=#ffffff guibg=NONE gui=bold
    ]]
end

-- Command to disable transparency
vim.api.nvim_create_user_command('EnableTransparency', EnableTransparency, {})

-- Command to disable transparency
vim.api.nvim_create_user_command('DisableTransparency', DisableTransparency, {})
