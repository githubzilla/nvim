-- Auto Save Configuration
return function()
  vim.g.auto_save = 1  -- enable AutoSave on Vim startup
  -- vim.g.auto_save = 0

  -- Uncomment to enable auto save only for specific file types
  -- vim.api.nvim_create_augroup("ft_autosave", { clear = true })
  -- vim.api.nvim_create_autocmd("FileType", {
  --   group = "ft_autosave",
  --   pattern = "markdown",
  --   callback = function() vim.b.auto_save = 1 end
  -- })
  -- vim.api.nvim_create_autocmd("FileType", {
  --   group = "ft_autosave",
  --   pattern = {"c", "cpp", "rs", "vim"},
  --   callback = function() vim.b.auto_save = 1 end
  -- })

  -- Small updatetime for auto save to work more smoothly with auto_save_event includes CursorHold
  vim.opt.updatetime = 1000

  -- Set auto save events
  vim.g.auto_save_events = {"InsertLeave", "TextChanged"}
end 