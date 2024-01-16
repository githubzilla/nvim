"Enable treesitter fold can make clang-format extremely slo
"set foldlevel=5
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "vim", "lua", "rust", "bash", "org", "norg","java"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false
 },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
--require("nvim-treesitter").statusline{
--    indicator_size = 100,
--    type_patterns = {'class', 'function', 'method'},
--    transform_fn = function(line) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
--    separator = ' -> '
--}
EOF

