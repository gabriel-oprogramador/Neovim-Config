# Neovim-Config
Configuration for Neovim using Lua language, theme based on Visual Assist.

# About
Gruvbox theme modified to look like the "Visual Assist" theme 
Support for installing LSP automatically.  
Telescop for quick navigation  
Floaterm to have several terminals.  
Already tested with C/C++, Java, Javascript, Typescript, C#, GLSL, Svelt. Html, CSS, Lua  
Supports transparency ":EnableTransparency" / ":DisableTransparency"

# Dependencies * and Recommendations
Git * => https://git-scm.com/download  
Vim Plug * => https://github.com/junegunn/vim-plug  
Node * => https://nodejs.org/en/download/package-manager/current  
Python => https://www.python.org/downloads/  
NerdFonts => https://www.nerdfonts.com/font-downloads  
On Windows I recommend "Powershell 7" => https://learn.microsoft.com/pt-br/shows/it-ops-talk/how-to-install-powershell-7  

# Installation
1 => Install dependencies and configure your Terminal  
2 => Put the files in the nvim folder  
    Linux ->"/home/.config/nvim"  
    Windows -> "C:/Users/UserName/AppData/Local/nvim"  
3 => Open with the "nvim" command and use the ":PlugInstall" command  

# Note
More information in the init.lua file.  
HTML autocomplete, write the tag and it closes by itself.  
Svelte Autocomplete write the tag without the '<' and select the correct one.  

# Plugs
gruvbox  
telescope  
nerdcommenter  
vim-closetag  
vim-floaterm  
nvim-autopairs  
auto-pairs  
vim-polyglot  
vim-airline  
vim-airline-themes  
vim-highlight-cursor-words  
nerdtree  
vim-nerdtree-syntax-highlight  
nerdtree-git-plugin  
vim-devicons  
plenary.nvim  
popup.nvim  
maso  
mason-lspconfig  
nvim-lspconfig  