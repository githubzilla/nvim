return function()
  -- Set session options
  vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

  -- Setup auto-session
  require('auto-session').setup({
    log_level = 'info',
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = nil,
    auto_session_use_git_branch = true,
    bypass_session_save_file_types = nil,
    session_lens = {
      -- telescope is disabled, so we need to set this to false
      load_on_setup = false,
    },
  })
end
