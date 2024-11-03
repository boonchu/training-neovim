###### NeoVIM #####
# - neovim-pde for beginner
https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#ce0a
# - neovim-modern for advance user
https://alpha2phi.medium.com/8-new-neovim-plugins-to-try-e221a3c2279c
# - nvcad 
> git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && git clone https://github.com/PatrickKoss/NvChad-Custom-Config.git ~/.config/nvim/lua/custom --depth 1 && nvim

https://www.youtube.com/watch?v=Mtgo-nP_r8Y

https://martinlwx.github.io/en/config-neovim-from-scratch/
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```
space -> t -> h to change theme

* syntax highlight (install via vim prompt)
  
:TSInstall elixir
:TSInstallInfo
:TSInstall terraform
:TSInstall typescript

* file tree (ctrl n)

* leader (space)

* file nav (space -> f -> f)
* file search (space -> f -> b)

* windows nav (ctrl + h/j/k/l)
* windows spilt pane (:vsp, :sp)

* cheat sheet (space -> c -> h)

* terminal (space -> h/v)

* customization with lua

```
$ tree ~/.config/nvim/
/home/bigchoo/.config/nvim/
├── LICENSE
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── bootstrap.lua
    │   ├── default_config.lua
    │   ├── init.lua  <--- this is for vim.opt.* to customize the vim
    │   ├── mappings.lua
    │   └── utils.lua
    ├── custom
    │   ├── README.md
    │   ├── chadrc.lua  <--- this file?
    │   ├── configs
    │   │   ├── lspconfig.lua
    │   │   ├── null-ls.lua
    │   │   └── overrides.lua
    │   ├── highlights.lua
    │   ├── init.lua <--- this file? (general settings?)
    │   ├── mappings.lua
    │   └── plugins.lua
    └── plugins
        ├── configs
        │   ├── cmp.lua
        │   ├── lazy_nvim.lua
        │   ├── lspconfig.lua
        │   ├── mason.lua
        │   ├── nvimtree.lua
        │   ├── others.lua
        │   ├── telescope.lua
        │   └── treesitter.lua
        └── init.lua
```

* edit ~/.config/nvim/lua/custom/plugins.lua

  Appends 'vim-crystal/vim-crystal',
  Use ':Lazy sync' to sync plugins

* `*-language-server`
ensure to install 'rust_analyzer' with Mason

- edit ~/.config/nvim/lua/custom/plugins.lua
```
󰌵 50   {       Line with postspace.
  51   │ "vim-crystal/vim-crystal",
  52   │ ft = "crystal",
  53   │ config = function(_)
  54   │ │ vim.g.crystal_auto_format = 1
  55   │ end
  56   },
```
- edit ~/.config/nvim/lua/custom/configs/lspconfig.lua
```
  16 lspconfig.rust_analyzer.setup({
  17   on_attach = on_attach,
  18   capabilities = capabilities,
  19   filetypes = {"rust"},
  20   root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  21 })
```
###### Lunar VIM ######

https://www.lunarvim.org/docs/installation
https://www.youtube.com/watch?v=sFA9kX-Ud_c

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
export PATH=/home/bigchoo/.local/bin:$PATH
alias vim=lvim

$ tree ~/.config/lvim/
/home/bigchoo/.config/lvim/
├── config.lua
└── lazy-lock.json

* change colorscheme
<space> -> s -> p

* change default server

lab1: using options
Edit vim ~/.config/lvim/config.lua

lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"

-- keymappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- options
vim.opt.number = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.relativenumber = false

lab2: Install Mason plugins 'Use :Mason' to load menu

    9 $ tree │  Installed (12)                                                                                          │
   10 /home/b│    ◍ bash-debug-adapter                                                                                  │
   11 ├── con│    ◍ bash-language-server bashls                                                                         │
   12 └── laz│    ◍ black                                                                                               │
   13        │    ◍ json-lsp jsonls                                                                                     │
   14 lab1: u│    ◍ lua-language-server lua_ls                                                                          │
   15 Edit vi│    ◍ prettier                                                                                            │
   16        │    ◍ pyright                                                                                             │
   17 -- opti│    ◍ stylelint                                                                                           │
   18 vim.opt│    ◍ stylua                                                                                              │
   19        │    ◍ terraform-ls terraformls                                                                            │
   20 lab2: I│    ◍ typescript-language-server tsserver                                                                 │
   21        │    ◍ vim-language-server vimls

lab3: Using Python

https://www.youtube.com/watch?v=lUssfjNzGNg
https://www.youtube.com/watch?v=onu_upaLKo4
https://github.com/LunarVim/starter.lvim (Select Python)

* require 'debugpy' from Mason
* pip install flake8
* Use 'space' 'C' to switch virual environment

lab4: Docker image with neovim lunar

https://www.youtube.com/watch?v=Qf9gfx7gWEY

git clone https://github.com/IfCodingWereNatural/minimal-nvim/tree/lunarvim
git checkout lunarvim
tar cvfp lunarvim-settings.tgz ~/.config/lvim
rm -rf ~/.config/lvim/
cp -r minimal-nvim/lvim ~/.config/lvim

- changing color scheme <space> s -> p
- using previous open file <space> Shift S -> s

$ tree ~/.config/lvim/lua/user/
/home/bigchoo/.config/lvim/lua/user/
├── autocmds.lua
├── banners.lua  <-- random banner after exec vim
├── colorscheme.lua
├── dashboard.lua
├── filetype.lua
├── keymaps.lua <--- key mappings
├── kind.lua
├── lsp.lua <--- langauge server using 'tsserver' (typescript)
├── options.lua <--- vim options
├── plugins.lua
├── statusline.lua
└── which-key.lua

- enable with terminal vsp|te or sp|te

lab5: rolling release

https://www.youtube.com/watch?v=NlRxRtGpHHk
# training-neovim
