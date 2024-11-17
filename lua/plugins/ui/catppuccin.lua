local catppuccin = { "catppuccin/nvim" }

catppuccin.priority = 1000

catppuccin.config = function()
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = true,
		custom_highlights = function(colors)
			return {
				LazyNormal = { bg = colors.mantle, fg = colors.text },
				MasonNormal = { bg = colors.mantle, fg = colors.text },
				NormalFloat = { bg = colors.mantle, fg = colors.text },
				LineNrAbove = { fg = colors.surface2, bold = true },
				LineNr = { fg = colors.peach, bold = true },
				LineNrBelow = { fg = colors.surface2, bold = true },
			}
		end,
	})

	vim.cmd.colorscheme("catppuccin")
end

return catppuccin
