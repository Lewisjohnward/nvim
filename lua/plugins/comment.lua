-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
	"numToStr/Comment.nvim",
	opts = function()
		return {
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		}
	end,
	lazy = false,
}
