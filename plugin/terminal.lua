
local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}

local function create_floating_window(opts)
    opts = opts or {}

    -- 99% and 30% of the screen:
    local width = opts.width or math.floor(vim.o.columns * 1)
    local height = opts.height or math.floor(vim.o.lines * 0.47)
    -- Calculate the position to place it at bottom of the window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 1)

    -- Create a buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    end

    -- Define window configuration
    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        -- border = "rounded",
	border = {"T", " ", " ", " ", " ", " ", " ", " ",},
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local toggle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window({ buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal() vim.cmd.colorscheme('base16-black-metal')
        end
        -- unlist the terminal from buffer list
        vim.api.nvim_set_option_value("buflisted", false, { buf = state.floating.buf })
        vim.cmd("startinsert")
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.keymap.set({ "n", "t" }, "<M-t>", toggle_terminal, { desc = "Toggle terminal" })
