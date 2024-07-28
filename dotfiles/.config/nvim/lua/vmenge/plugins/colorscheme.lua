return {
	{
		"bluz71/vim-nightfly-guicolors",
		-- lazy = true,
		-- priority = 1000,
		-- config = function()
		--   vim.cmd([[colorscheme nightfly]])
		-- end,
	},
	{
		"EdenEast/nightfox.nvim",
		-- lazy = true,
		config = function()
			-- vim.cmd.colorscheme("nightfox")
			-- vim.cmd.colorscheme("carbonfox")
		end,
	},
	{
		"rose-pine/neovim",
		-- lazy = true,
		-- name = "rose-pine",
		-- config = function()
		--   vim.cmd([[colorscheme rose-pine]])
		-- end,
	},
	{
		"catppuccin/nvim",
		-- lazy = true,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
			})

			-- vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"shatur/neovim-ayu",
		lazy = true,
		config = function()
			require("ayu").setup({
				mirage = false,
			})

			-- vim.cmd([[colorscheme ayu]])
		end,
	},
	{
		"dracula/vim",
		name = "dracula",
		config = function()
			-- vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"maxmx03/solarized.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.o.background = "light" -- or 'dark'

			-- vim.cmd.colorscheme("solarized")
		end,
	},
	{
		"shaunsingh/nord.nvim",
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = false
		end,
	},
	{ "projekt0n/github-nvim-theme" },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = false,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})

			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"Abstract-IDE/Abstract-cs",
		config = function()
			-- vim.cmd.colorscheme("abscs")
		end,
	},
	{
		"nvimdev/zephyr-nvim",
		config = function()
			-- vim.cmd.colorscheme("zephyr")
		end,
	},
	{
		"Everblush/nvim",
		config = function()
			require("everblush").setup({
				-- Default options
				override = {},
				transparent_background = false,
				nvim_tree = {
					contrast = false,
				},
			})

			-- vim.cmd.colorscheme("everblush")
		end,
	},
	{
		"2nthony/vitesse.nvim",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
		config = function()
			require("vitesse").setup({
				comment_italics = true,
				transparent_background = true,
				transparent_float_background = true, -- aka pum(popup menu) background
				reverse_visual = false,
				dim_nc = false,
				cmp_cmdline_disable_search_highlight_group = false, -- disable search highlight group for cmp item
				-- if `transparent_float_background` false, make telescope border color same as float background
				telescope_border_follow_float_background = false,
				-- similar to above, but for lspsaga
				lspsaga_border_follow_float_background = false,
				-- diagnostic virtual text background, like error lens
				diagnostic_virtual_text_background = false,

				-- override the `lua/vitesse/palette.lua`, go to file see fields
				colors = {},
				themes = {},
			})

			-- vim.cmd.colorscheme("vitesse")
		end,
	},
	{
		"nyngwang/nvimgelion",
		config = function()
			-- vim.cmd.colorscheme("nvimgelion")
		end,
	},
	{
		"ayu-theme/ayu-vim",
		config = function()
			-- vim.cmd.colorscheme("ayu")
		end,
	},
	{
		"cpea2506/one_monokai.nvim",
		config = function()
			-- require("one_monokai").setup({
			-- 	transparent = true,
			-- 	colors = {},
			-- 	themes = function(colors)
			-- 		return {}
			-- 	end,
			-- 	italics = true,
			-- })

			-- vim.cmd.colorscheme("one_monokai")
		end,
	},
	{
		"tanvirtin/monokai.nvim",
		config = function()
			-- require("monokai").setup({ palette = require("monokai").pro })
			-- require("monokai").setup({ palette = require("monokai").soda })
			-- require("monokai").setup({ palette = require("monokai").ristretto })
			-- vim.cmd.colorscheme("monokai")
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			-- require("monokai-pro").setup()
		end,
	},
	{
		"xiyaowong/transparent.nvim",
	},
	{
		"akinsho/horizon.nvim",
		opts = {
			plugins = {
				cmp = true,
				indent_blankline = true,
				nvim_tree = true,
				telescope = true,
				which_key = true,
				barbar = true,
				notify = true,
				symbols_outline = true,
				neo_tree = true,
				gitsigns = true,
				crates = true,
				hop = true,
				navic = true,
				quickscope = true,
				flash = true,
			},
		},
		config = function()
			-- vim.cmd.colorscheme("horizon")
		end,
	},
	{
		"kdheepak/monochrome.nvim",
		config = function()
			-- vim.cmd.colorscheme("monochrome")
		end,
	},
	{
		"andreasvc/vim-256noir",
		config = function() end,
	},
	{
		"Alligator/accent.vim",
		config = function()
			-- vim.cmd.colorscheme("accent")
		end,
	},
	{
		"chriskempson/base16-vim",
		config = function() end,
	},
	{
		"ntk148v/komau.vim",
		config = function()
			-- vim.cmd.colorscheme("komau")
		end,
	},
	{
		"Jorengarenar/vim-darkness",
		config = function()
			-- vim.cmd.colorscheme("darkness")
		end,
	},
	{
		"jesseleite/nvim-noirbuddy",
		config = function()
			-- vim.cmd.colorscheme("noirbuddy")
		end,
	},
	{
		"ewilazarus/preto",
		config = function()
			-- vim.cmd.colorscheme("preto")
		end,
	},
	{
		"hardselius/warlock",
		config = function()
			-- vim.cmd.colorscheme("warlock")
		end,
	},
	{
		"rost/vim-lesser",
		config = function()
			-- vim.cmd.colorscheme("lesser")
		end,
	},
	{
		"pgdouyon/vim-yin-yang",
		config = function()
			--  i dunno
		end,
	},
}