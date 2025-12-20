return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>sr", "<cmd>AutoSession search<CR>", desc = "Session search" },
    { "<leader>ss", "<cmd>AutoSession save<CR>", desc = "Save session" },
    { "<leader>sa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
  },
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
	  enabled = true,
	  auto_save = false, -- it's better off togglable than anything IMHO
	  auto_restore = true, -- Enables/disables auto restoring session on start
	  auto_create = true,
	  auto_restore_last_session = false,
	  cwd_change_handling = false, -- Automatically save/restore sessions when changing directories
	  single_session_mode = false,
	  -- Filtering
	  suppressed_dirs = {"~/", "~/Downloads", "~/Videos"}, -- Suppress session restore/create in certain directories
	  allowed_dirs = nil, -- Allow session restore/create in certain directories
	  bypass_save_filetypes = { "alpha", "dashboard", "snacks_dashboard", "oil" },
	  close_filetypes_on_save = { "checkhealth" , "help", "gitignore"}, -- Buffers with matching filetypes will be closed before saving
	  close_unsupported_windows = true, -- Close windows that aren't backed by normal file before autosaving a session
	  preserve_buffer_on_restore = nil, -- Function that returns true if a buffer should be preserved when restoring a session

	  -- Deleting
	  auto_delete_empty_sessions = true, -- Enables/disables deleting the session if there are only unnamed/empty buffers when auto-saving
	  purge_after_minutes = 2880, -- Clear unused sessions after 2 days

	  -- Saving extra data
	  save_extra_data = nil, -- Function that returns extra data that should be saved with the session. Will be passed to restore_extra_data on restore
	  restore_extra_data = nil, -- Function called when there's extra data saved for a session

	  -- Argument handling
	  args_allow_single_directory = true, -- Follow normal session save/load logic if launched with a single directory as the only argument
	  args_allow_files_auto_save = false, -- Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not load any existing session first. Can be true or a function that returns true when saving is allowed. See documentation for more detail

	  -- Misc
	  log_level = "error", -- Sets the log level of the plugin (debug, info, warn, error).
	  root_dir = vim.fn.stdpath("data") .. "/sessions/", -- Root dir where sessions will be stored
	  show_auto_restore_notif = true, -- Whether to show a notification when auto-restoring
	  restore_error_handler = nil,
	  continue_restore_on_error = true, -- Keep loading the session even if there's an error
	  lsp_stop_on_restore = false,
	  lazy_support = true,
	  legacy_cmds = true,

	  ---@type SessionLens
	  session_lens = {
	    picker = "fzf",
	    load_on_setup = true,
	    picker_opts = nil,
	    previewer = "summary", -- 'summary'|'active_buffer'|function - How to display session preview. 'summary' shows a summary of the session, 'active_buffer' shows the contents of the active buffer in the session, or a custom function

	    ---@type SessionLensMappings
	    mappings = {
	      -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
	      delete_session = { "i", "<C-d>" }, -- mode and key for deleting a session from the picker
	      alternate_session = { "i", "<C-s>" }, -- mode and key for swapping to alternate session from the picker
	      copy_session = { "i", "<C-y>" }, -- mode and key for copying a session from the picker
	    },

	    ---@type SessionControl
	    session_control = {
	      control_dir = vim.fn.stdpath("data") .. "/auto_session/",
	      control_filename = "session_control.json",
   },
  },
 },
}
