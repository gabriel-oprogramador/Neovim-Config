# Neovim-Config
Configuration for Neovim using Lua language, theme based on Visual Assist.
To use clang-format, copy it to a root folder like your user's so that all subfolders use this pattern.  

# About
Gruvbox theme modified to look like the "Visual Assist" theme 
Support for installing LSP automatically.  
Telescop for quick navigation  
Floaterm to have several terminals.  
Supports transparency ":EnableTransparency" / ":DisableTransparency"

# Dependencies * and Recommendations
GCC * => For Treesitter [Windows](https://github.com/skeeto/w64devkit) And Linux  
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

# LSP Servers and Their Supported Languages

- `clangd`                     — C / C++
- `jdtls`                      — Java
- `omnisharp`                  — C# / .cs
- `html`                       — HTML / .html
- `cssls`                      — CSS / .css
- `lua_ls`                     — Lua / .lua
- `typescript-language-server` — TypeScript / JavaScript / .ts, .tsx, .js, .jsx
- `zls`                        — Zig / .zig
- `gopls`                      — Go / .go
- `glsl_analyzer`              — GLSL / .vert, .frag
- `rust_analyzer`              — Rust / .rs
- `jsonls`                     — JSON / .json
- `svelte`                     — Svelte / .svelte
- `pyright`                    — Python / .py
