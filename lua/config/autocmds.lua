-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_active_clients({ name = "efm" })
		if vim.tbl_isempty(efm) then
			return
		end
		vim.lsp.buf.format({ name = "efm" })
	end,
})

local group = vim.api.nvim_create_augroup("myGroup", { clear = true })

vim.api.nvim_create_autocmd("CursorHold", { command = "echo 'hold'", group = group })
vim.api.nvim_create_autocmd("BufEnter", { command = ":set formatoptions-=ro", group = group })

-- :h events displays all events
-- BufAdd
-- BufDelete
-- BufEnter
-- BufFilePost
-- BufFilePre
-- BufHidden
-- BufLeave
-- BufModifiedSet
-- BufNew
-- BufNewFile
-- BufReadPre
-- BufReadPost
--
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
-- 	group = group,
-- 	callback = function()
-- 		print("you got it")
-- 	end,
-- })

-- If you want to constrain your command to use a specific file path or ending you can use patters
-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--   pattern = {"*.c", "*.h"},
--     command = "echo 'Entering a C or C++ file'",
--     })
