lua <<EOF
require('lint').linters_by_ft = {
  cpp = {'cpplint',},
  c   = {'cpplint',},
}
require('lint.linters.cpplint').args = {
  '--linelength=80',
  '--filter=-readability/braces,-whitespace/braces,-whitespace/comments,-whitespace/indent,-whitespace/newline,-whitespace/operators,-whitespace/parens,-build/include_subdir',
}
EOF

autocmd BufReadPost,BufWritePost *.cpp lua require('lint').try_lint()
autocmd BufReadPost,BufWritePost *.h lua require('lint').try_lint()
autocmd BufReadPost,BufWritePost *.cc lua require('lint').try_lint()
autocmd BufReadPost,BufWritePost *.c lua require('lint').try_lint()
