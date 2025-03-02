return function()
  local lint = require('lint')

  -- Configure linters for file types
  lint.linters_by_ft = {
    cpp = {'cpplint'},
    c = {'cpplint'},
  }

  -- Configure cpplint arguments
  lint.linters.cpplint.args = {
    '--linelength=80',
    '--filter=-readability/braces,-whitespace/braces,-whitespace/comments,-whitespace/indent,-whitespace/newline,-whitespace/operators,-whitespace/parens,-build/include_subdir',
  }

  -- Create autocommands for linting
  vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
    pattern = { "*.cpp", "*.h", "*.cc", "*.c" },
    callback = function()
      lint.try_lint()
    end,
  })
end 