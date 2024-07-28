return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,

	config = function()
		function DeleteBufferWithoutClosingWindow()
			local cur_buf = vim.api.nvim_get_current_buf()
			local buffers = vim.api.nvim_list_bufs()
			local replacement_buf = nil

			-- Attempt to find an alternative buffer that is not the current one and is loaded
			for _, buf in ipairs(buffers) do
				if buf ~= cur_buf and vim.api.nvim_buf_is_loaded(buf) and vim.fn.buflisted(buf) == 1 then
					replacement_buf = buf
					break
				end
			end

			-- If no alternative buffer is found, check for any buffer, even if not loaded
			if replacement_buf == nil then
				for _, buf in ipairs(buffers) do
					if buf ~= cur_buf and vim.fn.buflisted(buf) == 1 then
						replacement_buf = buf
						break
					end
				end
			end

			-- If still no buffer is found, create a new one
			if replacement_buf == nil then
				replacement_buf = vim.api.nvim_create_buf(true, false)
			end

			-- Set the found or new buffer to the current window
			vim.api.nvim_win_set_buf(0, replacement_buf)

			-- Delete the original buffer
			vim.api.nvim_buf_delete(cur_buf, { force = true })
		end

		local wk = require("which-key")
		wk.register({
			w = {
				name = "Window",
				w = { "<C-w>w", "Attach" },
				d = { "<cmd>clo<CR>", "Close Window" },
				l = { "<cmd>vsp<CR>", "Split right" },
				j = { "<cmd>sp<CR>", "Split down" },
			},
			b = {
				name = "Buffer",
				D = { "<cmd>bwipeout<CR>", "Wipe Buffer" },
				d = { "<cmd>lua DeleteBufferWithoutClosingWindow()<CR>", "Delete Buffer" },
				g = { "<cmd>BufferLinePick<CR>", "Go to Buffer" },
			},
			q = {
				name = "Quit",
				q = { "<cmd>qa<CR>", "Quit" },
				Q = { "<cmd>qa!<CR>", "Quit (force)" },
			},
			k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
			l = {
				name = "Lsp",
				i = { "<cmd>LspInfo<CR>", "Lsp Info" },
				d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
				f = { "<cmd>lua vim.lsp.buf.format({ timeout_ms = 3000, async = true })<CR>", "Format" },
				l = { "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", "Inlay Hints" },
				c = { "<cmd>lua vim.lsp.codelens.display()<CR>", "CodeLens" },
			},
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			L = { "<cmd>Lazy<CR>", "Lazy" },
			f = {
				name = "Find",
				f = { "<cmd>Telescope find_files<CR>", "Find Files" },
				g = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
				b = { "<cmd>Telescope buffers<CR>", "Find in Buffers" },
				h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
			},
			m = { "<cmd>Mason<CR>", "Mason" },
			s = {
				name = "Search",
				b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
				R = { "<cmd>Telescope registers<cr>", "Registers" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				C = { "<cmd>Telescope commands<cr>", "Commands" },
			},
		}, { prefix = "<leader>" })
	end,
}
