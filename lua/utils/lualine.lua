-- lualine config ~~stolen~~ borrowed from edr3x

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "VonHeikemen/fine-cmdline.nvim",},
    opts = function()
        local lspStatus = {
            function()
                local msg = "No LSP detected"
                local buf_ft = vim.api.nvim_get_option_value("filetype", {})
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = "",
            color = { fg = "#d3d3d3" },
        }
	    -- set StatusLine to be transparent
	local transparent = function()
	    vim.api.nvim_create_autocmd({ "UiEnter", "ColorScheme" }, {
		callback = function()
		    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
		end,
	    })

	    local colors = {
		bg = "NONE",
		fg = "#B0BEC5",
		fg2 = "#3e445e",
		orange = "#e78a4e",
		highlight = "#89DDFF",
	    }
	    return {
		normal = {
		    a = { fg = colors.highlight, bg = colors.bg, gui = "bold" },
		    b = { fg = colors.orange, bg = colors.bg },
		    c = { fg = colors.color2, bg = colors.bg },
		},
		insert = {
		    a = { fg = colors.highlight, bg = colors.bg, gui = "bold" },
		    b = { fg = colors.orange, bg = colors.bg },
		},
		visual = {
		    a = { fg = colors.highlight, bg = colors.bg, gui = "bold" },
		    b = { fg = colors.orange, bg = colors.bg },
		},
		replace = {
		    a = { fg = colors.highlight, bg = colors.bg, gui = "bold" },
		    b = { fg = colors.orange, bg = colors.bg },
		},
		inactive = {
		    c = { fg = colors.fg2, bg = colors.bg },
		    a = { fg = colors.fg2, bg = colors.bg, gui = "bold" },
		    b = { fg = colors.fg2, bg = colors.bg },
		},
	    }
	end

        local buffer = {
            "buffers",
            mode = 0,
            show_filename_only = true,
            show_modified_status = true,
            hide_filename_extension = false,
            symbols = { alternate_file = "" },
            buffers_color = {
                active = { fg = "#d3d3d3" },
                inactive = { fg = "#414141" },
            },
        }

        local diagnostic = {
            "diagnostics",
            symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " ",
            },
            icon = "|",
        }

        local diff = {
            "diff",
            symbols = {
                added = " ",
                modified = " ",
                removed = " ",
            },
        }

        return {
            options = {
                icons_enabled = true,
		theme = transparent(),
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha", "lazy", "mason" },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { buffer },
                lualine_x = { diff, diagnostic },
                lualine_y = { lspStatus, "filetype", "location" },
                lualine_z = { "progress" },
            },
        }
    end,
}
