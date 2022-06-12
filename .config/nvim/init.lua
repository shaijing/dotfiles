-- basic settings
require("settings")

-- color
require("colorscheme")

-- autocmds
require("autocmds")

-- keybindings
require("keybindings")

-- plugins
require("plugins")
require("plugins.config.nvim-treesitter")
require("plugins.config.nvim-autopairs")
require("plugins.config.nvim-cmp")
require("plugins.config.lspui")
require("plugins.config.lualine")

-- lsp
require("lsp")




--learn
-- local m = require("module")
-- local ok, _ = pcall(require, 'module')
-- if not ok 
-- then
--     print("No Module")
-- else
--     print("Module load!")
-- end

-- m.isLoaded()
