"== ranger.vim ==
lua <<EOF
local ranger_nvim = require("ranger-nvim")
ranger_nvim.setup{
  enable_cmds = true,
  replace_netrw = true,
  keybinds = {
    ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
    ["oh"] = ranger_nvim.OPEN_MODE.split,
    ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
    ["or"] = ranger_nvim.OPEN_MODE.rifle,
  },
  ui = {
    border = "single",
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5,
  },
}
EOF

nnoremap <Leader>rf :Ranger<CR>
