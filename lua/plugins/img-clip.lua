return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		-- file and directory options
		dir_path = "assets",
		extension = "png",
		file_name = "%Y-%m-%d-%H-%M-%S",
		use_absolute_path = false,
		relative_to_current_file = false,

		-- logging options
		verbose = true,

		-- template options
		template = "$FILE_PATH",
		url_encode_path = false,
		relative_template_path = true,
		use_cursor_in_template = true,
		insert_mode_after_paste = true,
		insert_template_after_cursor = true,

		-- prompt options
		prompt_for_file_name = true,
		show_dir_path_in_prompt = false,

		-- image options
		process_cmd = "",
		copy_images = false,
		download_images = true,
		formats = { "jpeg", "jpg", "png" },

		-- drag and drop options
		drag_and_drop = {
			enabled = true,
			insert_mode = false,
		},
	},
	keys = {
		-- suggested keymap
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}
