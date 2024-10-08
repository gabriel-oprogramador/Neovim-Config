require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = false,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {
      ColorType = "#000000",
    },
    overrides = {
      String = {fg = "#ff7373"},
      Type = {fg = "#f5f507"},
      Include = {fg = "#a486eb"},
      Keyword = {fg = "#9797fc"},
      PreProc = {fg = "#ffd68f"},
      Function = {link = "GruvboxOrange"},
      Comment = {fg = "#2a9c2a"},
      Statement = {fg = "#9797fc"},
      Conditional = {fg = "#9797fc"},
      Repeat = {fg = "#9797fc"},
      Operator = {fg = "#9797fc"},
      Define = {fg = "#9797fc"},
      Macro = {fg = "#b254c7"},
      PreCondit = {fg = "#9797fc"},
      Constant = {fg = "#fab36b"},
      Character = {fg = "#d6b296"},
      Number = {fg = "#d6b296"},
      Float = {fg = "#d6b296"},
      Structure = {fg = "#9797fc"},
      typedef = {fg = "#9797fc"},
      StorageClass = {fg = "#9797fc"},
      Boolean = {fg = "#9797fc"},
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
    ]]
    print("Transparency On")
  end
  
  -- #202020 or #282828
  function DisableTransparency()
    vim.cmd [[
      hi Normal guibg=#101010 ctermbg=NONE
      hi LineNr guibg=#101010 ctermbg=NONE
      hi SignColumn guibg=#232323 ctermbg=NONE
      hi EndOfBuffer guibg=#101010 ctermbg=NONE
    ]]
    print("Transparency Off")
  end
  
  -- Command to disable transparency
  vim.api.nvim_create_user_command('EnableTransparency', EnableTransparency, {})
  
  -- Command to disable transparency
  vim.api.nvim_create_user_command('DisableTransparency', DisableTransparency, {})
