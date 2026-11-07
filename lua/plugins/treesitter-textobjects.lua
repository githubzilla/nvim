-- Treesitter（nvim-treesitter main 分支 / Neovim 0.12）
--
-- main 分支已删除 nvim-treesitter.configs：
--   * highlight / indent / incremental_selection 交给 Neovim 原生实现
--   * textobjects 用 nvim-treesitter-textobjects 自己的 setup()
-- 语言列表用 require('nvim-treesitter').install{}，异步安装。

return function()
  local langs = {
    "c", "cpp", "vim", "lua", "rust", "bash", "java", "vimdoc",
    "markdown", "markdown_inline", "json", "yaml", "python", "html",
    "toml", "query", "regex",
  }

  -- 安装缺失的 parser（已装则 no-op，异步执行不阻塞启动）
  local ok, ts = pcall(require, "nvim-treesitter")
  if ok and ts.install then
    ts.install(langs)
  end

  -- 内置增量选择（原 incremental_selection.enable = true 的等价物）
  -- Neovim 0.12 原生 API：vim.treesitter.select_parent / select_child
  local inc_sel = require("vim.treesitter._select")
  vim.keymap.set({ "n", "x" }, "gnn", function()
    -- 初始化选择：选中当前节点
    if vim.fn.mode() ~= "v" then
      vim.cmd("normal! v")
    end
  end, { desc = "Start treesitter node selection" })
  vim.keymap.set({ "x", "n" }, "grn", function()
    inc_sel.select_child(1)
  end, { desc = "Select child node" })
  vim.keymap.set({ "x", "n" }, "grc", function()
    inc_sel.select_parent(1)
  end, { desc = "Select parent node" })
  vim.keymap.set({ "x", "n" }, "grm", function()
    inc_sel.select_parent(-1)
  end, { desc = "Select previous node" })

  -- syntax-aware textobjects
  require("nvim-treesitter-textobjects").setup({
    select = {
      lookahead = true,
      selection_modes = {
        ["@parameter.outer"] = "v",
        ["@function.outer"] = "V",
        ["@class.outer"] = "<c-v>",
      },
      include_surrounding_whitespace = true,
    },
  })

  local sl = require("nvim-treesitter-textobjects.select")
  local sw = require("nvim-treesitter-textobjects.swap")

  local function sel(query, desc)
    return function()
      sl.select_textobject(query, "textobjects")
    end
  end

  vim.keymap.set({ "x", "o" }, "af", sel("@function.outer"), { desc = "Select outer function" })
  vim.keymap.set({ "x", "o" }, "if", sel("@function.inner"), { desc = "Select inner function" })
  vim.keymap.set({ "x", "o" }, "ac", sel("@class.outer"), { desc = "Select outer class" })
  vim.keymap.set({ "x", "o" }, "ic", sel("@class.inner"), { desc = "Select inner class" })
  vim.keymap.set({ "x", "o" }, "as", sel("@local.scope"), { desc = "Select language scope" })

  vim.keymap.set("n", "<leader>a", function()
    sw.swap_next("@parameter.inner")
  end, { desc = "Swap with next parameter" })
  vim.keymap.set("n", "<leader>A", function()
    sw.swap_previous("@parameter.inner")
  end, { desc = "Swap with previous parameter" })

  -- 为常见 filetype 开启 treesitter 高亮 + 缩进（main 分支不再自动开）
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserTSStart", { clear = true }),
    callback = function(args)
      local ft = vim.bo[args.buf].filetype
      local has_parser = vim.treesitter.language.add
        and pcall(vim.treesitter.language.add, vim.treesitter.language.get_lang(ft) or ft)
      if has_parser then
        pcall(vim.treesitter.start, args.buf, ft)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end
