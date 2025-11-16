require("config.lazy")
require("config.lsp")
require("config.options")
require("config.keymaps")
require("config.autocmds")


-- Set the colorscheme here, 'cause why not?
vim.cmd.colorscheme 'base16-black-metal'




-- INFO: all the helper snippets I defined go here!
function RunCommand(command)
    -- LOGIC: Split output into lines -> create quickfix items -> populate quickfix list (temporarily) and display
    local output = vim.fn.system(command)
    local lines = {}
    for line in output:gmatch("[^\r\n]+") do
        if line ~= "" then
            table.insert(lines, {filename = "", text = line})
        end
    end
    vim.fn.setqflist({}, ' ', { title = "output: " .. command, items = lines })
    vim.cmd("copen 12")
end
